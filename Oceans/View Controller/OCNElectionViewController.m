//
//  OCNElectionViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNElectionViewController.h"

#import "OCNQuestion.h"
#import "OCNScanPrivateKeyViewController.h"

@interface OCNElectionViewController ()

@property (nonatomic) NSArray<OCNQuestion *> *questions;


@end

@implementation OCNElectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNavigationBar];
    
    //Temporary hard coded values.
    
    OCNQuestion *question = [[OCNQuestion alloc]init];
    question.prompt = @"President of the United States";
    question.responses = [@[@"HRC", @"DJT", @"Jill Stein"]mutableCopy];
    
    OCNQuestion *question2 = [[OCNQuestion alloc]init];
    question2.prompt = @"PM of Canada";
    question2.responses = [@[@"Justin Trudeau", @"Stephen Harper", @"Donald John Trump"]mutableCopy];
    
    
    self.questions = @[question, question2];
    
    
    void (^__block nextPressed)(UIViewController *) = ^void(UIViewController * vc){
        NSInteger index = vc == nil ? -1 : vc.view.tag;
        index++;
        
        if (index >= self.questions.count) {
            return;
        }
        OCNScanPrivateKeyViewController *questionVC = [[OCNScanPrivateKeyViewController alloc]init];
        questionVC.title = @"";
        questionVC.question = self.questions[index];
        
        if (index == self.questions.count -1) {
            questionVC.progressButtonTitle = @"Vote";
        } else {
            questionVC.progressButtonTitle = @"Next";
        }
        
        questionVC.view.tag = index;
        
        questionVC.progressBlock = nextPressed;
        [self pushViewController:questionVC animated:YES];
    };
    
    nextPressed(nil);
    
    
}

- (void)configureNavigationBar {
    [self.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    self.view.backgroundColor = [UIColor clearColor];
    
    
    self.navigationBar.topItem.title = @"";
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
