//
//  CurrencyConverter.m
//  Converter
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "CurrencyConverter.h"

@interface CurrencyConverter()

@end

@implementation CurrencyConverter

-( NSDecimalNumber *)currencyConverter:( NSDecimalNumber *)baseValue and:( NSDecimalNumber *)course
{
    NSDecimalNumber *result = [ baseValue decimalNumberByMultiplyingBy:course ];
    //NSRoundingMode roundingMode;
    //NSDecimalMultiply(result, baseValue, course, roundingMode);
    //NSDecimalDivide( result, baseValue, course, roundingMode );
    //result = baseValue * course;
    return result;
}

@end
