//
//  OCNVoteTableViewCell.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNVoteTableViewCell.h"

#import "AutolayoutHelper.h"

#import "OCNCircleTextView.h"
#import "OCNTheme.h"

@interface OCNVoteTableViewCell()

@property (nonatomic) UILabel *responseLabel;
@property (nonatomic) OCNCircleTextView *textView;


@end

@implementation OCNVoteTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    self.textView = [[OCNCircleTextView alloc]init];
    
    self.responseLabel = [UILabel new];
    self.responseLabel.textColor = [OCNTheme sharedTheme].textColor;
    self.responseLabel.font = [OCNTheme sharedTheme].bodyFont;
    
    
    [AutolayoutHelper configureView:self.contentView
                           subViews:NSDictionaryOfVariableBindings(_textView, _responseLabel)
                        constraints:@[@"H:|-[_textView]-16-[_responseLabel]|", @"V:|-[_textView]-|"]];
    
    
    NSLayoutConstraint *centerYResponse = [NSLayoutConstraint constraintWithItem:self.responseLabel
                                                                       attribute:NSLayoutAttributeCenterY
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.contentView
                                                                       attribute:NSLayoutAttributeCenterY
                                                                      multiplier:1.0
                                                                        constant:0];
    
    
    [self.contentView addConstraint:centerYResponse];
    
    
}

- (void)configureWithResponse : (NSString *)response rank: (NSInteger)rank{
    self.responseLabel.text = response;
    self.textView.number = rank;
}

@end
