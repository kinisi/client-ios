//
//  HMAC.m
//  Map
//
//  Created by Trevor Erik Carlson on 1/9/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import "HMAC.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import "NSDataAdditions.h"

@implementation HMAC

// From: http://stackoverflow.com/questions/756492/objective-c-sample-code-for-hmac-sha1

+ (NSString *)dataToHex:(NSData *)data {
    return nil;
}

+ (NSString *)sha1:(NSString *)data secret:(NSString *)key {
//NSString *key;
//NSString *data;

const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
const char *cData = [data cStringUsingEncoding:NSUTF8StringEncoding];

unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];

CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);

NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
                                      length:sizeof(cHMAC)];

    //NSString *hash = [HMAC base64Encoding];
    NSString* hash = [HMAC hexRepresentationWithSpaces_AS:NO];
    return hash;
}

+ (NSString *)hash_sha512:(NSString *)input
{
    //const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    //NSData *data = [NSData dataWithBytes:cstr length:input.length];
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    
    // This is an iOS5-specific method.
    // It takes in the data, how much data, and then output format, which in this case is an int array.
    CC_SHA512(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    
    // Parse through the CC_SHA512 results (stored inside of digest[]).
    for(int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *)stringToHex:(NSString *)input
{
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableString* output = [NSMutableString stringWithCapacity:[data length] * 2];

    for(int i = 0; i < ([data length] * 2); i++) {
 //       [output appendFormat:@"%02x", [data d]];
    }
    
    return output;
    
}

@end
