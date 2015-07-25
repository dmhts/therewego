//
//  TWGPlace.m
//  Therewego
//
//  Created by Dmitry Gutsulyak on 7/24/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "TWGPlace.h"

@interface TWGPlace (PrivateMethods)

/**
    Derives coordinate from a Google Place model object. Appropriate data is contained in a "geometry" dictionary.
    Coordinate takes either "lat" or "lng" NSString parameter.
 
    @param geometryData A dictionary with geometry data.
    @param coordinate Takes either "lat" or "lng" value.
 */
-(double)deriveCoordinateFrom:(NSDictionary *)placeDictionary coordinate:(NSString *)coordinate;
@end

@implementation TWGPlace

-(nullable instancetype)initWithDictionary:(nonnull NSDictionary *)placeDictionary {
    self = [super init];
    
    if (self) {
        
        NSString *place_id = [placeDictionary objectForKey:@"place_id"];
        NSString *name = [placeDictionary objectForKey:@"name"];
        NSArray *types = [placeDictionary objectForKey:@"types"];
        
        // Check for nonnullability
        if (place_id && name && types) {
            self.place_id = place_id;
            self.name = name;
            self.types = types;
            
            // TODO: Figure out an error at this point.
            // TODO: Move coordinate deriving to a separate method.
            //CLLocationCoordinate2D points[0];
            //double latitude = [self deriveCoordinateFrom:placeDictionary coordinate:@"lat"];
            //double longitude = [self deriveCoordinateFrom:placeDictionary coordinate:@"lng"];
            //points[0] = CLLocationCoordinate2DMake(latitude, longitude);
            //self.coordinates = &points[0];
            
            // TODO: Move photo deriving to a separate method.
            // TODO: It is possible to store multiple photo references and thus images.
            NSArray *photos = [placeDictionary objectForKey:@"photos"];
            if (photos) {
                NSDictionary *firstPhoto = [photos objectAtIndex:0];
                self.photoReference = [firstPhoto objectForKey:@"photo_reference"];
            }
            
            return self;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

-(double)deriveCoordinateFrom:(NSDictionary *)placeDictionary coordinate:(NSString *)coordinate {
    NSDictionary *geometry = [placeDictionary objectForKey:@"geometry"];
    
    if (geometry) {
        NSDictionary *location = [geometry objectForKey:@"location"];
        
        return [[location objectForKey:coordinate] doubleValue];
    } else {
        return 0;
    }
}

@end