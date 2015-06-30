//
//  GoalsViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/24/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_GoalsViewController_h
#define BrightbyThree_GoalsViewController_h

#import <UIKit/UIKit.h>

@interface GoalsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, retain) UIPickerView *goalsMinuterPerDayPicker;
@property(nonatomic, retain) UIPickerView *goalsDaysPerWeekPicker;

@property(strong, nonatomic) NSString *selectedValueDaysPerWeek;
@property(strong, nonatomic) NSString *selectedValueMinutesPerDay;
@property(strong, nonatomic) NSArray *minutesPerDayArray;
@property(strong, nonatomic) NSArray *daysPerWeekArray;

@end

#endif
