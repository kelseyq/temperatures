//
//  tmViewController.h
//  temperatures
//
//  Created by Kelsey on 1/24/13.
//  Copyright (c) 2013 Kelsey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tmViewController : UIViewController <UITextFieldDelegate>

@property(weak,nonatomic) IBOutlet UITextField *temperatureTextField;
@property(weak,nonatomic) IBOutlet UILabel *temperatureLabel;
@property(weak,nonatomic) IBOutlet UISegmentedControl *conversionDirection;
@property(weak,nonatomic) IBOutlet UIButton *locationButton;
@property(weak,nonatomic) IBOutlet UILabel *locationLabel;

- (IBAction)conversionDirectionSwitched:(id)sender;
- (IBAction)locationButtonPressed:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end