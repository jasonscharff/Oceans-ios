//
//  OCNVoteTableViewCell.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCNVoteTableViewCell : UITableViewCell

- (void)configureWithResponse : (NSString *)response rank: (NSInteger)rank;

@end
