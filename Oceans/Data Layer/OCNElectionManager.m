//
//  OCNElectionManager.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNElectionManager.h"

#import "OCNQuestion.h"
#import "OCNHTTPSessionManager.h"
#import "OCNCandidate.h"
#import "OCNUserManager.h"


@implementation OCNElectionManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static OCNElectionManager *_sharedElectionManager;
    dispatch_once(&onceToken, ^{
        _sharedElectionManager = [[OCNElectionManager alloc]init];
    });
    
    return _sharedElectionManager;
}

- (void)getQuestions : (SuccessResponse)completion {
    [[OCNHTTPSessionManager sharedSessionManager]GET:@"questions" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //not necessary here.
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *questions = [NSMutableArray array];
        int i = 0;
        for (NSDictionary *questionDictionary in responseObject) {
            OCNQuestion *question = [OCNQuestion questionFromDictionary:questionDictionary];
            question.questionNumber = i;
            
            
            [questions addObject:question];
            
            i++;
        }
        self.questions = [NSArray arrayWithArray:questions];
        completion(YES);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error with getting questions %@", error.localizedDescription);
        completion(NO);
    }];
    
}

- (void)vote : (NSArray<OCNQuestion *>*)questions completion: (SuccessResponse)completion {
    NSMutableArray *ballot = [NSMutableArray arrayWithCapacity:questions.count];
    for (OCNQuestion *q in questions) {
        NSMutableArray *questionBallot = [NSMutableArray arrayWithCapacity:q.responses.count];
        for (OCNCandidate *candidate in q.responses) {
            [questionBallot addObject:candidate.candidateIdentifier];
        }
        [ballot addObject:questionBallot];
    }
    
    NSDictionary *parameters = @{@"private_key" : [OCNUserManager sharedManager].privateKey,
                                 @"address" : [OCNUserManager sharedManager].address,
                                 @"ballot" : ballot};
    
    
    
    [[OCNHTTPSessionManager sharedSessionManager]POST:@"vote" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //not necessary
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error with voting %@", error.localizedDescription);
        completion(NO);
    }];
    
    
}






@end
