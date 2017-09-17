//
//  ManualEntryViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNManualEntryViewController.h"

#import "AutolayoutHelper.h"

#import "CATransition+Oceans.h"

#import "OCNTheme.h"
#import "OCNBottomBorderTextField.h"
#import "OCNScanViewController.h"

@interface OCNManualEntryViewController () <UITextFieldDelegate>

@end

@implementation OCNManualEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *header = [UILabel new];
    header.numberOfLines = 0;
    header.textColor = [OCNTheme sharedTheme].textColor;
    header.font = [[OCNTheme sharedTheme]headerFont];
    header.text = @"Manually Enter your Private Key";
    
    UITextField *textField = [[OCNBottomBorderTextField alloc]initWithBorderColor:[OCNTheme sharedTheme].textColor borderWidth:1.0];
    textField.font = [OCNTheme sharedTheme].bodyFont;
    textField.tintColor = [OCNTheme sharedTheme].textColor;
    textField.textColor = [OCNTheme sharedTheme].textColor;
    textField.delegate = self;
    
    textField.returnKeyType = UIReturnKeyGo;
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton setTitleColor:[OCNTheme sharedTheme].textColor forState:UIControlStateNormal];
    loginButton.layer.borderColor = [OCNTheme sharedTheme].textColor.CGColor;
    loginButton.layer.borderWidth = 1.0;
    loginButton.layer.cornerRadius = 8.0;
    [loginButton setContentEdgeInsets:UIEdgeInsetsMake(8, 12, 8, 12)];
    [loginButton addTarget:self action:@selector(loginPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSNumber *topMargin = @(80);
    NSNumber *margin = @(20);
    
    [AutolayoutHelper configureView:self.view
                           subViews:NSDictionaryOfVariableBindings(header, textField, loginButton)
                            metrics:NSDictionaryOfVariableBindings(topMargin, margin)
                        constraints:@[@"H:|-[header]-|",
                                      @"H:|-[textField]-|",
                                      @"V:|-(topMargin)-[header]-(margin)-[textField]-(margin)-[loginButton]"]];
    
    NSLayoutConstraint *loginCenterX = [NSLayoutConstraint constraintWithItem:loginButton
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1.0
                                                                        constant:0];
    
    [self.view addConstraint:loginCenterX];
    
    [self addCameraButton];
    
    
}

- (void)addCameraButton{
    UIButton *cameraButton = [UIButton buttonWithType:UIButtonTypePlain];
    
    [cameraButton setTitle:@"Camera" forState:UIControlStateNormal];
    [cameraButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cameraButton.titleLabel.font = [OCNTheme sharedTheme].bodyFont;
    
    [cameraButton addTarget:self action:@selector(switchToCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    [AutolayoutHelper configureView:self.view
                           subViews:NSDictionaryOfVariableBindings(cameraButton)
                        constraints:@[@"H:|-[cameraButton]",
                                      @"V:|-[cameraButton]"]];
    
}

- (void)switchToCamera : (id)sender {
    UIViewController *vc = [[OCNScanViewController alloc]init];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self loginPressed:nil];
    return YES;
}

- (void)loginPressed : (id)sender {
    
}


@end
