//
//  OCNVoteViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNQuestionViewController.h"

#import "AutolayoutHelper.h"

#import "OCNTheme.h"
#import "OCNQuestion.h"

static NSString * const kOCNQuestionTableViewCellIdentifier = @"kOCNQuestionTVCID";

@interface OCNQuestionViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UILabel *promptLabel;
@property (nonatomic) UITableView *tableView;

@end

@implementation OCNQuestionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.promptLabel = [UILabel new];
    self.promptLabel.numberOfLines = 0;
    self.promptLabel.textColor = [OCNTheme sharedTheme].textColor;
    self.promptLabel.font = [[OCNTheme sharedTheme]headerFont];
    self.promptLabel.text = self.question.prompt;
    
    
    self.tableView = [UITableView new];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kOCNQuestionTableViewCellIdentifier];
    
    
    [AutolayoutHelper configureView:self.view
                           subViews:NSDictionaryOfVariableBindings(_promptLabel, _tableView)
                        constraints:@[@"H:|-[_tableView]-|",
                                      @"H:|-[_promptLabel]-|",
                                      @"V:|-30-[_promptLabel]-20-[_tableView]-30-|"]];
    
    
    

}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.question.responses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kOCNQuestionTableViewCellIdentifier];
    cell.textLabel.text = self.question.responses[indexPath.row];
    return cell;
}

@end
