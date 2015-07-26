//
//  InterfaceController.h
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/22/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "ExtensionDelegate.h"

@interface InterfaceController : WKInterfaceController

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *gpsButton;

- (IBAction)didTapButton;

@end
