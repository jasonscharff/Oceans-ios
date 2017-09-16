//
//  OCNCircleTextView.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNCircleTextView.h"

#import "AutolayoutHelper.h"

#import "OCNTheme.h"

@interface OCNCircleTextView()

@property (nonatomic) UILabel *numberLabel;

@end

@implementation OCNCircleTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    self.clipsToBounds = YES;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.borderColor = [OCNTheme sharedTheme].textColor.CGColor;
    self.layer.borderWidth = 1.0f;
    
    self.numberLabel = [UILabel new];
    self.numberLabel.font = [OCNTheme sharedTheme].bodyFont;
    self.numberLabel.textColor= [OCNTheme sharedTheme].textColor;
    [AutolayoutHelper configureView:self subViews:NSDictionaryOfVariableBindings(_numberLabel)
                        constraints:@[@"H:|-(>=8)-[_numberLabel]-(>=8)-|", @"V:|-[_numberLabel]-|"]];
    
    NSLayoutConstraint *textViewAspectRatio = [NSLayoutConstraint constraintWithItem:self
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1.0
                                                                            constant:0];
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.numberLabel
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:self.numberLabel
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1.0
                                                                constant:0];
    
    [self addConstraint:textViewAspectRatio];
    [self addConstraint:centerX];
    [self addConstraint:centerY];
}

- (void)setNumber:(NSInteger)number {
    _number = number;
    self.numberLabel.text = [NSString stringWithFormat:@"%li", (long)number];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = MAX(self.bounds.size.width, self.bounds.size.height)/2;
}


@end
