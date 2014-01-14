//
//  ViewController.m
//  Map
//
//  Created by Trevor Erik Carlson on 1/8/14.
//  Copyright (c) 2014 Trevor Erik Carlson. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "FetchData.h"
#import "LocationMonitor.h"


@interface ViewController ()
@end

@implementation ViewController{
    GMSMapView *mapView_;
}

@synthesize locationMonitor;
@synthesize managedObjectContext;

- (void)viewDidLoadMap {
    //[super viewDidLoad];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:29.7
                                                            longitude:-82.38
                                                                 zoom:13];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    GMSMutablePath *path = [GMSMutablePath path];
    /*
    [path addLatitude:-33.866 longitude:151.195]; // Sydney
    [path addLatitude:-18.142 longitude:178.431]; // Fiji
    [path addLatitude:21.291 longitude:-157.821]; // Hawaii
    [path addLatitude:37.423 longitude:-122.091]; // Mountain View
    */
    
    [path addLatitude:29.651725000 longitude:-82.352250000];
    [path addLatitude:29.651083333 longitude:-82.353866667];
    [path addLatitude:29.650370000 longitude:-82.356168333];
    [path addLatitude:29.650393333 longitude:-82.358003333];
    [path addLatitude:29.650028333 longitude:-82.358000000];
    [path addLatitude:29.649230000 longitude:-82.358213333];
    [path addLatitude:29.649040000 longitude:-82.358375000];
    [path addLatitude:29.649036667 longitude:-82.358376667];
    [path addLatitude:29.649036667 longitude:-82.358376667];
    [path addLatitude:29.649043333 longitude:-82.358376667];
    [path addLatitude:29.649036667 longitude:-82.358376667];
    [path addLatitude:29.649033333 longitude:-82.358375000];
    [path addLatitude:29.649028333 longitude:-82.358373333];
    
    /*
    [path addLatitude:29.649021667 longitude:-82.358383333];
    [path addLatitude:29.649026667 longitude:-82.358383333];
    [path addLatitude:29.649018333 longitude:-82.358383333];
    [path addLatitude:29.649015000 longitude:-82.358381667];
    [path addLatitude:29.649011667 longitude:-82.358390000];
    [path addLatitude:29.649011667 longitude:-82.358380000];
    [path addLatitude:29.649016667 longitude:-82.358378333];
    [path addLatitude:29.649020000 longitude:-82.358376667];
    [path addLatitude:29.649016667 longitude:-82.358376667];
    [path addLatitude:29.649025000 longitude:-82.358365000];
    [path addLatitude:29.649025000 longitude:-82.358365000];
    [path addLatitude:29.649025000 longitude:-82.358365000];
    [path addLatitude:29.649028333 longitude:-82.358365000];
    [path addLatitude:29.649021667 longitude:-82.358365000];
    [path addLatitude:29.649028333 longitude:-82.358365000];
    [path addLatitude:29.649025000 longitude:-82.358365000];
    [path addLatitude:29.649028333 longitude:-82.358366667];
    [path addLatitude:29.649028333 longitude:-82.358366667];
    [path addLatitude:29.649025000 longitude:-82.358365000];
    [path addLatitude:29.649000000 longitude:-82.358305000];
    [path addLatitude:29.649191667 longitude:-82.358178333];
    [path addLatitude:29.649528333 longitude:-82.357990000];
    [path addLatitude:29.650086667 longitude:-82.358001667];
    [path addLatitude:29.650695000 longitude:-82.358026667];
    [path addLatitude:29.650905000 longitude:-82.358010000];
    [path addLatitude:29.650925000 longitude:-82.358010000];
    [path addLatitude:29.651266667 longitude:-82.357881667];
    [path addLatitude:29.651365000 longitude:-82.357818333];
    [path addLatitude:29.651373333 longitude:-82.357808333];
    [path addLatitude:29.651378333 longitude:-82.357781667];
    [path addLatitude:29.651381667 longitude:-82.357770000];
    [path addLatitude:29.651805000 longitude:-82.357390000];
    [path addLatitude:29.652178333 longitude:-82.357413333];
    [path addLatitude:29.652255000 longitude:-82.359646667];
    [path addLatitude:29.652031667 longitude:-82.362253333];
    [path addLatitude:29.652181667 longitude:-82.364995000];
    [path addLatitude:29.652271667 longitude:-82.367673333];
    [path addLatitude:29.652275000 longitude:-82.370311667];
    [path addLatitude:29.652205000 longitude:-82.371620000];
    [path addLatitude:29.652138333 longitude:-82.372458333];
    [path addLatitude:29.651956667 longitude:-82.374858333];
    [path addLatitude:29.651921667 longitude:-82.377851667];
    [path addLatitude:29.652458333 longitude:-82.380938333];
    [path addLatitude:29.653388333 longitude:-82.383491667];
    [path addLatitude:29.654455000 longitude:-82.386380000];
    [path addLatitude:29.655551667 longitude:-82.389383333];
    [path addLatitude:29.656621667 longitude:-82.389973333];
    [path addLatitude:29.658791667 longitude:-82.389215000];
    [path addLatitude:29.659378333 longitude:-82.389141667];
    [path addLatitude:29.660003333 longitude:-82.389085000];
    [path addLatitude:29.661996667 longitude:-82.389011667];
    [path addLatitude:29.664580000 longitude:-82.388978333];
    [path addLatitude:29.667385000 longitude:-82.388950000];
    [path addLatitude:29.670205000 longitude:-82.388938333];
    [path addLatitude:29.672761667 longitude:-82.388923333];
    [path addLatitude:29.673798333 longitude:-82.388915000];
    [path addLatitude:29.673790000 longitude:-82.388915000];
    [path addLatitude:29.674653333 longitude:-82.388910000];
    [path addLatitude:29.676803333 longitude:-82.388913333];
    [path addLatitude:29.679220000 longitude:-82.388908333];
    [path addLatitude:29.681690000 longitude:-82.388906667];
    [path addLatitude:29.684253333 longitude:-82.388898333];
    [path addLatitude:29.686766667 longitude:-82.388898333];
    [path addLatitude:29.688430000 longitude:-82.388896667];
    [path addLatitude:29.688455000 longitude:-82.388893333];
    [path addLatitude:29.688435000 longitude:-82.388891667];
    [path addLatitude:29.688428333 longitude:-82.388891667];
    [path addLatitude:29.688428333 longitude:-82.388891667];
    [path addLatitude:29.688423333 longitude:-82.388883333];
    [path addLatitude:29.689176667 longitude:-82.388900000];
    [path addLatitude:29.691545000 longitude:-82.388941667];
    [path addLatitude:29.694491667 longitude:-82.388853333];
    [path addLatitude:29.697698333 longitude:-82.388841667];
    [path addLatitude:29.700165000 longitude:-82.388835000];
    [path addLatitude:29.701671667 longitude:-82.388835000];
    [path addLatitude:29.702946667 longitude:-82.388853333];
    [path addLatitude:29.703355000 longitude:-82.389593333];
    [path addLatitude:29.703345000 longitude:-82.391908333];
    [path addLatitude:29.703326667 longitude:-82.393706667];
    [path addLatitude:29.703668333 longitude:-82.393840000];
    [path addLatitude:29.704166667 longitude:-82.393723333];
    [path addLatitude:29.704481667 longitude:-82.394011667];
    [path addLatitude:29.704728333 longitude:-82.394446667];
    [path addLatitude:29.704770000 longitude:-82.394478333];
    [path addLatitude:29.704780000 longitude:-82.394495000];
    [path addLatitude:29.704910000 longitude:-82.394455000];
    [path addLatitude:29.705140000 longitude:-82.394473333];
    [path addLatitude:29.705181667 longitude:-82.394435000];
    [path addLatitude:29.705206667 longitude:-82.394441667];
    [path addLatitude:29.705250000 longitude:-82.394438333];
    [path addLatitude:29.705283333 longitude:-82.394433333];
    [path addLatitude:29.705285000 longitude:-82.394430000];
    [path addLatitude:29.705271667 longitude:-82.394421667];
    [path addLatitude:29.705233333 longitude:-82.394395000];
    [path addLatitude:29.705235000 longitude:-82.394405000];
    [path addLatitude:29.705223333 longitude:-82.394403333];
    [path addLatitude:29.705206667 longitude:-82.394393333];
    [path addLatitude:29.705205000 longitude:-82.394400000];
    [path addLatitude:29.705245000 longitude:-82.394423333];
    [path addLatitude:29.705205000 longitude:-82.394423333];
    [path addLatitude:29.705171667 longitude:-82.394418333];
    [path addLatitude:29.705211667 longitude:-82.394428333];
    [path addLatitude:29.705205000 longitude:-82.394423333];
    [path addLatitude:29.705200000 longitude:-82.394436667];
    [path addLatitude:29.705240000 longitude:-82.394411667];
    [path addLatitude:29.705300000 longitude:-82.394396667];
    [path addLatitude:29.705361667 longitude:-82.394363333];
    [path addLatitude:29.705426667 longitude:-82.394346667];
    [path addLatitude:29.705463333 longitude:-82.394390000];
    [path addLatitude:29.705463333 longitude:-82.394413333];
    [path addLatitude:29.705531667 longitude:-82.394480000];
    [path addLatitude:29.705640000 longitude:-82.394448333];
    [path addLatitude:29.705716667 longitude:-82.394335000];
    [path addLatitude:29.705733333 longitude:-82.394276667];
    [path addLatitude:29.705668333 longitude:-82.393993333];
    [path addLatitude:29.705783333 longitude:-82.394088333];
    [path addLatitude:29.706090000 longitude:-82.394050000];
    [path addLatitude:29.705100000 longitude:-82.394418333];
    [path addLatitude:29.706170000 longitude:-82.394328333];
    [path addLatitude:29.706145000 longitude:-82.394318333];
    [path addLatitude:29.705871667 longitude:-82.394418333];
    [path addLatitude:29.705846667 longitude:-82.394371667];
     */
    
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.strokeColor = [UIColor blueColor];
    polyline.strokeWidth = 5.f;
    polyline.map = mapView;
    
    self.view = mapView;
}

