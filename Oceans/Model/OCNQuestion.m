//
//  OCNQuestion.m
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNQuestion.h"

#import "OCNCandidate.h"

@implementation OCNQuestion

+ (instancetype)questionFromDictionary: (NSDictionary *)dictionary {
    OCNQuestion *question = [OCNQuestion new];
    question.prompt = dictionary[@"title"];
    
    NSArray *responses = dictionary[@"candidates"];
    NSInteger i = 0;
    NSMutableArray *candidates = [NSMutableArray arrayWithCapacity:responses.count];
    for (NSString *response in responses) {
        OCNCandidate *candidate = [OCNCandidate new];
        candidate.question = question;
        candidate.name = response;
        candidate.serverOrder = i;
        [candidates addObject:candidate];
        i++;
    }
    
    question.responses = candidates;
    
    return question;
    
}

@end
