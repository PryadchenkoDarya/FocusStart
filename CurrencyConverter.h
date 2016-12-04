//
//  CurrencyConverter.h
//  Converter
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyConverter : NSObject

-( NSDecimalNumber * )currencyConverter:( NSDecimalNumber * )baseValue and :( NSDecimalNumber * )course;

@end

