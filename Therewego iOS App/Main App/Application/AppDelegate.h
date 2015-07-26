//
//  AppDelegate.h
//  therewego
//
//  Created by Dmitry Gutsulyak on 7/21/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

@import WatchConnectivity;
#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, WCSessionDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

