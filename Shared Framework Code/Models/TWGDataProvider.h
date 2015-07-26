//
//  TWGDataProvider.h
//  therewego
//
//  Created by Dmitry Gutsulyak on 7/24/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Constants.h"
#import "TWGPlace.h"

/**
    The class provides the model layer with geo-data from Google Maps (Places) Web Services.
 */
@interface TWGDataProvider : NSObject

/**
    Fetches nearby places by given coordinates, radius and places types.

    @param coordinates Coordinates of a point to get nearby places around.
    @param radius A radius to get nearby places.
    @param completion Since the operation is async fetched data is returned in a callback.
*/
- (void)getNearbyPlacesByCoordinates:(CLLocationCoordinate2D *)coordinates inRadius:(double)radius withTypes:(NSArray *)types onCompletion:(void (^)(NSArray *places))completion;

@end