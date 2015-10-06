//
//  WeeklyGoals.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/5/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeeklyGoals.h"
#import "AppDelegate.h"

@implementation WeeklyGoals
{
    AppDelegate *delegate;
}


-(void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    if (delegate.weeklyPointsGoals == 0 || delegate.dailyPointsGoals == 0) {
        
    }
    else {
        int days = delegate.weeklyPointsGoals/delegate.dailyPointsGoals;
        self.daysLabel.text = [NSString stringWithFormat:@"%d", days];
    }
    
}

- (IBAction)decrementPressed:(id)sender {
    if ([self.daysLabel.text isEqualToString:@"2"]) {
        NSLog(@"invalid\n");
    }
    else {
        //NSString *label = self.timerLabel.text;
        int value = [self.daysLabel.text intValue];
        value--;
        self.daysLabel.text = [@(value) stringValue];
        delegate.goalsDaysComponent = self.daysLabel.text;
        
        delegate.weeklyPointsGoals=  delegate.dailyPointsGoals * value;
        delegate.monthlyPointsGoals = 4 * delegate.weeklyPointsGoals;
        
         NSLog(@"daily, weekly, monthly goals are: %d, %d, %d\n", delegate.dailyPointsGoals, delegate.weeklyPointsGoals, delegate.monthlyPointsGoals);
    }
}

- (IBAction)incrementPressed:(id)sender {
    if ([self.daysLabel.text isEqualToString:@"7"]) {
        NSLog(@"invalid\n");
    }
    else {
        int value = [self.daysLabel.text intValue];
        value++;
        self.daysLabel.text = [@(value) stringValue];
        delegate.goalsDaysComponent = self.daysLabel.text;
        
        delegate.weeklyPointsGoals=  delegate.dailyPointsGoals * value;
        delegate.monthlyPointsGoals = 4 * delegate.weeklyPointsGoals;
        
        NSLog(@"daily, weekly, monthly goals are: %d, %d, %d\n", delegate.dailyPointsGoals, delegate.weeklyPointsGoals, delegate.monthlyPointsGoals);
    }
}
@end
