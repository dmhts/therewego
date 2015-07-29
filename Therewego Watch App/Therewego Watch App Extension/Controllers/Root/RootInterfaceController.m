//
//  InterfaceController.m
//  watchapp Extension
//
//  Created by Dmitry Gutsulyak on 7/22/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "RootInterfaceController.h"


@interface RootInterfaceController()

@property NSString *cancelRequestLocationTitle;
@property NSString *restrictedText;

- (void) fireHideError;

@end


@implementation RootInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.isRequestingLocation = FALSE;
    self.requestLocationTitle = @"Show nearest transport stations";
    self.cancelRequestLocationTitle = @"Cancel requesting location ...";
    self.deniedText = @"Location authorization denied.";
    self.restrictedText = @"Location authorization restricted.";
    self.unexpectedText = @"Unexpected authorization status.";
    self.fetchingPlacesTitle = @"Fetching places, please wait ...";
    
    [self.gpsButton setTitle:self.requestLocationTitle];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}


/**
    Requests location.
*/
- (IBAction)didTapButton {
    if (self.isRequestingLocation) {
        [self.locationManager stopUpdatingLocation];
        self.isRequestingLocation = FALSE;
        [self.gpsButton setTitle:self.requestLocationTitle];
        
        return;
    }
    
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    
    switch (authorizationStatus) {
        case kCLAuthorizationStatusNotDetermined:
            self.isRequestingLocation = TRUE;
            [self.gpsButton setTitle:self.cancelRequestLocationTitle];
            [self.locationManager requestWhenInUseAuthorization];
            break;
        case kCLAuthorizationStatusDenied:
            [self showErrorWith:self.deniedText];
            break;
        case kCLAuthorizationStatusRestricted:
            [self showErrorWith:self.restrictedText];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            self.isRequestingLocation = TRUE;
            [self.locationManager requestLocation];
            [self.gpsButton setTitle:self.cancelRequestLocationTitle];
            break;
        default:
            [self showErrorWith:self.unexpectedText];
    }
}

- (void)showErrorWith:(NSString *)text {
    [self.errorLabel setHidden:FALSE];
    [self.errorLabel setText:text];
    [self hideErrorAfter:3];
}

- (void)hideErrorAfter:(double)seconds {
    [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(fireHideError) userInfo:nil repeats:FALSE];
}

- (void)fireHideError {
    [self.errorLabel setHidden:TRUE];
}

@end



