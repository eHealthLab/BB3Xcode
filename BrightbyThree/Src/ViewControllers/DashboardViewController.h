//
//  DashboardViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/24/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_DashboardViewController_h
#define BrightbyThree_DashboardVie//wController_h

#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"
#import "MRoundedButton.h"
#import "JSBadgeView.h"

@interface DashboardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *centralImage;

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;


@property (weak, nonatomic) IBOutlet HTPressableButton *setGoalsButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *facebookButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *logMinutesButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *networkButton;

@property (strong, nonatomic) IBOutlet HTPressableButton *badgesButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *messagesButton;
@property (weak, nonatomic) IBOutlet UIView *buttonsView;

@property (weak, nonatomic) IBOutlet UILabel *totalPointsLabel;


@end

#endif
