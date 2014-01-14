//
//  LocationMonitor.h
//  Map
//
//  Created by Trevor Erik Carlson on 1/10/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationMonitor : NSObject <CLLocationManagerDelegate>

/*{

    CLLocationManager *locationManager;
    NSManagedObjectContext *managedObjectContext;
    
}*/

-(id)initWithMoc: (NSManagedObjectContext*) moc;

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
