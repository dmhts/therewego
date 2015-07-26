//
//  TWGPlaceCollection.h
//  therewego
//
//  Created by Dmitry Gutsulyak on 7/26/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWGPlace.h"

// TODO: Add save/load methods to store the collection in a persistent storage.
/**
    Manages TWGPlace objects.
 */
@interface TWGPlaceCollection : NSObject

/// Stores an array of places.
@property (nonnull, strong) NSMutableArray *places;

/** 
    The canonical way of declaring a Singleton.
 
    @return The current class instance.
*/
+(nonnull TWGPlaceCollection *)sharedInstance;

/**
    Clears the places collection.
*/
-(void)clearPlaces;

/**
    Adds a place object to the collection.
*/
-(void)addPlace:(nonnull TWGPlace *)place;

/**
    Returns a place by its index.
 
    @return A place by its index.
*/
-(nullable TWGPlace *)getPlaceBy:(int)index;

/**
    Adds places objects to the collectins.
 
    @return The current class instance.
*/
-(nonnull instancetype)addPlaces:(nonnull NSArray *)places;

@end