//
//  ExchangeRatesManager.h
//  Converter
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IExchangeRatesManager.h"

@interface ExchangeRatesManager : NSObject<IExchangeRatesManager>

-( instancetype )init;

@end
