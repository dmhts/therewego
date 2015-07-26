//
//  InterfaceController.h
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/22/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import "TWGPlaceCollection.h"
#import "TWGDataProvider.h"

@interface RootInterfaceController : WKInterfaceController <CLLocationManagerDelegate>

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *gpsButton;

@property (strong, nonatomic) CLLocationManager *locationManager;

- (IBAction)didTapButton;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceMap *map;

@end
