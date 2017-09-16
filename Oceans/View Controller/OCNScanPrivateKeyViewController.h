//
//  OCNVoteViewController.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNStandardBackgroundViewController.h"


@class OCNQuestion;

@interface OCNScanPrivateKeyViewController : OCNStandardBackgroundViewController

@property OCNQuestion *question;
@property (nonatomic, copy) void (^progressBlock)(OCNScanPrivateKeyViewController *);
@property (nonatomic) NSString *progressButtonTitle;

@end
