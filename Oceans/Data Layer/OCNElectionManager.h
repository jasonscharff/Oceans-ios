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

@property (nonatomic) NSArray<OCNQuestion *>*questions;

typedef void (^SuccessResponse)(BOOL);


+ (instancetype)sharedManager;
- (void)getQuestions : (SuccessResponse)completion;
- (void)vote : (NSArray<OCNQuestion *>*)questions completion: (SuccessResponse)completion;

@end
