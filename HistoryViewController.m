//
//  HistoryViewController.m
//  Converter
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryCurrencyManager.h"
#import "CurrencyDatasource.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController
{
    IBOutlet UITableView * TableDates;
    CurrencyDatasource * HistoryDS;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"History";
    [self configureNavigateItem];
}

-( void )configureNavigateItem
{
    UIBarButtonItem *doneButton=[ [ UIBarButtonItem alloc ] initWithTitle: @"Ready" style:UIBarButtonItemStyleDone target:self action:@selector( doneTapped ) ];
    self.navigationItem.rightBarButtonItem = doneButton;
}

-( void )doneTapped
{
    [ HistoryDS tableView:TableDates didSelectRowAtIndexPath:TableDates.indexPathForSelectedRow];
    [ self.delegate didSelectCurrency:HistoryDS.selectedCurrency ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
