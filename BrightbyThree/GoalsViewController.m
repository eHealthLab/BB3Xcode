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


//@synthesize goalsMinuterPerDayPicker;

-(void) viewWillAppear:(BOOL)animated
{
    
}

-(void) viewDidLoad
{
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [super viewDidLoad];
    
    _daysPerWeekArray = [[NSArray alloc] initWithObjects:@"2", @"3", @"4", @"5", @"6", @"7", nil];
    
    _minutesPerDayArray = [[NSArray alloc] initWithObjects:@"10", @"15", @"20", @"25", @"30", nil];
    
    _goalsPicker.delegate = self;
    _goalsPicker.dataSource = self;
    
    CGRect frame = CGRectMake(150, 530, 100, 40);
    HTPressableButton *saveButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    saveButton.buttonColor = [UIColor ht_bitterSweetColor];
    saveButton.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveGoalsPressed) forControlEvents:UIControlEventTouchUpInside];
    saveButton.tag = 1;
    
    [self.view addSubview:saveButton];

    
}

-(void)saveGoalsPressed
{
    HTPressableButton *button = (HTPressableButton*)[self.view viewWithTag:1];
    button.userInteractionEnabled = NO;
    button.alpha = 0.5;
    delegate.goalsDaysComponent = (int)[[_daysPerWeekArray objectAtIndex:[_goalsPicker selectedRowInComponent:0]] intValue];
    delegate.goalsMinutesComponent = (int)[[_minutesPerDayArray objectAtIndex:[_goalsPicker selectedRowInComponent:1]] intValue];
    NSLog(@"Goals are: %d, %d", delegate.goalsDaysComponent, delegate.goalsMinutesComponent);

}

-(void) viewDidAppear:(BOOL)animated
{
    NSString *string = [NSString stringWithFormat:@"%d", delegate.goalsDaysComponent];
    int indexOfDaysPerWeek = (int)[_daysPerWeekArray indexOfObject:string];
    string = [NSString stringWithFormat:@"%d", delegate.goalsMinutesComponent];
    int indexOfMinutesPerDay = (int)[_minutesPerDayArray indexOfObject:string];
    
    [_goalsPicker selectRow:indexOfDaysPerWeek inComponent:0 animated:NO];
    
    [_goalsPicker selectRow:indexOfMinutesPerDay inComponent:1 animated:NO];

}

-(void)viewWillDisappear:(BOOL)animated
{
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
    {
        return [_daysPerWeekArray count];
    }
    else
    {
        return [_minutesPerDayArray count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return [_daysPerWeekArray objectAtIndex:row];
    }
    else
    {
        return [_minutesPerDayArray objectAtIndex:row];
    }
    
}


- (void)viewDidUnload {
    //[self setLogMinutesPicker:nil];
    [super viewDidUnload];
}



@end