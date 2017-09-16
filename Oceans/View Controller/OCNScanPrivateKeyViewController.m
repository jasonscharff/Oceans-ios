//
//  OCNVoteViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNScanPrivateKeyViewController.h"

#import "AutolayoutHelper.h"
#import "UITableView+LongPressReorder.h"

#import "OCNTheme.h"
#import "OCNQuestion.h"
#import "OCNVoteTableViewCell.h"

static NSString * const kOCNQuestionTableViewCellIdentifier = @"kOCNQuestionTVCID";

@interface OCNScanPrivateKeyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UILabel *promptLabel;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) UIButton *progressButton;

@end

@implementation OCNScanPrivateKeyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.promptLabel = [UILabel new];
    self.promptLabel.numberOfLines = 0;
    self.promptLabel.textColor = [OCNTheme sharedTheme].textColor;
    self.promptLabel.font = [[OCNTheme sharedTheme]headerFont];
    self.promptLabel.text = self.question.prompt;
    
    self.progressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.progressButton setTitle:self.progressButtonTitle forState:UIControlStateNormal];
    [self.progressButton setTitleColor:[OCNTheme sharedTheme].textColor forState:UIControlStateNormal];
    self.progressButton.layer.borderColor = [OCNTheme sharedTheme].textColor.CGColor;
    self.progressButton.layer.borderWidth = 1.0;
    self.progressButton.layer.cornerRadius = 8.0;
    [self.progressButton setContentEdgeInsets:UIEdgeInsetsMake(8, 12, 8, 12)];
    [self.progressButton addTarget:self action:@selector(progressPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.tableView = [UITableView new];
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.draggingViewIsCentered = YES;
    self.tableView.dataSource = self;
    self.tableView.longPressReorderEnabled = YES;
    self.tableView.estimatedRowHeight = 60;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[OCNVoteTableViewCell class] forCellReuseIdentifier:kOCNQuestionTableViewCellIdentifier];
    
    
    //SKETCH AF. CHANGE ASAP
    NSNumber *margin = @(20);
    
    NSNumber *topMargin = @(80);
    
    
  
    
    [AutolayoutHelper configureView:self.view
                           subViews:NSDictionaryOfVariableBindings(_promptLabel, _tableView, _progressButton)
                            metrics:NSDictionaryOfVariableBindings(margin,topMargin)
                        constraints:@[@"H:|-[_tableView]-|",
                                      @"H:|-[_promptLabel]-|",
                                      @"V:|-(topMargin)-[_promptLabel]-(margin)-[_tableView]-(margin)-[_progressButton]-(topMargin)-|"]];
    
    NSLayoutConstraint *progressCenterX = [NSLayoutConstraint constraintWithItem:self.progressButton
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1.0
                                                                        constant:0];
    
    [self.view addConstraint:progressCenterX];
    
    [self.tableView reloadData];
    [self.tableView sizeToFit];
    
    
}

- (void)progressPressed : (UIButton *)sender {
    self.progressBlock(self);
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.question.responses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OCNVoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kOCNQuestionTableViewCellIdentifier];
    [cell configureWithResponse:self.question.responses[indexPath.row] rank:indexPath.row+1];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    
//    OCNVoteTableViewCell *sourceCell = [tableView cellForRowAtIndexPath:sourceIndexPath];
//    [sourceCell configureWithResponse:self.question.responses[sourceIndexPath.row] rank:destinationIndexPath.row+1];
//
//    OCNVoteTableViewCell *destinationCell = [tableView cellForRowAtIndexPath:destinationIndexPath];
//    [destinationCell configureWithResponse:self.question.responses[destinationIndexPath.row] rank:sourceIndexPath.row+1];
    
    NSString *source = self.question.responses[sourceIndexPath.row];
    self.question.responses[sourceIndexPath.row] = self.question.responses[destinationIndexPath.row];
    self.question.responses[destinationIndexPath.row] = source;
    
    
    
    
    
    
}


@end
