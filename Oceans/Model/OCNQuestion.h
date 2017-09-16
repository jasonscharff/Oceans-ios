//
//  OCNQuestion.h
//  Oceans
//
//  Created by Jason Scharff on 9/16/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCNQuestion : NSObject

@property (nonatomic) NSString *prompt;
@property (nonatomic) NSMutableArray<NSString *> *responses;

@end
