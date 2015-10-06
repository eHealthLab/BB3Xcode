//
//  DailyGoals.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/5/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_DailyGoals_h
#define BrightbyThree_DailyGoals_h

#import<UIKit/UIKit.h>

@interface DailyGoals : UIViewController
- (IBAction)decrementPressed:(id)sender;
- (IBAction)incrementPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;


@end

#endif
