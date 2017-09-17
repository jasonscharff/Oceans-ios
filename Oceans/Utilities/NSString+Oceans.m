//
//  NSString+Oceans.m
//  Oceans
//
//  Created by Jason Scharff on 9/17/17.
//  Copyright © 2017 Jason Felix Scharff. All rights reserved.
//

#import "NSString+Oceans.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString(Oceans)

//Stolen from https://github.com/jerolimov/NSHash


- (NSString *) ocn_sha256 {
    unsigned int outputLength = CC_SHA256_DIGEST_LENGTH;
    unsigned char output[outputLength];
    
    CC_SHA256(self.UTF8String, (unsigned int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], output);
    return [self toHexString:output length:outputLength];
}

- (NSString *) toHexString:(unsigned char*) data length: (unsigned int) length {
    NSMutableString* hash = [NSMutableString stringWithCapacity:length * 2];
    for (unsigned int i = 0; i < length; i++) {
        [hash appendFormat:@"%02x", data[i]];
        data[i] = 0;
    }
    return [hash copy];
}

@end
