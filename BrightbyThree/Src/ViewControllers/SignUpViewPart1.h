//
//  SignUpViewPart1.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/13/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_SignUpViewPart1_h
#define BrightbyThree_SignUpViewPart1_h

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"
#import "ACPButton.h"

@interface SignUpViewPart1: UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reenterPassword;

//@property (weak, nonatomic) IBOutlet HTPressableButton *nextButton;
//- (IBAction)nextButtonPressed:(id)sender;

@end

#endif
