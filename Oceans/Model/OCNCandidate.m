//
//  ONCCandidate.m
//  Oceans
//
//  Created by Jason Scharff on 9/17/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "OCNCandidate.h"

#import "OCNUserManager.h"
#import "NSString+Oceans.h"
#import "OCNQuestion.h"

@implementation OCNCandidate

- (NSString *)candidateIdentifier {
    if(!_candidateIdentifier) {
        NSString *cat = [NSString stringWithFormat:@"%li%li%@",
                         self.question.questionNumber, self.serverOrder, [OCNUserManager sharedManager].privateKey];
        
        _candidateIdentifier = [cat ocn_sha256];
    }
    return _candidateIdentifier;
}

@end
