//
//  mapmain.m
//  hackcdmx
//
//  Created by Alexis on 3/6/15.
//  Copyright (c) 2015 Alfredo Alexis Gonzalez Rodriguez. All rights reserved.
//

#import "mapmain.h"
#import <Foundation/Foundation.h>

@interface mapmain ()


@end

@implementation mapmain{
}
@synthesize mapa,locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];

    double lati = locationManager.location.coordinate.latitude;
    double longi = locationManager.location.coordinate.longitude;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:lati
                                                            longitude:longi
                                                                 zoom:14];
    self.mapa.camera = camera;
    self.mapa.myLocationEnabled = YES;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(19.440445, -99.181566);
    marker.title = @"Aqui";
    marker.snippet = @"estas";
    marker.map = self.mapa;
    // Do any additional setup after loading the view.
    
//    NSString *URL =[NSString stringWithFormat:@"http://datos.labplc.mx/georeferencia.json?&latitud=%g&longitud=%g&radio=%d", lati,longi,500];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
