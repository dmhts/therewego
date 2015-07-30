//
//  RootInterfaceController+CLLocationManagerDelegate.m
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/22/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "RootInterfaceController.h"

@interface RootInterfaceController (CLLocationManagerDelegate)

@end


@implementation RootInterfaceController (CLLocationManagerDelegate)

-(void)locationManager:(nonnull CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    if ([locations count] == 0) {
        return;
    }
    
    self.isRequestingLocation = FALSE;
    [self.gpsButton setTitle:self.fetchingPlacesTitle];
    
    // Locations array always contains at least one object representing the current location.
    // Since we use only single requests to fetch a current location then it will be sufficient.
    CLLocationCoordinate2D currentLocation = [locations objectAtIndex:0].coordinate;
    
    // Odessa Mama
    //currentLocation = CLLocationCoordinate2DMake(46.4667, 30.7333);
    
    // TODO: Maybe it makes sense to turn the provider into the singleton.
    TWGDataProvider *dataProvider = [TWGDataProvider new];
    
    // TODO: Move places types to user settings.
    NSArray *types = @[@"airport", @"train_station", @"bus_station", @"subway_station"];
    
    [dataProvider getNearbyPlacesByCoordinates:&currentLocation inRadius:5000 withTypes:types onCompletion:^void(NSArray *places) {
        // Work with the UI only within the main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.gpsButton setTitle:self.requestLocationTitle];
            [self.detailsButton setHidden:FALSE];
            [self.map setHidden:FALSE];
            
            for (int index = 0; index < 5; index++) {
                TWGPlace *place = [[TWGPlaceCollection sharedInstance] getPlaceBy:index];
                
                if (!place) {
                    break;
                }
                
                CLLocationDegrees latitude = ((NSNumber *)[place.location objectForKey:@"latitude"]).doubleValue;
                CLLocationDegrees longitude = ((NSNumber *)[place.location objectForKey:@"longitude"]).doubleValue;
                
                // Put a pin to the map.
                [self.map addAnnotation:CLLocationCoordinate2DMake(latitude, longitude) withPinColor: WKInterfaceMapPinColorPurple];
            }
            
            // The amount of map to display.
            MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.1, 0.1);
            
            [self.map setRegion:(MKCoordinateRegionMake(currentLocation, coordinateSpan))];
        });
    }];
    
}

-(void)locationManager:(nonnull CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (!self.isRequestingLocation) {
        return;
    }
    
    // Work with the UI only within the main thread.
    dispatch_async(dispatch_get_main_queue(), ^{
        switch (status) {
            case kCLAuthorizationStatusDenied:
                [self showErrorWith:self.deniedText];
                [self.gpsButton setTitle:self.requestLocationTitle];
                break;
            default:
                [self showErrorWith:self.unexpectedText];
                [self.gpsButton setTitle:self.requestLocationTitle];
        }
    });
}

-(void)locationManager:(nonnull CLLocationManager *)manager didFailWithError:(nonnull NSError *)error {
    // Work with the UI only within the main thread.
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showErrorWith:error.localizedDescription];
        self.isRequestingLocation = FALSE;
        [self.gpsButton setTitle:self.requestLocationTitle];
    });
}

@end



