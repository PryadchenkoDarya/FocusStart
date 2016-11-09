//
//  CurrencyViewController.h
//  Converter
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrencyViewControllerDelegate.h"

@interface CurrencyViewController : UIViewController

@property ( nonatomic, weak ) id<CurrencyViewControllerDelegate> delegate;

@end
