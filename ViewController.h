//
//  ViewController.h
//  Converter
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrencyViewControllerDelegate.h"
#import "AppContext.h"

@interface ViewController : UIViewController<CurrencyViewControllerDelegate>

@property( nonatomic, strong, readonly ) AppContext *appContext;

-( instancetype ) initWithAppContext:( AppContext *)anAppContext;

@end

