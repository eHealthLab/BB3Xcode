//
//  logMinutes.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "logMinutes.h"
#import "AppDelegate.h"

@implementation LogMinutes
{
    AppDelegate *delegate;
}


- (void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [super viewDidLoad];
    
    _minutesArray = [[NSArray alloc] initWithObjects:@"5", @"10", @"15", @"20", @"25", @"30", @"35", @"40", @"45", @"50", @"55", @"60", nil];
    
    _logInMinutesPickerView.delegate = self;
    _logInMinutesPickerView.dataSource = self;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 350, 100)];
    label.numberOfLines = 3;
    label.text = [[@"You currently have " stringByAppendingString:[NSString stringWithFormat:@"%d", (int)delegate.totalPoints]] stringByAppendingString:@" total points. Log in more minutes."];
    
    
    CGRect frame = CGRectMake(150, 590, 100, 40);
    HTPressableButton *saveButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    saveButton.buttonColor = [UIColor ht_bitterSweetColor];
    saveButton.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveMinutesPressed) forControlEvents:UIControlEventTouchUpInside];
    saveButton.tag = 1;
    
    
    [self.view addSubview:saveButton];
    [self.view addSubview:label];
    [_logInMinutesPickerView reloadAllComponents];
}

-(void)saveMinutesPressed
{
    HTPressableButton *button = (HTPressableButton*)[self.view viewWithTag:1];
    button.userInteractionEnabled = NO;
    button.alpha = 0.5;
    NSLog(@"total minutes before: %d", (int)delegate.totalPoints);
    delegate.totalPoints = delegate.totalPoints + (int)[[_minutesArray objectAtIndex:[_logInMinutesPickerView selectedRowInComponent:0]] intValue];
    NSLog(@"total minutes after: %d", (int)delegate.totalPoints);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 350, 100)];
    label.numberOfLines = 3;
    label.text = [[@"You currently have " stringByAppendingString:[NSString stringWithFormat:@"%d", (int)delegate.totalPoints]] stringByAppendingString:@" total points. Log in more minutes."];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _minutesArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_minutesArray objectAtIndex:row];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end