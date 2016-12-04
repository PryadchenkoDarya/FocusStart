//
//  CurrencyViewControllerDelegate.h
//  Converter
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"

@protocol CurrencyViewControllerDelegate < NSObject >

-( void )didSelectCurrency:( Currency *)currency;

@end
