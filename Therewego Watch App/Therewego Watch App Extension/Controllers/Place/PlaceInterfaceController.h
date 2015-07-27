//
//  PlacesInterfaceController.h
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/27/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import "TWGPlace.h"
#import "TWGDataProvider.h"

@interface PlaceInterfaceController : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *name;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *vicinity;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *placePhoto;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *spinner;

@end
