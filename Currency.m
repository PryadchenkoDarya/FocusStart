//
//  Currency.m
//  Converter
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "Currency.h"

@implementation Currency

+( instancetype ) currencyWithCode:( NSString * )code name:( NSString * )name
{
    Currency *result = [ [ Currency alloc ] initWithCode:code name:name ];
    
    return result;
}

-( instancetype ) initWithCode:( NSString * )code name:( NSString * )name
{
    self = [ super init ];
    
    _code = [ code copy ];
    _name = [ name copy ];
    
    return self;
}

-( instancetype ) init
{
    assert( NO );
    return nil;
}

@end
