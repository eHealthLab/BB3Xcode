//
//  DailyGoals.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/5/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DailyGoals.h"
#import "AppDelegate.h"

@implementation DailyGoals
{
    AppDelegate *delegate;
}

-(void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if (delegate.weeklyPointsGoals == 0 || delegate.dailyPointsGoals == 0) {
        
    }
    else {
        self.minutesLabel.text = [NSString stringWithFormat:@"%d", delegate.dailyPointsGoals];
    }
}

- (IBAction)decrementPressed:(id)sender {
    if ([self.minutesLabel.text isEqualToString:@"10"]) {
        
        NSLog(@"invalid\n");
        
    }
    else {
        //NSString *label = self.timerLabel.text;
        int value = [self.minutesLabel.text intValue];
        value--;
        self.minutesLabel.text = [@(value) stringValue];
        delegate.dailyPointsGoals = value;
        delegate.weeklyPointsGoals= value * [delegate.goalsDaysComponent intValue];
        delegate.monthlyPointsGoals = 4 * delegate.weeklyPointsGoals;
        
         NSLog(@"daily, weekly, monthly goals are: %d, %d, %d\n", delegate.dailyPointsGoals, delegate.weeklyPointsGoals, delegate.monthlyPointsGoals);
    }
}

- (IBAction)incrementPressed:(id)sender {
    if ([self.minutesLabel.text isEqualToString:@"60"]) {
        NSLog(@"invalid\n");
    }
    else {
        //NSString *label = self.timerLabel.text;
        int value = [self.minutesLabel.text intValue];
        value++;
        self.minutesLabel.text = [@(value) stringValue];
        delegate.dailyPointsGoals = value;
        delegate.weeklyPointsGoals= value * [delegate.goalsDaysComponent intValue];
        delegate.monthlyPointsGoals = 4 * delegate.weeklyPointsGoals;
        
         NSLog(@"daily, weekly, monthly goals are: %d, %d, %d\n", delegate.dailyPointsGoals, delegate.weeklyPointsGoals, delegate.monthlyPointsGoals);
    }
}
@end