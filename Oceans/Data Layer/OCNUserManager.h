//
//  OCNUserManager.h
//  Oceans
//
//  Created by Jason Scharff on 9/17/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCNUserManager : NSObject

+ (instancetype) sharedManager;
- (void)login: (NSDictionary *)dictionary;

@property (nonatomic) NSString *privateKey;
@property (nonatomic) NSString *address;

@end
