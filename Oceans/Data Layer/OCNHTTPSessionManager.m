//
//  OCNHTTPSessionManager.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNHTTPSessionManager.h"

static NSString * kOCNDefaultBaseURL = @"https://api.reinstra.com/";

@implementation OCNHTTPSessionManager

+ (instancetype)sharedSessionManager {
    static dispatch_once_t once;
    static OCNHTTPSessionManager *_sharedInstance;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kOCNDefaultBaseURL]];
    });
    
    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if(self) {
        AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self setRequestSerializer:serializer];
        
    }
    return self;
}

@end
