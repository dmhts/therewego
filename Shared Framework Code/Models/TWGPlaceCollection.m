//
//  TWGPlaceCollection.m
//  Therewego
//
//  Created by Dmitry Gutsulyak on 7/26/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "TWGPlaceCollection.h"

@interface TWGPlaceCollection ()

/// Stores an array of places.
@property (nonnull, strong) NSMutableArray *places;

@end


@implementation TWGPlaceCollection

+ (TWGPlaceCollection *)sharedInstance {
    static dispatch_once_t once;
    static TWGPlaceCollection *instance;
    dispatch_once(&once, ^{
        instance = [[TWGPlaceCollection alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if ( self = [super init] ) {
        self.places = [NSMutableArray array];
    }
    
    return self;
}

- (void)clearPlaces {
    [self.places removeAllObjects];
}

- (void)addPlace:(TWGPlace *)place {
    [self.places addObject:place];
}

- (nullable TWGPlace *)getPlaceBy:(int)index {
    if (index < [self.places count]) {
        return [self.places objectAtIndex:index];
    } else {
        return nil;
    }
    
}

- (void)addPlaces:(NSArray *)places {
    [self.places addObjectsFromArray:places];
}

- (nonnull NSArray *)getPlaces {
    return self.places;
}

@end