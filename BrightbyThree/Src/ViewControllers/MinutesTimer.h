//
//  MinutesTimer.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_MinutesTimer_h
#define BrightbyThree_MinutesTimer_h

#import<UIKit/UIKit.h>

@interface MinutesTimer : UIViewController

@property(weak, nonatomic) NSString *startTimer;
@property (strong) NSTimer * messageTimer;

@property(strong, nonatomic) IBOutlet UILabel *timerLabel;
-(void)updateMinutes;

@end

#endif
