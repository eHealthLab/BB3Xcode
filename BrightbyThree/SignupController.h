//
//  SignupController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_SignupController_h
#define BrightbyThree_SignupController_h
#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface SignupController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *childNameField;
@property (weak, nonatomic) IBOutlet UITextField *childDOBField;
@property (weak, nonatomic) IBOutlet UITextField *childGenderField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;


@property (weak, nonatomic) IBOutlet UIScrollView *signupScroll;
@property (weak, nonatomic) IBOutlet HTPressableButton *signupButton;


@end

#endif
