//
//  OCNCryptography.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SQAESDE.h"


@interface OCNCryptography : NSObject

+ (instancetype)sharedCrypto;

@end
