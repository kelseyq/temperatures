//
//  tmViewController.m
//  temperatures
//
//  Created by Kelsey on 1/24/13.
//  Copyright (c) 2013 Kelsey. All rights reserved.
//

#import "tmViewController.h"
#import "tmAppDelegate.h"

@interface tmViewController ()

@end

@implementation tmViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    //calculate temperature on return
    [self calculateTemperature];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"-0123456789."] invertedSet];
    return ([string stringByTrimmingCharactersInSet:nonNumberSet].length > 0) || [string isEqualToString:@""];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.temperatureTextField becomeFirstResponder];
//
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.temperatureTextField.delegate = self;
    // set labels to invisible 
    self.temperatureLabel.text = @" ";
    self.locationLabel.text = @" ";
    //set keyboard to numbers only
    self.temperatureTextField.keyboardType=UIKeyboardTypeDecimalPad;
}

-(IBAction)backgroundTap:(id)sender{
    NSLog(@"touchBackground was called");
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)locationButtonPressed:(id)sender; {
    tmAppDelegate *appDelegate=(tmAppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate getLocation];
    
    if([CLLocationManager locationServicesEnabled]){
        CLLocation *currentLocation=appDelegate.locationManager.location;
        NSString *latLong = [NSString stringWithFormat:(@"latitude %+.6f, longitude %+.6f\n"),
                             currentLocation.coordinate.latitude,
                             currentLocation.coordinate.longitude];
        NSLog(@"%@", latLong);
        self.locationLabel.text = latLong;
    }
}

- (IBAction)conversionDirectionSwitched:(id)sender;
{
    [self calculateTemperature];
}

-(void)calculateTemperature
{
    [self.temperatureTextField resignFirstResponder];
    
    float startingTemperature = [self.temperatureTextField.text floatValue];
    
    float endTemperature;
    NSString *temperatureAbbreviation;
    
    if (self.conversionDirection.selectedSegmentIndex == 0) {
        NSLog(@"HAY BUDDY YOU ENTERED %@ F to C", self.temperatureTextField.text);
        temperatureAbbreviation = @"C";
        endTemperature = (startingTemperature - 32.0f) * (5.0f/9.0f);
    } else {
        NSLog(@"HAY BUDDY YOU ENTERED %@ C to F", self.temperatureTextField.text);
        temperatureAbbreviation = @"F";
        endTemperature = (startingTemperature * (9.0f/5.0f)) + 32.0f;
    }
    
    //format temperature
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setPositiveFormat:@"###0.##°"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[[NSNumber alloc] initWithFloat:endTemperature]];
    
    self.temperatureLabel.text = [NSString stringWithFormat:(@"%@%@"), formattedNumberString, temperatureAbbreviation];
}

@end
