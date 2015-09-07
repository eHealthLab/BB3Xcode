//
//  LoginViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/13/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//
//  Created by Aarti Munjal on 5/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
// This program is free software; you can
// redistribute it and/or modify it under the terms
// of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of
// the License, or (at your option) any later
//version.

// This program is distributed in the hope that it
// will be useful, but WITHOUT ANY WARRANTY; without
// even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.

// You should have received a copy of the GNU General
// Public License along with this program; if not,
// write to the Free Software Foundation, Inc., 51
// Franklin Street, Fifth Floor, Boston, MA
// 02110-1301, USA.


#ifndef BrightbyThree_LoginViewController_h
#define BrightbyThree_LoginViewController_h

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"
#import "ACPButton.h"

@interface LoginViewController : UIViewController

- (IBAction)LoginPressed;

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;
@property (strong, nonatomic) IBOutlet HTPressableButton *loginButton;

//@property (strong, nonatomic) IBOutlet HTPressableButton *signupButton;
@property (weak, nonatomic) IBOutlet UILabel *forgotPasswordLabel;

//@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;


@end

#endif
