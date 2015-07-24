//
//  SettingsViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/13/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_SettingsViewController_h
#define BrightbyThree_SettingsViewController_h

#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface SettingsViewController:UIViewController

@property (weak, nonatomic) IBOutlet UITextField *feedbackText;
@property (weak, nonatomic) IBOutlet HTPressableButton *sendFeedback;

@property (weak, nonatomic) IBOutlet HTPressableButton *logout;

@end

#endif
