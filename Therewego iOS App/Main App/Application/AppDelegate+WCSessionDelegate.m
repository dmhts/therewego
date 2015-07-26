//
//  AppDelegate+WCSessionDelegate.m
//  therewego
//
//  Created by Dmitry Gutsulyak on 7/21/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "AppDelegate+WCSessionDelegate.h"

@implementation AppDelegate (WCSessionDelegate)

-(void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message {
    // TODO: Think up some optimization that will allow to reply to the Watch with the same callback. It maybe some kind of caching of GPS data.
}

@end