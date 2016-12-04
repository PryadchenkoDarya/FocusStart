//
//  RemoteExchangeRatesManager.m
//  Converter
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "RemoteExchangeRatesManager.h"

#import "Currency.h"
#import "RequestHelper.h"
#import "AppConfig.h"

@implementation RemoteExchangeRatesManager
{
    AppConfig *config;
    
    NSDictionary *currencyRates;
    RequestHelper<NSDictionary *> *requestHelper;
    
    Currency *currentCurrency;
    Currency *baseCurrency;
    
    void (^completionHandler)(NSNumber *);
}

@synthesize errorHandler = _errorHandler;

- (instancetype)initWithAppConfig:(AppConfig *)appConfig baseCurrency:(Currency *)aBaseCurrency
{
    assert( nil != appConfig );
    assert( nil != aBaseCurrency );
    
    self = [super init];
    
    config = appConfig;
    baseCurrency = aBaseCurrency;
    
    return self;
}

- (void)loadRates
{
    currencyRates = nil;
    
    NSDictionary *params = @{@"base": baseCurrency.code};
    
    typeof(self) __weak weakSelf = self;
    requestHelper = [[RequestHelper<NSDictionary *> alloc] initWithAppConfig:config apiMethod:@"/latest" params:params];
    
    requestHelper.responseHandler = ^(NSDictionary *response)
    {
        [weakSelf updateRates:response];
    };
    
    requestHelper.failureHandler = ^(NSError *error)
    {
        [weakSelf handleError:error];
    };
    
    [requestHelper execute];
}

- (void)exchangeRateForCurrency:(Currency *)currency completion:(void (^)(NSNumber *))completion
{
    if( [currency isEqual:currentCurrency] )
    {
        completion(currencyRates[currency.code]);
        return;
    }
    
    currentCurrency = currency;
    completionHandler = [completion copy];
    
    [self loadRates];
}

- (void)updateRates:(NSDictionary *)rates
{
    currencyRates = rates[@"rates"];
    
    if( NULL != completionHandler )
    {
        NSNumber *rate = currencyRates[currentCurrency.code];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(rate);
            completionHandler = NULL;
        });
    }
}

- (void)handleError:(NSError *)error
{
    if( NULL != _errorHandler )
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            _errorHandler(error);
        });
    }
}

- (instancetype)init
{
    assert(NO);
    return nil;
}

@end
