//
//  HistoryCurrencyManager.m
//  Converter
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "HistoryCurrencyManager.h"

@implementation HistoryCurrencyManager

-( instancetype )init
{
    self = [ super init ];
    
    NSMutableArray *dates = [ [ NSMutableArray alloc ] init ] ;
    
    [ dates addObject:@"01.11.2016" ];
    [ dates addObject:@"02.11.2016" ];
    [ dates addObject:@"03.11.2016" ];
    [ dates addObject:@"04.11.2016" ];
    [ dates addObject:@"05.11.2016" ];
    [ dates addObject:@"06.11.2016" ];
    [ dates addObject:@"07.11.2016" ];
    [ dates addObject:@"08.11.2016" ];
    [ dates addObject:@"09.11.2016" ];
    [ dates addObject:@"10.11.2016" ];
    [ dates addObject:@"11.11.2016" ];
    [ dates addObject:@"12.11.2016" ];
    [ dates addObject:@"13.11.2016" ];
    [ dates addObject:@"14.11.2016" ];
    [ dates addObject:@"15.11.2016" ];
    [ dates addObject:@"16.11.2016" ];
    [ dates addObject:@"17.11.2016" ];
    [ dates addObject:@"18.11.2016" ];
    [ dates addObject:@"19.11.2016" ];
    [ dates addObject:@"20.11.2016" ];
    
    _dates = [dates copy ];
    
    return self;
}

@end
