//
//  OCNTheme.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@interface OCNTheme : NSObject

+ (instancetype)sharedTheme;

@property (nonatomic) UIFont *headerFont;
@property (nonatomic) UIImage *backgroundImage;
@property (nonatomic) UIColor *textColor;

@end


