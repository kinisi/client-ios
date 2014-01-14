//
//  LocationEntry.h
//  Map
//
//  Created by Trevor Erik Carlson on 1/10/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LocationEntry : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;

@end
