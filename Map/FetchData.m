//
//  FetchData.m
//  Map
//
//  Created by Trevor Erik Carlson on 1/8/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import "FetchData.h"
#import "XMLRPCRequest.h"
#import "XMLRPCResponse.h"
#import "XMLRPCConnection.h"
#import "XMLRPCConnectionManager.h"
#import "NSStringAdditions.h"
#import "HMAC.h"

@implementation FetchData

+ (NSArray *)fetch_static
{

    
    NSString *kFirstNameKey= @"deviceid_preference";
    
    //for reading default value for Terminal
    NSString *deviceId = [[NSUserDefaults standardUserDefaults] stringForKey:kFirstNameKey];
    //- See more at: http://www.ecanarys.com/blog-entry/implementing-ios-setting-bundle#sthash.GreXbASL.dpuf
    NSLog(@"pref: %@", deviceId);
    
    
    //NSURL *URL = [NSURL URLWithString: @"http://127.0.0.1:8080/"];
    NSURL *URL = [NSURL URLWithString: @"http://162.242.218.22:8081/"];
    
    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
    //XMLRPCConnectionManager *manager = [XMLRPCConnectionManager sharedManager];
    
    //[request setMethod: @"echo" withParameter: @"Hello World!"];
    //[request setMethod: @"get_static_data"];
    //[request setMethod: @"get_all_by_deviceid" withParameter: @"zmenegakis561412"];
    //[request setMethod: @"get_all_by_deviceid" withParameter: @"zmenegakis200489"];
    [request setMethod: @"get_all_by_deviceid" withParameter: deviceId];

    
    NSString *hash = [HMAC hash_sha512:[request body]];
    //NSLog(@"hash = %@", hash);
    NSString *digest = [HMAC sha1:hash secret:@"iphone-kinisi$vCDxwwG"];
    //NSLog(@"digest = %@", digest);
    NSString *usernameDigestStr = [NSString stringWithFormat:@"iphone:%@", digest];
    //NSLog(@"userNameDigestStr = %@", usernameDigestStr);
    NSData* usernameDigestData = [usernameDigestStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Str = [NSString base64StringFromData: usernameDigestData length: [usernameDigestData length]];
    //NSLog(@"base64Str = %@", base64Str);
    [request setHeader: @"Authorization" withValue: [NSString stringWithFormat:@"Basic %@", base64Str ]];
    
    //NSLog(@"Request body: %@", [request body]);

    //[manager spawnConnectionWithXMLRPCRequest:request delegate:self];
    NSError *error = nil;
    XMLRPCResponse *serverResponse = [XMLRPCConnection sendSynchronousXMLRPCRequest:request error:&error];
    
    //NSString * resp = [serverResponse object];
    NSArray * resp = [serverResponse object];

    
    if ([serverResponse isFault]){
        NSLog(@"Fault! String:'%@'\n", [serverResponse faultString]);
        return nil;
    }
    //NSLog(@"Response: %@\n", serverResponse);
    //NSLog(@"Response Body: %@\n", [serverResponse body]);
    //NSLog(@"Response object: %@\n", resp);
    if (error != nil) {
        NSLog(@"Error: %@\n", error);
        return nil;
    }

    [request release];
    
    return resp;
}

@end
