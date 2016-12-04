//
//  CurrencyDatasource.m
//  Converter
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "CurrencyDatasource.h"
#import "CurrencyViewController.h"
#import "Currency.h"
#import "HistoryViewController.h"

static NSString * const REUSE_IDENTIFIER = @"currencyCell";

@implementation CurrencyDatasource
{
    CurrencyManager *currencyManager;
    HistoryCurrencyManager *historyManager;
}

-( instancetype )initWithCurrencyManager:( CurrencyManager * )aCurrencyManager
{
    self = [ super init ];
    currencyManager = aCurrencyManager;
    return self;
}

/*-( instancetype )initWithManager:( Manager * )aManager
{
    self = [ super init ];
    Manager = aManager;
    return self;
}*/

-( NSInteger )tableView:( UITableView * )tableView numberOfRowsInSection:( NSInteger) section
{
    return currencyManager.currencies.count;
}

/*-( NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return historyManager.dates.count;
}*/

-( UITableViewCell * )tableView:( UITableView * )tableView cellForRowAtIndexPath:( NSIndexPath * )indexPath
{
    UITableViewCell * cell = [ tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER ];
    
    if( nil == cell )
    {
        cell = [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:REUSE_IDENTIFIER ];
    }
    
    cell.textLabel.text = currencyManager.currencies[ indexPath.row ].name;
    cell.detailTextLabel.text = currencyManager.currencies[ indexPath.row ].code;
    
    return cell;
}

-( void )tableView:( UITableView * )tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    _selectedCurrency =currencyManager.currencies[ indexPath.row ];
}

-( instancetype )init
{
    assert( NO );
    return nil;
}

@end
