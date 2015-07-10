//
//  DashboardViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/24/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_DashboardViewController_h
#define BrightbyThree_DashboardViewController_h

#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface DashboardViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *buttonScroll;

@property (weak, nonatomic) IBOutlet HTPressableButton *setGoalsButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *facebookButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *logMinutesButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *networkButton;

@property (weak, nonatomic) IBOutlet HTPressableButton *badgesButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *messagesButton;

@end

#endif
