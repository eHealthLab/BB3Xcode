//
//  GoalsViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/24/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoalsViewController.h"
#import "AppDelegate.h"

@implementation GoalsViewController
{
    AppDelegate *delegate;
}

@synthesize goalsDaysPerWeekPicker;
@synthesize goalsMinuterPerDayPicker;

-(void) viewWillAppear:(BOOL)animated
{
    
}

-(void) viewDidLoad
{
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [super viewDidLoad];
    
    _minutesPerDayArray = [[NSArray alloc] initWithObjects:@"10", @"15", @"20", @"25", @"30", nil];
    _daysPerWeekArray = [[NSArray alloc] initWithObjects:@"2", @"3", @"4", @"5", @"6", @"7", nil];
    
    goalsMinuterPerDayPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 200, 300, 200)];
    goalsDaysPerWeekPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 350, 300, 200)];
    
    goalsMinuterPerDayPicker.showsSelectionIndicator = YES;
    goalsMinuterPerDayPicker.hidden = NO;
    goalsMinuterPerDayPicker.delegate = self;
    [self.view addSubview:goalsMinuterPerDayPicker];
    [goalsMinuterPerDayPicker reloadAllComponents];
    
    goalsDaysPerWeekPicker.showsSelectionIndicator = YES;
    goalsDaysPerWeekPicker.hidden = NO;
    goalsDaysPerWeekPicker.delegate = self;
    [self.view addSubview:goalsDaysPerWeekPicker];
    [goalsDaysPerWeekPicker reloadAllComponents];
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [goalsDaysPerWeekPicker selectRow:delegate.goalsDaysComponent inComponent:0 animated:NO];
    [goalsMinuterPerDayPicker selectRow:delegate.goalsMinutesComponent inComponent:0 animated:NO];


}

-(void)viewWillDisappear:(BOOL)animated
{
    delegate.goalsMinutesComponent = (int)[goalsMinuterPerDayPicker selectedRowInComponent:0];
    delegate.goalsDaysComponent = (int)[goalsDaysPerWeekPicker selectedRowInComponent:1];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
    {
        return [_minutesPerDayArray count];
    }
    else
    {
        return [_daysPerWeekArray count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return [_minutesPerDayArray objectAtIndex:row];
    }
    else
    {
        return [_daysPerWeekArray objectAtIndex:row];
    }
    
}


- (void)viewDidUnload {
    //[self setLogMinutesPicker:nil];
    [super viewDidUnload];
}



@end