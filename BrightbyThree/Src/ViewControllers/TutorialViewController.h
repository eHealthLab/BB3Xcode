//
//  TutorialViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/2/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_TutorialViewController_h
#define BrightbyThree_TutorialViewController_h
#import "UIKit/UIKit.h"
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface TutorialViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIScrollView *tutorialScrollView;

@property (weak, nonatomic) IBOutlet HTPressableButton *button1;
@property (weak, nonatomic) IBOutlet HTPressableButton *button2;
@property (weak, nonatomic) IBOutlet HTPressableButton *button3;
@property (weak, nonatomic) IBOutlet HTPressableButton *button4;
@property (weak, nonatomic) IBOutlet HTPressableButton *button5;
@property (weak, nonatomic) IBOutlet HTPressableButton *button6;
@property (weak, nonatomic) IBOutlet HTPressableButton *button7;
@property (weak, nonatomic) IBOutlet HTPressableButton *button8;
@property (weak, nonatomic) IBOutlet HTPressableButton *button9;
@property (weak, nonatomic) IBOutlet HTPressableButton *button10;
@property (weak, nonatomic) IBOutlet HTPressableButton *button11;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *iconButton;


@end

#endif
