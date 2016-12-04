//
//  CurrencyDatasource.h
//  Converter
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrencyManager.h"
#import "HistoryCurrencyManager.h"

@interface CurrencyDatasource : NSObject< UITableViewDataSource, UITableViewDelegate >

@property( nonatomic, readonly ) Currency * selectedCurrency;

-( instancetype )initWithCurrencyManager:(CurrencyManager *) aCurrencyManager;
-( instancetype )init NS_UNAVAILABLE;

@end
