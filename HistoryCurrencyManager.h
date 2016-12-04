//
//  HistoryCurrencyManager.h
//  Converter
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryCurrencyManager : NSObject

@property( nonatomic, copy, readonly ) NSArray< NSDate * >  *dates;

-( instancetype )init;

@end
