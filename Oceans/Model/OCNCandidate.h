//
//  ONCCandidate.h
//  Oceans
//
//  Created by Jason Scharff on 9/17/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OCNQuestion;

@interface OCNCandidate : NSObject

//Candidate Identifier is defined as SHA256 of (private key + serverOrder)
@property (nonatomic) NSString *candidateIdentifier;
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger serverOrder;
@property (nonatomic) OCNQuestion *question;

@end
