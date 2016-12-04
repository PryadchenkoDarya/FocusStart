//
//  AppController.h
//  Converter
//
//  Created by Student on 25.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppContext;

@interface AppController : NSObject

@property( nonatomic, strong, readonly ) AppContext *appContext;

- ( instancetype )initWithConfigName:( NSString * )configName;

- ( instancetype )init NS_UNAVAILABLE;

@end
