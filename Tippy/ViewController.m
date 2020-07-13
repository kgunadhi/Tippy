//
//  ViewController.m
//  Tippy
//
//  Created by Kaitlyn Gunadhi on 6/23/20.
//  Copyright © 2020 Kaitlyn Gunadhi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    const double bill = [self.billField.text doubleValue];
    
    NSArray *const percentages = @[@(0.15), @(0.18), @(0.2)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 0.3;
        self.totalLabel.alpha = 0.3;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.alpha = 1;
        self.totalLabel.alpha = 1;
    }];
}

@end
