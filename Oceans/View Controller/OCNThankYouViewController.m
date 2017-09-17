//
//  ThankYouViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/17/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNThankYouViewController.h"

#import "OCNTheme.h"

@interface OCNThankYouViewController ()

@end

@implementation OCNThankYouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *thankYouLabel = [UILabel new];
    thankYouLabel.text = @"Thank you.";
    thankYouLabel.textColor = [OCNTheme sharedTheme].textColor;
    thankYouLabel.font = [OCNTheme sharedTheme].headerFont;
    
    thankYouLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:thankYouLabel
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:thankYouLabel
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0
                                                                constant:0];
    
    [self.view addSubview:thankYouLabel];
    [self.view addConstraint:centerX];
    [self.view addConstraint:centerY];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
