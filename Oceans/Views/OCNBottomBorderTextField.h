//
//  OCNBottomBorderTextField.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

@import UIKit;

@interface OCNBottomBorderTextField : UITextField

@property (nonatomic) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

- (instancetype)initWithBorderColor:(UIColor *)color
                        borderWidth:(CGFloat)width;

@end

