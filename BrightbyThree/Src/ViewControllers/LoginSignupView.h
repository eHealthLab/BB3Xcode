//
//  LoginSignupView.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/3/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_LoginSignupView_h
#define BrightbyThree_LoginSignupView_h

#import<UIKit/UIKit.h>
@interface LoginSignupView: UIViewController

@property (weak, nonatomic) IBOutlet UIView *loginView;
- (IBAction)selectionMade:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *loginSignupSegment;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)nextButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButtonPressed;
@property (weak, nonatomic) IBOutlet UIButton *createAccountButton;
- (IBAction)createAccountButtonPressed:(id)sender;



@property (weak, nonatomic) IBOutlet UIButton *loginButtonPressed;
- (IBAction)loginButtonPressed:(id)sender;

@end


#endif
