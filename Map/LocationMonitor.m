//
//  LocationMonitor.m
//  Map
//
//  Created by Trevor Erik Carlson on 1/10/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import "LocationMonitor.h"

@implementation LocationMonitor

@synthesize locationManager;

-(id)init {
    if ( self = [super init] ) {
        // setup the location manager
        self.locationManager = [[CLLocationManager alloc] init];
        // setup delegate callbacks
        locationManager.delegate = self;
        //Therefore, if your application needs to receive location events while in the background, it must include the
        // UIBackgroundModes key (with the location value) in its Info.plist file. -- DONE TEC
        //[locationManager startUpdatingLocation]; // Uses lots of battery
        [locationManager startMonitoringSignificantLocationChanges]; // Uses only a little bit of battery
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    for (CLLocation *loc in locations) {
        NSLog(@"Loc: %@", loc);
    }
}

// This delegate method is invoked when the location managed encounters an error condition.
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorDenied) {
        // This error indicates that the user has denied the application's request to use location services.
        [manager stopMonitoringSignificantLocationChanges];
    } else if ([error code] == kCLErrorHeadingFailure) {
        // This error indicates that the heading could not be determined, most likely because of strong magnetic interference.
    }
}

@end
