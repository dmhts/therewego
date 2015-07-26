//
//  InterfaceController.m
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/22/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)didTapButton {
    NSDictionary *message = @{@"GiveGPSCoordinates":@"Yes"};
    NSData *serializedMessage = [NSKeyedArchiver archivedDataWithRootObject:message];
    
    NSDictionary *dictionaryToSend = @{@"Take": serializedMessage};
    
    [[WCSession defaultSession] sendMessage:dictionaryToSend  replyHandler:nil errorHandler:^void (NSError *error) {
        // Handle an error.
    }];
}

@end



