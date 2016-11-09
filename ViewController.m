//
//  ViewController.m
//  Converter
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyConverter.h"
#import "CurrencyViewController.h"

float course = 62.5;

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController
{
    IBOutlet UITextField * inputTextField;
    IBOutlet UITextField * outputTextField;
    IBOutlet UITextField * courseTextField;
    CurrencyViewController * currencyVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    inputTextField.delegate = self;
    courseTextField.delegate = self;
    self.title = @"Currency Converter";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Converter:( NSString *) sum {
    CurrencyConverter * converter = [ [ CurrencyConverter alloc ] init];
    float itogSum = [ converter convertRUBtoUSD:sum.floatValue and : course ];
    outputTextField.text = @(itogSum).stringValue;
}

-(IBAction)onButtonTab{
    [self Converter:inputTextField.text];
}

-(IBAction)course{
    course = courseTextField.text.floatValue;
    [self Converter:inputTextField.text];
}

-(IBAction)selectCurrency{
    //typedef(self) __weak weakSelf = self;
    
    currencyVC = [[CurrencyViewController alloc] initWithNibName:nil bundle:nil];
    
    currencyVC.delegate = self;
    [self.navigationController pushViewController:currencyVC animated:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString * result = textField.text;
    result = [result  stringByReplacingCharactersInRange: range withString: string];
    if(textField == inputTextField ) {
        [self Converter:result];
        return YES;
    } else if( textField == courseTextField ) {
        course = result.floatValue;
        [self Converter:inputTextField.text];
        return YES;
    }
    return NO;
}

-(void)didSelectCurrency{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
