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
    
    [self.imageView setImage:[UIImage imageNamed:@"goals.jpg"]];
    
    _daysPerWeekArray = [[NSArray alloc] initWithObjects:@"2", @"3", @"4", @"5", @"6", @"7", nil];
    
    _minutesPerDayArray = [[NSArray alloc] initWithObjects:@"10", @"15", @"20", @"25", @"30", nil];
    
    _goalsPicker.delegate = self;
    _goalsPicker.dataSource = self;
    
    /*
    NSString *string = [NSString stringWithFormat:@"%d", delegate.goalsDaysComponent];
    int indexOfDaysPerWeek = (int)[_daysPerWeekArray indexOfObject:string];
    string = [NSString stringWithFormat:@"%d", delegate.goalsMinutesComponent];
    int indexOfMinutesPerDay = (int)[_minutesPerDayArray indexOfObject:string];
    
    [_goalsPicker selectRow:indexOfDaysPerWeek inComponent:0 animated:NO];
    
    [_goalsPicker selectRow:indexOfMinutesPerDay inComponent:1 animated:NO];*/
    
    
    [self.saveButton setStyle:HTPressableButtonStyleRounded];
    self.saveButton.buttonColor = [UIColor ht_bitterSweetColor];
    self.saveButton.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [self.saveButton setStyle:HTPressableButtonStyleRounded];
    [self.saveButton setShadowHeight:0.8];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveGoalsPressed) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton.tag = 1;
    
    [_goalsPicker reloadAllComponents];

    
}

-(void)saveGoalsPressed
{
    HTPressableButton *button = (HTPressableButton*)[self.view viewWithTag:1];
    button.userInteractionEnabled = NO;
    button.alpha = 0.5;
    delegate.goalsDaysComponent = [_daysPerWeekArray objectAtIndex:[_goalsPicker selectedRowInComponent:0]];
    delegate.goalsMinutesComponent = [_minutesPerDayArray objectAtIndex:[_goalsPicker selectedRowInComponent:1]];
    NSLog(@"Goals are: %@, %@, %@", delegate.goalsDaysComponent, delegate.goalsMinutesComponent, delegate.userID);
    
    //NSString *daysString = [@(delegate.goalsDaysComponent) stringValue];
    //NSString *minutesString = [@(delegate.goalsMinutesComponent) stringValue];
    
    
    NSString *goalsString = [[[[delegate.goalsDaysComponent stringByAppendingString:@"/"] stringByAppendingString: delegate.goalsMinutesComponent] stringByAppendingString:@"/"] stringByAppendingString:delegate.userID];
    
    //NSString *goalsString = @"3/10/199";
    
    NSLog(@"goals are: %@", goalsString);
    
    NSString *urlString = [@"http://localhost:3000/setGoals/" stringByAppendingString:goalsString];
    NSLog(@"url string: %@", urlString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSData* data = [goalsString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //NSData *receivedData = [NSMutableData dataWithCapacity: 0];
    
    NSURLResponse* response = [[NSURLResponse alloc] init];
    NSError* error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error != nil)
    {
        NSLog(@"submitted request!");
        NSLog(@"response: %@", response);
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Success!" message:@"Your goals have successfully been updated."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];

    }

}

/*
-(void) viewDidAppear:(BOOL)animated
{
    NSString *string = [NSString stringWithFormat:@"%d", delegate.goalsDaysComponent];
    int indexOfDaysPerWeek = (int)[_daysPerWeekArray indexOfObject:string];
    string = [NSString stringWithFormat:@"%d", delegate.goalsMinutesComponent];
    int indexOfMinutesPerDay = (int)[_minutesPerDayArray indexOfObject:string];
    
    [_goalsPicker selectRow:indexOfDaysPerWeek inComponent:0 animated:NO];
    
    [_goalsPicker selectRow:indexOfMinutesPerDay inComponent:1 animated:NO];

}*/



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