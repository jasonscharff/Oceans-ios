//
//  OCNHTTPSessionManager.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//


#import <AFNetworking/AFNetworking.h>

@interface OCNHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedSessionManager;

@end
