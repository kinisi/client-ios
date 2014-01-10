//
//  HMAC.h
//  Map
//
//  Created by Trevor Erik Carlson on 1/9/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMAC : NSObject

+ (NSString *)sha1:(NSString *)data secret:(NSString *)key;
+ (NSString *)hash_sha512:(NSString *)input;

@end
