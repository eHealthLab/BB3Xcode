//
//  logMinutes.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_logMinutes_h
#define BrightbyThree_logMinutes_h

#import<UIKit/UIKit.h>


@interface LogMinutes : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, retain) UIPickerView *logMinutesPicker;

@property(strong, nonatomic) NSString *selectedValue;
@property(strong, nonatomic) NSArray *minutesArray;

@end

#endif
