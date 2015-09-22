//
//  ProgressViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_ProgressViewController_h
#define BrightbyThree_ProgressViewController_h

#import <UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface ProgressViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *totalMinutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastWeekPoints;
@property (weak, nonatomic) IBOutlet UILabel *monthlyPoints;
@property (weak, nonatomic) IBOutlet UIButton *rewardsButton;
- (IBAction)rewardsButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *goalsButton;
- (IBAction)modifyGoalsButtonPressed:(id)sender;





@end

#endif
