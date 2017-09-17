//
//  ThankYouViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/17/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNThankYouViewController.h"

#import "OCNTheme.h"
#import "OCNScanViewController.h"

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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        OCNScanViewController *scanVC = [[OCNScanViewController alloc]init];
        scanVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:scanVC animated:YES completion:nil];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
