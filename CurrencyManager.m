//
//  CurrencyManager.m
//  Converter
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "CurrencyManager.h"
#import "Currency.h"


@implementation CurrencyManager

-( instancetype )init
{
    self = [ super init ];
    
    NSMutableArray *currencies = [ [ NSMutableArray alloc ] init ] ;

    [ currencies addObject:[ Currency currencyWithCode:@"USD" name:@"American dollar" ] ];
    [ currencies addObject:[ Currency currencyWithCode:@"AUD" name:@"Australian dollar" ] ];
    [ currencies addObject:[ Currency currencyWithCode:@"RUB" name:@"Russian ruble" ] ];
    [ currencies addObject:[ Currency currencyWithCode:@"GBP" name:@"Pound sterling" ] ];
    
    _currencies = [ currencies copy ];
    
    return self;
}

-( Currency * )defaultCurrency
{
    return _currencies.firstObject;
}

-( Currency * )baseCurrency
{
   // return [Currency currencyWithCode:@"RUB" name:@"Russain ruble"];
   
    NSString *localConfigPath = [[NSBundle mainBundle] pathForResource:@"config.plist".stringByDeletingPathExtension
                                                                ofType:@"config.plist".pathExtension];
    
    NSDictionary *contents = [NSDictionary dictionaryWithContentsOfFile:localConfigPath];
    return [Currency currencyWithCode:contents[NSStringFromSelector(@selector(codeBaseCurrency))] name:contents[NSStringFromSelector(@selector(currencyName))]];
}

@end
