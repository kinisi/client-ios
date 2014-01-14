//
//  AppDelegate.h
//  Map
//
//  Created by Trevor Erik Carlson on 1/8/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "LocationMonitor.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) LocationMonitor *locationMonitor;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
