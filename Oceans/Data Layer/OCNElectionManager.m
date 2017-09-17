//
//  OCNElectionManager.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNElectionManager.h"

@implementation OCNElectionManager

+ (instancetype)sharedLoginManager {
    static dispatch_once_t onceToken;
    static OCNElectionManager *_sharedLoginManager;
    dispatch_once(&onceToken, ^{
        _sharedLoginManager = [[OCNElectionManager alloc]init];
    });
    
    return _sharedLoginManager;
}



@end
