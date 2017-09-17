//
//  OCNElectionManager.h"
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import <Foundation/Foundation.h>


@class OCNQuestion;
@interface OCNElectionManager : NSObject

typedef void (^QuestionsResponse)(NSArray<OCNQuestion *>*);

+ (instancetype)sharedManager;

@end
