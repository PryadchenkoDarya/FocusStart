//
//  ExchangeRatesManager.m
//  Converter
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "ExchangeRatesManager.h"
#import "Currency.h"


@implementation ExchangeRatesManager

{
    NSDictionary *exchangeRates;
}

@synthesize errorHandler=_errorHandler;

- ( instancetype )init
{
    self = [ super init ];
    
    [ self makeExchangeRates ];
    
    return self;
}

- ( void )makeExchangeRates
{
    NSMutableDictionary *rates = [ [ NSMutableDictionary alloc ] init ];
    
    [rates setObject:@(63) forKey:@"USD"];
    [rates setObject:@(60) forKey:@"AUD"];
    [rates setObject:@(118) forKey:@"GBP"];
    [rates setObject:@(64) forKey:@"RUB"];
    
    exchangeRates = [rates copy];
}

- ( void )exchangeRateForCurrency:( Currency * )currency completion:(void (^)(NSNumber *))completion
{
    completion( exchangeRates[ currency.code ] );
}


@end
