//
//  tmAppDelegate.h
//  temperatures
//
//  Created by Kelsey on 1/24/13.
//  Copyright (c) 2013 Kelsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class tmViewController;

@interface tmAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) tmViewController *viewController;

@property (strong, nonatomic) CLLocationManager *locationManager;

-(void)getLocation;

@end
