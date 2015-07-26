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
    // Locations array always contains at least one object representing the current location.
    // Since we use only single requests to fetch a current location then it will be sufficient.
    CLLocationCoordinate2D currentLocation = [locations objectAtIndex:0].coordinate;
    
    // TODO: Maybe it makes sense to turn the provider into the singleton.
    TWGDataProvider *dataProvider = [TWGDataProvider new];
    
    // TODO: Move places types to user settings.
    NSArray *types = @[@"airport", @"train_station", @"bus_station", @"transit_station"];
    
    [dataProvider getNearbyPlacesByCoordinates:&currentLocation inRadius:5000 withTypes:types onCompletion:^void(NSArray *places) {
        for (int i = 0; i < 5; i++) {
            TWGPlace *place = [places objectAtIndex:i];
            
            CLLocationDegrees latitude = ((NSNumber *)[place.location objectForKey:@"latitude"]).doubleValue;
            CLLocationDegrees longitude = ((NSNumber *)[place.location objectForKey:@"longitude"]).doubleValue;
            
            // Put a pin to the map.
            [self.map addAnnotation:CLLocationCoordinate2DMake(latitude, longitude) withPinColor: WKInterfaceMapPinColorPurple];
        }
        
        // The amount of map to display.
        MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.1, 0.1);
        
        [self.map setRegion:(MKCoordinateRegionMake(currentLocation, coordinateSpan))];
    }];
    
}

-(void)locationManager:(nonnull CLLocationManager *)manager didFailWithError:(nonnull NSError *)error {
    // TODO: Handle or not to handle errors.
}

@end



