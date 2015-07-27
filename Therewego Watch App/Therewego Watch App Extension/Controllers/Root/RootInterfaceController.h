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

@property (strong, nonatomic) CLLocationManager *locationManager;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *gpsButton;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *detailsButton;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *spinner;

- (IBAction)didTapButton;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceMap *map;

@end
