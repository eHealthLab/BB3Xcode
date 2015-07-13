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
    
    //UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 350, 100)];
    /*self.label.numberOfLines = 3;
    self.label.text = [[@"You currently have " stringByAppendingString:[NSString stringWithFormat:@"%d", (int)delegate.totalPoints]] stringByAppendingString:@" total points. Log in more minutes."];
    
    self.label.textAlignment=NSTextAlignmentJustified;
    [self.label sizeToFit];*/

    /*CGRect frame = self.label.frame;
    frame.size.height = self.label.
    self.label.frame = frame;*/
    
    self.totalPointsView.text = [[@"You currently have " stringByAppendingString:[NSString stringWithFormat:@"%d", (int)delegate.totalPoints]] stringByAppendingString:@" total points. Log in more minutes."];
    self.totalPointsView.textAlignment=NSTextAlignmentJustified;
    [self.totalPointsView sizeToFit];
    [self.totalPointsView setScrollEnabled:YES];
    //[uiViewController.view addSubview:textViewDetail1];
    [self.view addSubview:self.totalPointsView];
    CGRect frame = self.totalPointsView.frame;
    frame.size.height = self.totalPointsView.contentSize.height;
    self.totalPointsView.frame = frame;
    

    [self.saveButton setStyle:HTPressableButtonStyleRounded];
    self.saveButton.buttonColor = [UIColor ht_bitterSweetColor];
    self.saveButton.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [self.saveButton setShadowHeight:0.8];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveMinutesPressed) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton.tag = 1;
    
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