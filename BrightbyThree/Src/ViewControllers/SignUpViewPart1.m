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
    AppDelegate *appDelegate;
    LoginSignupView *login;
}



-(void) viewDidLoad
{
    login = [[LoginSignupView alloc] init];
    //login = (LoginSignupView*) [[UIApplication sharedApplication]];
}

- (IBAction)nextButtonPressed:(id)sender {
    
    
    NSLog(@"next pressed");
    //NSLog(@"new user\n");
    UIViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-2"];
    vc2.view.frame = login.loginView.bounds;
    [login.loginView addSubview:vc2.view];
    [self addChildViewController:vc2];
    [vc2 didMoveToParentViewController:self];
    
    /*UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-2"];
    vc1.view.frame = self.loginView.bounds;
    [self.loginView addSubview:vc1.view];
    [self addChildViewController:vc1];
    [vc1 didMoveToParentViewController:self];*/
    
}
@end
