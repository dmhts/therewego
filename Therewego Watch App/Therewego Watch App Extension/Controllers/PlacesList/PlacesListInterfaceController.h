//
//  PlacesListInterfaceController.h
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/27/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import "PlaceRowController.h"
#import "TWGPlaceCollection.h"


@interface PlacesListInterfaceController : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *placesList;

@end
