//
//  AppDelegate.m
//  Map
//
//  Created by Trevor Erik Carlson on 1/8/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>
#import "TestFlight.h"
#import "FetchData.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // start of your application:didFinishLaunchingWithOptions // ...
    [TestFlight takeOff:@"81b24f2e-94b4-4be1-bf5e-b8350f75440f"];
    
    [GMSServices provideAPIKey:@"AIzaSyB90dTPm5EW6r3BNi-ErZRXnGEyEDCdWpA"];
    // Override point for customization after application launch.
    
    // From: http://stackoverflow.com/questions/6774491/unable-to-read-values-from-settings-bundle
    // Set the application defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"zmenegakis200489", @"deviceid_preference",
                                 [NSNumber numberWithBool:YES], @"access_enabled_preference",
                                 nil];
    //NSDictionary *appDefaults = [NSDictionary dictionaryWithObject:@"zmenegakis200489" forKey:@"deviceid_preference"];
    [defaults registerDefaults:appDefaults];
    [defaults synchronize];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
