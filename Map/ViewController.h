//
//  ViewController.h
//  Map
//
//  Created by Trevor Erik Carlson on 1/8/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationMonitor.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) LocationMonitor *locationMonitor;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