- (void)viewDidLoad {
    //[viewDidLoadMap ];
    [super viewDidLoad];
    
    //self.view.window.rootViewController = self;
//    _window.rootViewController = self;
    
    self.locationMonitor = [[LocationMonitor alloc] initWithMoc:managedObjectContext];
    
    BOOL accessNetwork = [[NSUserDefaults standardUserDefaults] boolForKey:@"access_enabled_preference"];

    NSLog(@"pref: %hhd", accessNetwork);
    
    NSArray * latlongs = nil;
    
    if (accessNetwork) {
       latlongs = [FetchData fetch_static];
    }
    
    if (latlongs == nil) {
        [self viewDidLoadMap];
        return;
    }
    
    CGFloat maxminlat[2] = {360.,-360.};
    CGFloat maxminlon[2] = {360.,-360.};
    
    GMSMutablePath *path = [GMSMutablePath path];
    for (NSArray *ll in latlongs) {
        
        // FIXME the XMLRPC code should handle these conversions automatically
        CGFloat lat = [((NSString*)ll[0]) doubleValue];
        CGFloat lon = [((NSString*)ll[1]) doubleValue];
        
        [path addLatitude:lat longitude:lon];
        
        maxminlat[0] = MIN(maxminlat[0],lat);
        maxminlat[1] = MAX(maxminlat[1],lat);
        
        maxminlon[0] = MIN(maxminlon[0],lon);
        maxminlon[1] = MAX(maxminlon[1],lon);
    }
    
    NSLog(@"max/min lat %f %f", maxminlat[0], maxminlat[1]);
    NSLog(@"max/min lon %f %f", maxminlon[0], maxminlon[1]);
    NSLog(@"cameraLat/Lon %f %f", ((maxminlat[1]+maxminlat[0])/2.), ((maxminlon[1]+maxminlon[0])/2.));
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: ((maxminlat[1]+maxminlat[0])/2.)
                                                           longitude: ((maxminlon[1]+maxminlon[0])/2.)
                                                                       zoom:13];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.strokeColor = [UIColor blueColor];
    polyline.strokeWidth = 5.f;
    polyline.map = mapView;

    self.view = mapView;
    
    CLLocationCoordinate2D minmin = CLLocationCoordinate2DMake(maxminlat[0], maxminlon[0]);
    CLLocationCoordinate2D maxmax = CLLocationCoordinate2DMake(maxminlat[1], maxminlon[1]);
    NSLog(@"%f %f ; %f %f", minmin.latitude, minmin.longitude, maxmax.latitude, maxmax.longitude);
    
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] initWithCoordinate:minmin coordinate:maxmax];

    GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds
                                             withPadding:500.0f];
    [mapView_ moveCamera:update];
    
    //GMSCameraPosition *camera2 = [mapView_ cameraForBounds:bounds insets:UIEdgeInsetsZero];
    //mapView_.camera = camera2;

    
}

- (void)viewDidLoad2 {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView_;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
