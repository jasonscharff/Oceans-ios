//
//  OCNElectionViewController.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNElectionViewController.h"

#import "OCNQuestion.h"
#import "OCNQuestionViewController.h"
#import "OCNElectionManager.h"
#import "OCNThankYouViewController.h"
#import "OCNScanViewController.h"

@interface OCNElectionViewController ()

@property (nonatomic) NSArray<OCNQuestion *> *questions;


@end

@implementation OCNElectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureNavigationBar];
    
    
    self.questions = [OCNElectionManager sharedManager].questions;
    
    
    void (^__block nextPressed)(UIViewController *) = ^void(UIViewController * vc){
        NSInteger index = vc == nil ? -1 : vc.view.tag;
        index++;
        
        if (index >= self.questions.count) {
            
            
            [[OCNElectionManager sharedManager]vote:self.questions completion:^(BOOL success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if(success) {
                        OCNThankYouViewController *thankYou = [[OCNThankYouViewController alloc]init];
                        CATransition *transition = [CATransition animation];
                        transition.duration = 0.5;
                        transition.timingFunction =
                        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                        transition.type = kCATransitionMoveIn;
                        transition.subtype = kCATransitionFromTop;
                        UIView *containerView = self.view.window;
                        [containerView.layer addAnimation:transition forKey:nil];
                        
                        [self presentViewController:thankYou animated:YES completion:nil];
                    } else {
                        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Something happened. Try again?" preferredStyle:UIAlertControllerStyleAlert];
                        [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
                        [self presentViewController:alertController animated:YES completion:nil];
                    }
                });
                
            }];
            return;
        }
        OCNQuestionViewController *questionVC = [[OCNQuestionViewController alloc]init];
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
