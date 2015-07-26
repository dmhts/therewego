//
//  AppDelegate+WCSessionDelegate.m
//  therewego
//
//  Created by Dmitry Gutsulyak on 7/21/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "AppDelegate+WCSessionDelegate.h"

@implementation AppDelegate (WCSessionDelegate)

-(void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message {}

@end