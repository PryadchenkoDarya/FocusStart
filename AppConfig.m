//
//  AppConfig.m
//  Converter
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig

- (void)loadConfig:(NSString *)configName
{
    NSString *localConfigPath = [[NSBundle mainBundle] pathForResource:configName.stringByDeletingPathExtension
                                                                ofType:configName.pathExtension];
    
    NSDictionary *contents = [NSDictionary dictionaryWithContentsOfFile:localConfigPath];
    
    assert(nil != contents);
    
    _exchangeRateURL = [NSURL URLWithString:contents[NSStringFromSelector(@selector(exchangeRateURL))]];
    _useRemoteExchangeRates = [contents[NSStringFromSelector(@selector(useRemoteExchangeRates))] boolValue];
}

- ( instancetype )initWithConfigName:(NSString *)configName
{
    assert( nil != configName );
    assert( NO == [ configName isEqualToString:@"" ] );
    
    self = [super init];
    
    [self loadConfig:configName];
    
    return self;
}

-( instancetype )init
{
    assert( NO );
    return nil;
}

@end
