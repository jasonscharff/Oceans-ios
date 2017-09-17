//
//  OCNUserManager.m
//  Oceans
//
//  Created by Jason Scharff on 9/17/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNUserManager.h"

@implementation OCNUserManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static OCNUserManager *_sharedInstance;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[OCNUserManager alloc]init];
    });
    return _sharedInstance;
}

- (void)login: (NSDictionary *)dictionary {
    self.privateKey = dictionary[@"private_key"];
    self.address = dictionary[@"address"];
}



@end
