//
//  PlaceInterfaceController.m
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/22/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "PlaceInterfaceController.h"


@interface PlaceInterfaceController(PrivateMethods)


/**
    Configures content for a place;
 
    @param place A place to configure.
*/
-(void)configureContentFor:(TWGPlace *)place;

@end


@implementation PlaceInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self configureContentFor:(TWGPlace *)context];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (void)configureContentFor:(TWGPlace *)place {
    [[self name] setText:place.name];
    
    if (place.vicinity) {
        [[self vicinity] setText:place.vicinity];
    }
    
    if (place.photoReference) {
        [[TWGDataProvider new] getPhotoByReference:place.photoReference onCompletion:^void(UIImage *image) {
            [[self placePhoto] setImage:image];
        }];
    }
}

@end



