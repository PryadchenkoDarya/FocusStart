//
//  AppConfig.h
//  Converter
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConfig : NSObject

@property( nonatomic, readonly ) NSURL *exchangeRateURL;
@property( nonatomic, readonly ) BOOL useRemoteExchangeRates;

- (instancetype)initWithConfigName:(NSString *)configName;

-( instancetype ) init NS_UNAVAILABLE;

@end
