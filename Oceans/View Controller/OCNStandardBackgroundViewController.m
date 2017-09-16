//
//  OCNStandardBackgroundViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNStandardBackgroundViewController.h"

#import "AutolayoutHelper.h"

#import "OCNTheme.h"

@implementation OCNStandardBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:[OCNTheme sharedTheme].backgroundImage];
    
    [AutolayoutHelper configureView:self.view fillWithSubView:backgroundImageView];
    
}

@end
