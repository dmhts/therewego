//
//  TWGPlace.h
//  therewego
//
//  Created by Dmitry Gutsulyak on 7/25/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

/**
    The model class that represent a Google Place model described in details here https://developers.google.com/places/webservice/search#PlaceSearchResponses
    The class can be extended with additional fields from aforementioned model in the future.
    // TODO: Implement the NSCoder protocol to be able to serialize the object.
 */
@interface TWGPlace : NSObject

/// Contains a unique stable identifier denoting this place.
@property (nonnull) NSString* place_id;

/// Contains the human-readable name.
@property (nonnull) NSString* name;

/// Contains coordinates of the object.
@property (nonnull) NSDictionary* location;

/// Contains the array of feature types. See the list of supported types https://developers.google.com/places/supported_types
@property (nonnull) NSArray* types;

/// The property is only returned for a Text Search.
@property (nullable) NSString* address;

// TODO: It is possible to store multiple photo references.
/// The string used to identify the photo when you perform a Photo request.
@property (nullable) NSString* photoReference;

// TODO: It is possible to store multiple images.
/// The fetched image object.
@property (nullable) UIImage* photo;

/** 
    Inits a model with a given Google Place model.
    
    @param placeDictionary A Google Place model dictionary.
*/
-(nullable instancetype)initWithDictionary:(nonnull NSDictionary *)placeDictionary;

@end