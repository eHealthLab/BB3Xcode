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
//#import "AFNetworking.h"


@interface LoginViewController ()

@property(strong, nonatomic) AppDelegate *delegate;


@end

@implementation LoginViewController
{
    AppDelegate *appDelegate;
    NSMutableData *responseData;
    NSMutableData *receivedData;
    NSUserDefaults *prefs;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"inside login view didload\n");
    
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Mom reading with baby - anglo.jpg"]]];
    
    prefs = [NSUserDefaults standardUserDefaults];
    
    self.loginEmail.text = [prefs objectForKey:@"userName"];
    self.loginPassword.text = [prefs objectForKey:@"password"];
    
    //self.loginEmail.text = appDelegate.userEmail;
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Toddler on grass.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.3];
    
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    //UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(80, 300, 10, 10)];
    [self.rememberSwitch addTarget:self action:@selector(rememberMePressed) forControlEvents:UIControlEventTouchUpInside];
    
        self.loginButton.cornerRadius = 10.0;
        self.loginButton.shadowHeight = self.loginButton.frame.size.height * 0.17;
        [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
        self.loginButton.buttonColor = [UIColor ht_mintColor];
        self.loginButton.shadowColor = [UIColor ht_mintDarkColor];
        [self.loginButton addTarget:self action:@selector(LoginPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.loginButton];
    
    self.signupButton.cornerRadius = 10.0;
    self.signupButton.shadowHeight = self.signupButton.frame.size.height * 0.17;
    [self.signupButton setTitle:@"Signup" forState:UIControlStateNormal];
    self.signupButton.buttonColor = [UIColor ht_grapeFruitColor];
    self.signupButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    
    [self.view addSubview:self.signupButton];
    
    [self.signupButton addTarget:self action:@selector(ShowSignUpForm) forControlEvents:UIControlEventTouchUpInside];
    

    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedForgotPassword:)];
    //Adding userinteraction for label
    [self.forgotPasswordLabel setUserInteractionEnabled:YES];
    //Adding label to tap gesture
    [self.forgotPasswordLabel addGestureRecognizer:gesture];
    [self.view addSubview:self.forgotPasswordLabel];

}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)rememberMePressed
{
   // NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // saving an NSString
    [prefs setObject:_loginEmail.text forKey:@"userName"];
    [prefs setObject:_loginPassword.text forKey:@"password"];
    
    [prefs synchronize];
}

-(void)userTappedForgotPassword:(id)sender
{
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailComposer;
        NSString *emailTitle = @"Reset my password";
        NSString *messageBody = @" ";
        mailComposer =[[MFMailComposeViewController alloc]init];
        mailComposer.mailComposeDelegate = self;
        NSArray *emailAddresses = [[NSArray alloc]initWithObjects:@"agileehealth@gmail.com", nil]; 
        [mailComposer setSubject:emailTitle];
        [mailComposer setMessageBody:messageBody isHTML:YES];
        [mailComposer setToRecipients:emailAddresses];
        [self presentModalViewController:mailComposer animated:YES];
        [self presentViewController:mailComposer animated:YES completion:nil];
        
    }
    else {
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please Set Up an email accout on your device first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
    }
}

-(void)ShowSignUpForm
{
    UITableViewController *uiTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"signupForm"];
    [self.navigationController pushViewController:uiTableViewController animated:YES];
}

- (void)LoginPressed{
    NSLog(@"inside login pressed\n");
    
    if (self.loginEmail.text.length == 1 || self.loginPassword.text.length == 1) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please fill in the login info." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];

    }
    else if (![self validateEmail:self.loginEmail.text]) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Invalid email" message:@"Please enter a valid email id." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
        
    else {
    
        NSLog(@"login info entered: %@ %@", self.loginEmail.text , self.loginPassword.text);
        NSString *newEmail = [self.loginEmail.text uppercaseString];
        responseData = [NSMutableData data];
        //NSString *url = [[[@"http://cbb.ucdenver.edu:3000/loginSignup/" stringByAppendingString:newEmail] stringByAppendingString:@"/"] stringByAppendingString:self.loginPassword.text];
        
        NSString *url = [[[[appDelegate.urlToNodeJs stringByAppendingString:@"/loginSignup/" ] stringByAppendingString:newEmail] stringByAppendingString:@"/"] stringByAppendingString:self.loginPassword.text];
        
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"url is: %@", url);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                             [NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:60.0];
        //[request setHTTPMethod:@"POST"];
        receivedData = [NSMutableData dataWithCapacity: 0];
        NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request     delegate:self];
    
        if (!theConnection) {
        
            receivedData = nil;
            NSLog(@"no connection \n");
            // Inform the user that the connection failed.
        }
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    receivedData = nil;
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}



- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a property elsewhere
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[receivedData length]);
    
    NSLog(@"received data: %@", receivedData);
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@", res);
    if (res == NULL) {
        NSLog(@"well! there you go!");
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Login Failed" message:@"Incorrect id and/or password. Please try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else {
    
        for (id key in res) {
            
            if ([key count] > 3 ) {
                
            
                for (id key1 in key) {
                    if ([key1  isEqual: @"firstname"]) {
                        appDelegate.firstName = [key objectForKey:key1];
                        NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1  isEqual: @"lastname"]) {
                        appDelegate.lastName = [key objectForKey:key1];
                    }
                    if ([key1  isEqual: @"email"]) {
                        appDelegate.userEmail = [key objectForKey:key1];
                    //NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1  isEqual: @"password"]) {
                        appDelegate.userPassword = [key objectForKey:key1];
                    //NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1  isEqual: @"babyName"]) {
                        appDelegate.babyName = [key objectForKey:key1];
                        //NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1  isEqual: @"babyDOB"]) {
                        appDelegate.babyDOB = [key objectForKey:key1];
                        //NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1  isEqual: @"babyGender"]) {
                        appDelegate.babyGender = [key objectForKey:key1];
                        //NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1  isEqual: @"phonenumber"]) {
                        appDelegate.phoneNumber = [key objectForKey:key1];
                        //NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1  isEqual: @"zipcode"]) {
                        appDelegate.zipcode = [key objectForKey:key1];
                        //NSLog(@"first name is: %@", appDelegate.firstName);
                    }
                    if ([key1 isEqual:@"ID"]) {
                        appDelegate.userID = [NSString stringWithFormat:@"%@", [key objectForKey:key1]];
                        NSLog(@"id is: %@", appDelegate.userID);
                    }
                
            }// end for key
            NSLog(@"values are: %@, %@, %@, %@, %@, %@, %@, %@, %@", appDelegate.firstName, appDelegate.lastName, appDelegate.userEmail, appDelegate.userPassword, appDelegate.babyName, appDelegate.babyDOB, appDelegate.babyGender, appDelegate.phoneNumber, appDelegate.zipcode);
            }
            
            appDelegate.goalsMinutesComponent = @"10";
            appDelegate.goalsDaysComponent = @"2";
            
        }// end else
        
        
        
        // saving an NSString
        [prefs setObject:appDelegate.userID forKey:@"userID"];
       [prefs setObject:appDelegate.firstName forKey:@"firstName"];
        [prefs setObject:appDelegate.lastName forKey:@"lastName"];
        [prefs setObject:appDelegate.userEmail forKey:@"email"];
        [prefs setObject:appDelegate.userPassword forKey:@"password"];
        [prefs setObject:appDelegate.babyName forKey:@"babyName"];
        [prefs setObject:appDelegate.babyDOB forKey:@"babyDOB"];
        [prefs setObject:appDelegate.babyGender forKey:@"babyGender"];
        [prefs setObject:appDelegate.phoneNumber forKey:@"phoneNumber"];
        NSLog(@"inside log in: phone number is: %@", appDelegate.phoneNumber);
        [prefs setObject:appDelegate.zipcode forKey:@"zipcode"];
        
        
        [prefs synchronize];

        
        appDelegate.firstName = @"";
        
        UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        UIImage *settingsImage = [UIImage imageNamed:@"19-gear.png"];
        UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:settingsImage style:UIBarButtonItemStylePlain target:self action:@selector(settingsPressed)];
        uiViewController.navigationItem.leftBarButtonItem = settingsButton;
    
        UIImage *accountImage = [UIImage imageNamed:@"76-baby.png"];
        UIBarButtonItem *myAccountButton = [[UIBarButtonItem alloc] initWithImage:accountImage style:UIBarButtonItemStylePlain target:self action:@selector(myAccountPressed)];
        //uiViewController.navigationItem.leftBarButtonItem = settingsButton;
        
        uiViewController.navigationItem.rightBarButtonItem = myAccountButton;
    }
    
    receivedData = nil;
}



-(void)myAccountPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"accountViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    //UIImage *accountImage = [UIImage imageNamed:@"76-baby.png"];
    //UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:nil];
    //[[UIBarButtonItem alloc] initWithImage:accountImage style:UIBarButtonItemStylePlain target:self action:@selector(myAccountPressed)];
    //uiViewController.navigationItem.rightBarButtonItem = saveButton;
    
    //uiViewController.navigationItem.rightBarButtonItem = myAccountButton;
}

-(void)settingsPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingsViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
}

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

@end
