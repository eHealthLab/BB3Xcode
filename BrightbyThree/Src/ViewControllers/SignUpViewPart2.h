//
//  SignUpViewPart2.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_SignUpViewPart2_h
#define BrightbyThree_SignUpViewPart2_h

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"
#import "ACPButton.h"

@interface SignUpViewPart2: UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *zipcode;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *babyName;
@property (weak, nonatomic) IBOutlet UITextField *babyDOB;
@property (weak, nonatomic) IBOutlet UITextField *babyGender;

@end

#endif
