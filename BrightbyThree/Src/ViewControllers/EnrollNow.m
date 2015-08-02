//
//  EnrollNow.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/28/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnrollNow.h"

@implementation EnrollNow

-(void)viewDidLoad
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *signupButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setTitle:@"Login" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setBackgroundColor:[UIColor blackColor]];
    
    [signupButton setTitle:@"Signup" forState:UIControlStateNormal];
    signupButton.frame = CGRectMake(80.0, 310.0, 160.0, 40.0);
    [signupButton setBackgroundColor:[UIColor blackColor]];
    
    // Draw a custom gradient
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = button.bounds;
    btnGradient.frame = signupButton.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
                          (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
                          nil];
    [button.layer insertSublayer:btnGradient atIndex:0];
    [signupButton.layer insertSublayer:btnGradient atIndex:1];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [signupButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //button.backgroundColor = [[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor];
    CALayer *btnLayer = [button layer];
    CALayer *signupButtonLayer = [signupButton layer];
    
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    [btnLayer setBorderWidth:1.0f];
    [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [signupButtonLayer setMasksToBounds:YES];
    [signupButtonLayer setCornerRadius:5.0f];
    [signupButtonLayer setBorderWidth:1.0f];
    [signupButtonLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
    
    [self.view addSubview:button];
    [self.view addSubview:signupButton];
    
    [button sendActionsForControlEvents:UIControlEventTouchUpInside];
    [signupButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    
}

@end