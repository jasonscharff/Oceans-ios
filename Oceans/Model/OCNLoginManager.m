//
//  OCNLoginManager.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNLoginManager.h"

@implementation OCNLoginManager

+ (instancetype)sharedLoginManager {
    static dispatch_once_t onceToken;
    static OCNLoginManager *_sharedLoginManager;
    dispatch_once(&onceToken, ^{
        _sharedLoginManager = [[OCNLoginManager alloc]init];
    });
    
    return _sharedLoginManager;
}

- (BOOL)isLoggedIn {
    return NO;
}

@end
