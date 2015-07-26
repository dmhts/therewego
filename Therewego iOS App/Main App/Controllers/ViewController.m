//
//  ViewController.m
//  therewego
//
//  Created by Dmitry Gutsulyak on 7/21/15.
//  Copyright © 2015 SHAPE GmbH. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationCoordinate2D points[0];
    points[0] = CLLocationCoordinate2DMake(-33.8670522, 151.1957362);
    
    NSArray *types = @[@"train_station"];
    
    TWGDataProvider *dataProvider = [TWGDataProvider new];
    
    [dataProvider getNearbyPlacesByCoordinates:&points[0] inRadius:500 withTypes:types onCompletion:^void(NSArray *places) {
        // TODO: Transfer derived data to Watch.
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
