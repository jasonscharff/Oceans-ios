//
//  OCNVoteViewController.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNStandardBackgroundViewController.h"


@class OCNQuestion;

@interface OCNQuestionViewController : OCNStandardBackgroundViewController

@property OCNQuestion *question;
@property (nonatomic, copy) void (^progressBlock)(OCNQuestionViewController *);
@property (nonatomic) NSString *progressButtonTitle;

@end
