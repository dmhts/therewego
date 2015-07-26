//
//  ExtensionDelegate+WCSessionDelegate.m
//  Therewego
//
//  Created by Dmitry Gutsulyak on 7/25/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "ExtensionDelegate+WCSessionDelegate.h"

@implementation ExtensionDelegate (WCSessionDelegate)

-(void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message replyHandler:(nonnull void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    
}

-(void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message {

}

@end