//
//  CurrencyManager.h
//  Converter
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Currency;

@interface CurrencyManager : NSObject

@property( nonatomic, copy, readonly ) NSArray< Currency * >  *currencies;
@property( nonatomic, readonly ) Currency *defaultCurrency;
@property( nonatomic, readonly ) Currency *baseCurrency;
@property( nonatomic, readonly ) NSString *codeBaseCurrency;
@property( nonatomic, readonly ) NSString *currencyName;

-( instancetype )init;

@end
