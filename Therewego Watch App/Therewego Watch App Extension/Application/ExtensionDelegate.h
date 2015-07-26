//
//  ExtensionDelegate.h
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/22/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

@import WatchConnectivity;
#import <CoreLocation/CoreLocation.h>
#import <WatchKit/WatchKit.h>

@interface ExtensionDelegate : NSObject <WKExtensionDelegate, WCSessionDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end
