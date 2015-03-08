//
//  mapmain.h
//  hackcdmx
//
//  Created by Alexis on 3/6/15.
//  Copyright (c) 2015 Alfredo Alexis Gonzalez Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>
@interface mapmain : UIViewController
<CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@property (strong, nonatomic) IBOutlet GMSMapView *mapa;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end
