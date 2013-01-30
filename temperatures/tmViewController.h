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



- (IBAction)conversionDirectionSwitched:(id)sender;

@end