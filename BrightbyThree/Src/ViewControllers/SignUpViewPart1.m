//
//  SignUpViewPart1.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/13/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SignUpViewPart1.h"
#import "AppDelegate.h"
#import "LoginSignupView.h"

@implementation SignUpViewPart1
{
    NSData *responseData;
    NSMutableData *receivedData;
    AppDelegate *delegate;
    LoginSignupView *login;
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"view is here\n");
    
    [super viewWillAppear:YES];
    
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.firstNameField.delegate = self;
    self.lastNameField.delegate = self;
    self.emailField.delegate = self;
    self.passwordField.delegate = self;
    self.reenterPassword.delegate = self;
    
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
    if (textField == self.firstNameField) {
        delegate.firstName = self.firstNameField.text;
    }
    else if (textField == self.lastNameField) {
        delegate.lastName = self.lastNameField.text;
    }
    else if (textField == self.emailField){
        delegate.userEmail = self.emailField.text;
    }
    else if (textField == self.passwordField){
        delegate.userPassword = self.passwordField.text;
    }
    else if (textField == self.reenterPassword){
        delegate.confirmPassword = self.reenterPassword.text;
    }
}



@end
