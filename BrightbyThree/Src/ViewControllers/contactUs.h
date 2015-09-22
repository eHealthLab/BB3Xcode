//
//  contactUs.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_contactUs_h
#define BrightbyThree_contactUs_h

#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface contactUs:UIViewController

@property (weak, nonatomic) IBOutlet UITextField *feedbackText;
@property (weak, nonatomic) IBOutlet HTPressableButton *sendFeedback;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *iconButton;

@property (weak, nonatomic) IBOutlet UITextView *textLabel;

@end

#endif
