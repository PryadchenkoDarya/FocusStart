//
//  Currency.h
//  Converter
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

@property( nonatomic, readonly ) NSString *name;
@property( nonatomic, readonly ) NSString *code;

+( instancetype ) currencyWithCode:( NSString * )code name:( NSString * )name;
-( instancetype ) initWithCode:( NSString * ) code name:( NSString * )name NS_DESIGNATED_INITIALIZER;
-( instancetype ) init NS_UNAVAILABLE;

@end
