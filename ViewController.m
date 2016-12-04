//
//  ViewController.m
//  Converter
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyConverter.h"
#import "CurrencyManager.h"
#import "CurrencyViewController.h"
#import "Currency.h"
#import "RequestHelper.h"
#import "HistoryViewController.h"

NSDecimalNumber * myCourse;

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController
{
    IBOutlet UITextField * inputTextField;
    IBOutlet UITextField * outputTextField;
    IBOutlet UILabel * baseCurrencyLabel;
    IBOutlet UILabel * selectedCurrencyLabel;
    CurrencyViewController * currencyVC;
    HistoryViewController * historyVC;
//    CurrencyManager * manager;
}

- (instancetype)initWithAppContext:(AppContext *)anAppContext
{
    assert( nil != anAppContext );
    
    self = [super initWithNibName:nil bundle:nil];
    
    _appContext = anAppContext;
    
    return self;
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    // Do any additional setup after loading the view, typically from a nib.
    inputTextField.delegate = self;
//    courseTextField.delegate = self;
    self.title = @"Currency Converter";
    myCourse = [ [ NSDecimalNumber  alloc ] initWithFloat:1.0 ];
    inputTextField.placeholder = @"0";
    outputTextField.placeholder = @"0";
//  baseCurrencyLabel.text = manager.baseCurrency.code;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    typeof(self) __weak weakSelf = self;
    self.appContext.exchangeRatesManager.errorHandler = ^(NSError *error)
    {
        [weakSelf handleError:error];
    };
}

-(void)handleError:(NSError *)error
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:error.localizedDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* actionCancel = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
}

- ( void )didReceiveMemoryWarning
{
    [ super didReceiveMemoryWarning ];
    // Dispose of any resources that can be recreated.
}

-( void )converter:( NSString * )sum
{
    CurrencyConverter * convert = [ [ CurrencyConverter alloc ] init ];
    NSDecimalNumber *base = [NSDecimalNumber decimalNumberWithString:sum ];
    NSDecimalNumber *res = [ convert currencyConverter:base and:myCourse ];
 //   NSNumberFormatter * formatter = [ NSNumberFormatter for ];
    NSString * itog;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    itog = [formatter stringFromNumber:[NSNumber numberWithDouble:res.doubleValue]];
    outputTextField.text = itog;
    
    //outputTextField.text = ( res ).stringValue;
}
/*
-( IBAction )onButtonTab
{
//    if ( inputTextField.text != nil )
//    {
        [ self converter:inputTextField.text ];
//    }
//    else
//        [ self converter:@"0"];
}*/

-( IBAction )course
{
//    myCourse = [ NSDecimalNumber decimalNumberWithString:courseTextField.text ];
    [ self converter:inputTextField.text ];
}

-( IBAction )selectCurrency
{
    //typedef(self) __weak weakSelf = self;
    
    currencyVC = [ [ CurrencyViewController alloc ] initWithNibName:nil bundle:nil ];
    
    currencyVC.delegate = self;
    [ self.navigationController pushViewController:currencyVC animated:YES ];
}

-( IBAction)historyCurrency
{
    historyVC = [ [ HistoryViewController alloc ] initWithNibName: nil bundle:nil ];
    
    historyVC.delegate = self;
    [ self.navigationController pushViewController:historyVC animated:YES ];
}

- ( BOOL )textIsValidValue:(NSString *)text textField:(UITextField *)textField
{
    BOOL result = NO;
    NSScanner *scanner = [ NSScanner scannerWithString:text ];
    
    if ( !(result = [scanner scanFloat:NULL] && [scanner isAtEnd] ) )
    {
        [self animateTextFieldOnError:textField];
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)animateTextFieldOnError:(UITextField *)textField {
    
    CAKeyframeAnimation * anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    anim.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-10.0f, 0.0f, 0.0f)],
                    [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(10.0f, 0.0f, 0.0f)]];
    anim.autoreverses = YES;
    anim.repeatCount = 2.0f;
    anim.duration = 0.1f;
    
    [textField.layer addAnimation:anim forKey:nil];
    textField.textColor = [UIColor blueColor];
}

-( BOOL )textField:( UITextField * )textField shouldChangeCharactersInRange:( NSRange )range replacementString:( NSString * )string
{
    //NSString * res = textField.text;
    NSString * result = inputTextField.text;
    result = [ result  stringByReplacingCharactersInRange: range withString: string ];
    BOOL validValue = NO;
    validValue = [ self textIsValidValue:result textField:inputTextField ];
    if( validValue == NO )
    {
        [ self converter:result ];
        return YES;
    }
    /*else if( textField == courseTextField )
    {
        myCourse = [NSDecimalNumber decimalNumberWithString:result ];
        [ self converter:inputTextField.text ];
        return YES;
    }*/
    return NO;
}

- (void)updateRate:(NSNumber *)rate
{
    myCourse = [ NSDecimalNumber decimalNumberWithDecimal:rate.decimalValue];
    [ self converter:inputTextField.text];
}

-( void )didSelectCurrency:( Currency * )currency
{
    [ self.navigationController popViewControllerAnimated:YES ];
    //courseTextField.text = currency.code;
    
    typeof( self ) __weak weakSelf = self;
    
       [self.appContext.exchangeRatesManager exchangeRateForCurrency:currency completion:^(NSNumber *rate) {
          [weakSelf updateRate:rate];
       }];
    selectedCurrencyLabel.text = currency.code;
}

-( void )onMainView
{
    [ self.navigationController popViewControllerAnimated:YES ];
}

@end
