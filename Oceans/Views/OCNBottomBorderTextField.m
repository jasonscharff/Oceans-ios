//
//  OCNBottomBorderTextField.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNBottomBorderTextField.h"

@implementation OCNBottomBorderTextField

- (instancetype)initWithBorderColor:(UIColor *)color borderWidth:(CGFloat)width {
    self = [super init];
    if (self) {
        self.borderColor = color;
        self.borderWidth = width;
    }
    return self;
    
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //Set the line color and width
    CGContextSetStrokeColorWithColor(context, self.borderColor.CGColor);
    CGContextSetLineWidth(context, self.borderWidth);
    //Start a new Path
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, self.bounds.origin.x, self.font.lineHeight);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.font.lineHeight);
    
    //Close our Path and Stroke (draw) it
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

@end

