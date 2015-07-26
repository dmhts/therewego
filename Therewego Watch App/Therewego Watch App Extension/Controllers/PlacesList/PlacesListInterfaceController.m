//
//  PlacesListInterfaceController.m
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/27/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "PlacesListInterfaceController.h"


@interface PlacesListInterfaceController(PrivateMethods)

/**
    Configures a table for the curren controller.
*/
-(void)configureTable;

@end


@implementation PlacesListInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self configureTable];
}

- (void)willActivate {
    [super willActivate];
    
    [self configureTable];
}

- (void)didDeactivate {
    [super didDeactivate];
}

-(void)table:(nonnull WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {

}

-(void)configureTable {
    int placesCount = [[TWGPlaceCollection sharedInstance].places count];
    
    [self.placesList setNumberOfRows:placesCount withRowType:@"PlaceCell"];
    
    for (int index = 0; index < placesCount; index++) {
        PlaceRowController *placeRowController = [self.placesList rowControllerAtIndex:index];
        TWGPlace *place = [[TWGPlaceCollection sharedInstance] getPlaceBy:index];
        
        [placeRowController.label setText:place.name];
    }
}

@end



