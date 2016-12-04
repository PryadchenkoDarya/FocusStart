//
//  CurrenceViewController.m
//  Converter
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "CurrencyViewController.h"
#import "ViewController.h"
#import "CurrencyViewControllerDelegate.h"
#import "CurrencyDatasource.h"


@interface CurrencyViewController ()

@end

@implementation CurrencyViewController
{
    IBOutlet UITableView * TableCurrency;
    CurrencyDatasource * CurrencyDS;
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Select Currency";
    CurrencyManager * CManager = [ [ CurrencyManager alloc ] init ];
    CurrencyDS = [ [ CurrencyDatasource alloc ] initWithCurrencyManager:CManager ];
    TableCurrency.dataSource = CurrencyDS;
    TableCurrency.delegate = CurrencyDS;
    [self configureNavigateItem];
}

-( void )configureNavigateItem
{
    UIBarButtonItem *doneButton=[ [ UIBarButtonItem alloc ] initWithTitle: @"Ready" style:UIBarButtonItemStyleDone target:self action:@selector( doneTapped ) ];
    self.navigationItem.rightBarButtonItem = doneButton;
}

-( void ) doneTapped
{
    [ CurrencyDS tableView:TableCurrency didSelectRowAtIndexPath:TableCurrency.indexPathForSelectedRow];
    [ self.delegate didSelectCurrency:CurrencyDS.selectedCurrency ];
}

- ( void )didReceiveMemoryWarning
{
    [ super didReceiveMemoryWarning ];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
