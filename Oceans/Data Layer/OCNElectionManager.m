//
//  OCNElectionManager.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNElectionManager.h"

@class OCNQuestion;

@implementation OCNElectionManager

typedef void (^QuestionsResponse)(NSArray<OCNQuestion *>*);


+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static OCNElectionManager *_sharedElectionManager;
    dispatch_once(&onceToken, ^{
        _sharedElectionManager = [[OCNElectionManager alloc]init];
    });
    
    return _sharedElectionManager;
}





@end
