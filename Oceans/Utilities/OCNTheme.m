//
//  OCNTheme.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNTheme.h"


@implementation OCNTheme

+ (instancetype)sharedTheme {
    static dispatch_once_t onceToken;
    static OCNTheme * _sharedTheme;
    dispatch_once(&onceToken, ^{
        _sharedTheme = [OCNTheme new];
    });
    return _sharedTheme;
}


//This image will always be shown in a UIImageView and thus always in memory no matter what
//so it makes sense to cache it in memory
- (UIImage *)backgroundImage {
    static dispatch_once_t onceToken;
    static UIImage *_backgroundImage;
    dispatch_once(&onceToken, ^{
        _backgroundImage = [UIImage imageNamed:@"oceans_background"];
    });
    return _backgroundImage;
}

- (UIFont *)headerFont {
    static dispatch_once_t onceToken;
    static UIFont *_font;
    dispatch_once(&onceToken, ^{
        _font = [UIFont fontWithName:@"AvenirNext-Regular" size:32];
    });
    return _font;
}

- (UIFont *)bodyFont {
    static dispatch_once_t onceToken;
    static UIFont *_font;
    dispatch_once(&onceToken, ^{
        _font = [UIFont fontWithName:@"AvenirNext-Regular" size:16];
    });
    return _font;
}

- (UIColor *)textColor {
    static dispatch_once_t onceToken;
    static UIColor *_textColor;
    dispatch_once(&onceToken, ^{
        _textColor = [UIColor whiteColor];
    });
    return _textColor;
}

@end
