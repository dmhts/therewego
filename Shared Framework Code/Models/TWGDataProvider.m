//
//  TWGDataProvider.m
//  Therewego
//
//  Created by Dmitry Gutsulyak on 7/24/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "TWGDataProvider.h"

@interface TWGDataProvider (PrivateMethods)

/**
    Converts an array with places types into to a string to use it with the request to Google Web Services.
    See the full list of available places: https://developers.google.com/places/supported_types
 
    @param types An array of places types.
 */
- (NSString *)typesToString:(NSArray *)types;

@end


@implementation TWGDataProvider {
    
    /// The shared session object.
    NSURLSession *session;
    
    /// The ongoing NSUrl task.
    NSURLSessionDataTask *nearbyPlacesTask;
    
}

- (instancetype)init {
    if ( self = [super init] ) {
        session = [NSURLSession sharedSession];
        
        return self;
    } else {
        return nil;
    }
}

- (void)getNearbyPlacesByCoordinates:(CLLocationCoordinate2D *)coordinates inRadius:(double)radius withTypes:(NSArray *)types onCompletion:(void (^)(NSArray *places))completion {
    
    // Compose a request string.
    NSString *requestString = [NSString stringWithFormat:@"%@json?key=%@&location=%f,%f&radius=%f&types=%@&rankby=prominence&sensor=true",
                               TWGNearbyPlacesSearchUrl,
                               TWGBrowserApiKey,
                               coordinates->latitude,
                               coordinates->longitude,
                               radius,
                               [self typesToString:types]];
    
    // Encode a request string and convert it to the url object.
    NSURL *requestUrl = [NSURL URLWithString:[requestString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    // Cancel a current task if one is taking place.
    if (nearbyPlacesTask.taskIdentifier > 0 && nearbyPlacesTask.state == NSURLSessionTaskStateRunning) {
        [nearbyPlacesTask cancel];
    }
    
    // Send a places info fetching request.
    nearbyPlacesTask = [session dataTaskWithURL:requestUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSError *jsonSerializationError;
        
        // Try to derive JSON data.
        id objectFromJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonSerializationError];
        
        // TODO: Process the next page token to overcome the limit of 20 first results. On this stage it is enough.
        if (objectFromJSON) {
            // See other root nodes besides @"results" one https://developers.google.com/places/webservice/search#PlaceSearchResponses
            id results = [objectFromJSON objectForKey:@"results"];
            
            if (results) {
                [[TWGPlaceCollection sharedInstance] clearPlaces];
                for (id result in results) {
                    TWGPlace *place = [[TWGPlace alloc] initWithDictionary:(NSDictionary *)result];
                    
                    // TODO: Add photo fetching.
                    
                    [[TWGPlaceCollection sharedInstance] addPlace:place];
                }
                
                completion([TWGPlaceCollection sharedInstance].places);
            } else {
                // TODO: Process an absent key error.
            }
        
        } else {
            // TODO: Process a serialization error.
        }
    }];
    
    [nearbyPlacesTask resume];
}

-(NSString *)typesToString:(NSArray *)types {
    NSMutableString* resultingTypeString = [NSMutableString stringWithString:@""];
    
    for (NSString* type in types) {
        [resultingTypeString appendString:type];
        
        // Add a delimiter after a type item but last one.
        if ([types lastObject] != type) {
            [resultingTypeString appendString:@"|"];
        }
    }

    return resultingTypeString;
}

@end