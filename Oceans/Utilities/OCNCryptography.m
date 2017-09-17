//
//  OCNCryptography.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNCryptography.h"

@implementation OCNCryptography

+ (instancetype)sharedCrypto {
    static dispatch_once_t onceToken;
    static OCNCryptography *_sharedInstance;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[OCNCryptography alloc]init];
    });
    return _sharedInstance;
}

@end
