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
@synthesize logMinutesPicker;

- (void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [super viewDidLoad];
    
    _minutesArray = [[NSArray alloc] initWithObjects:@"5", @"10", @"15", @"20", @"25", @"30", @"35", @"40", @"45", @"50", @"55", @"60", nil];
    logMinutesPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 200, 300, 200)];
    logMinutesPicker.showsSelectionIndicator = YES;
    logMinutesPicker.hidden = NO;
    logMinutesPicker.delegate = self;
    [self.view addSubview:logMinutesPicker];
    [logMinutesPicker reloadAllComponents]; 
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"Inside view did appear for log minutes");
    
    
    [logMinutesPicker selectRow:delegate.minutesComponent inComponent:0 animated:NO];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    delegate.minutesComponent = (int)[logMinutesPicker selectedRowInComponent:0];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
        return [_minutesArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   return [_minutesArray objectAtIndex:row];
    
}


- (void)viewDidUnload {
    //[self setLogMinutesPicker:nil];
    [super viewDidUnload];
}


@end