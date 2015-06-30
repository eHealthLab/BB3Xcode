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
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"


@interface LogMinutes : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

//@property (nonatomic, retain) UIPickerView *logMinutesPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *logInMinutesPickerView;

@property(strong, nonatomic) NSString *selectedValue;
@property(strong, nonatomic) NSArray *minutesArray;

@end

#endif
