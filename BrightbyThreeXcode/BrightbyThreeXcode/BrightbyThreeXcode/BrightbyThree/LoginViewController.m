//
//  LoginViewController.m
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


#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "AFNetworking.h"



@interface LoginViewController ()

@property(strong, nonatomic) AppDelegate *delegate;


@end

@implementation LoginViewController



- (void)viewDidLoad
{
   // [super viewDidLoad];
    self.delegate = [AppDelegate alloc];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setTitle:@"Login" forState:UIControlStateNormal];
    button.frame = CGRectMake(110.0, 320.0, 160.0, 40.0);
    [button setBackgroundColor:[UIColor blackColor]];
    
    // Draw a custom gradient
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = button.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
                          (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
                          nil];
    [button.layer insertSublayer:btnGradient atIndex:0];
    
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    CALayer *btnLayer = [button layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    
    [btnLayer setBorderWidth:1.0f];
    [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [button addTarget:self action:@selector(LoginPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    
    UIButton *signupButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [signupButton setTitle:@"Signup" forState:UIControlStateNormal];
    signupButton.frame = CGRectMake(190.0, 470.0, 80.0, 30.0);
    signupButton.backgroundColor = [UIColor colorWithRed:128 green:0 blue:0 alpha:1];
    //[signupButton setBackgroundColor:[self.signupButton colorWithHexString:@"#8B0000"]];
    
    /* Draw a custom gradient
    btnGradient.frame = signupButton.bounds;

    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
                          (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
                          nil];
    [button.layer insertSublayer:btnGradient atIndex:0];
    [signupButton.layer insertSublayer:btnGradient atIndex:1];
    
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [signupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signupButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    */
    CALayer *signupButtonLayer = [signupButton layer];
    
    [signupButtonLayer setMasksToBounds:YES];
    [signupButtonLayer setCornerRadius:5.0f];
    [signupButtonLayer setBorderWidth:1.0f];
    [signupButtonLayer setBorderColor:[[UIColor blackColor] CGColor]];
    
     
    [signupButton addTarget:self action:@selector(ShowSignUpForm) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:signupButton];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 360, 180, 30)];
    label.text = @"Forgot your password?";
    label.font = [UIFont systemFontOfSize:14.0];
    //Tap Gesture
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedForgotPassword:)];
    //Adding userinteraction for label
    [label setUserInteractionEnabled:YES];
    //Adding label to tap gesture
    [label addGestureRecognizer:gesture];
    [self.view addSubview:label];

}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)userTappedForgotPassword:(id)sender
{
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailComposer;
        NSString *emailTitle = @"Enquiry Regarding GLIMMPSE Lite";
        NSString *messageBody = @" ";
        mailComposer =[[MFMailComposeViewController alloc]init];
        mailComposer.mailComposeDelegate = self;
        NSArray *emailAddresses = [[NSArray alloc]initWithObjects:@"samplesizeshop@gmail.com", nil]; //feedback@glimmpse.samplesizeshop.com
        [mailComposer setSubject:emailTitle];
        [mailComposer setMessageBody:messageBody isHTML:YES];
        [mailComposer setToRecipients:emailAddresses];
        //[self presentModalViewController:mailComposer animated:YES];
        [self presentViewController:mailComposer animated:YES completion:nil];
        
    }
    else {
        
        /** If no email account has been setup, user gets a message alert with Error message.
         *
         */
        
        //NSLog(@"please setup an email ID first");
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please Set Up an email accout on your device first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
    }
}

-(void)ShowSignUpForm
{
    UITableViewController *uiTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"signUpViewController"];
    [self.navigationController pushViewController:uiTableViewController animated:YES];
}

- (void)LoginPressed{

    self.delegate.userEmail = self.loginEmail.text;
    self.delegate.userPassword = self.loginPassword.text;
    
    NSLog(@"user: %@ %@", self.loginEmail.text , self.loginPassword.text);
    
    NSLog(@"id and password: %@ %@", self.delegate.userEmail , self.delegate.userPassword);
    
    NSArray *keys = [NSArray arrayWithObjects:@"lat", @"lng", nil];
    NSArray *objects = [NSArray arrayWithObjects:@"0.0",@"0.0", nil];
    
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    NSData *jsonData ;
    NSString *jsonString;
    if([NSJSONSerialization isValidJSONObject:jsonDictionary])
    {
        jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary options:0 error:nil];
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    
    NSString *urlString = [[[@"http://localhost:3000/loginSignup/" stringByAppendingString:self.delegate.userEmail] stringByAppendingString:@"/"] stringByAppendingString:self.loginPassword.text];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, [responseCode statusCode]);
        
    }
    else {
        NSString *response = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
        NSLog(@"response is: %@", response);
        
        UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        
        NSLog(@"done sending");
    }
    
    

}



      
@end
