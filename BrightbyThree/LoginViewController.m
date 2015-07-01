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
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.loginEmail.text = @" ";
    self.loginPassword.text = @" ";
    
    UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(80, 300, 10, 10)];
    [mySwitch addTarget:self action:@selector(rememberMePressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    CGRect frame = CGRectMake(110.0, 360.0, 220.0, 40.0);
    HTPressableButton *loginButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    loginButton.buttonColor = [UIColor ht_blueJeansColor];
    loginButton.shadowColor = [UIColor ht_blueJeansDarkColor];
    [loginButton addTarget:self action:@selector(LoginPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    [self.view addSubview:mySwitch];
    
    
    frame = CGRectMake(190.0, 470.0, 80.0, 40.0);
    HTPressableButton *signupButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    [signupButton setTitle:@"Signup" forState:UIControlStateNormal];
    [signupButton addTarget:self action:@selector(LoginPressed) forControlEvents:UIControlEventTouchUpInside];
    signupButton.buttonColor = [UIColor ht_emeraldColor];
    signupButton.shadowColor = [UIColor ht_nephritisColor];
    
    [self.view addSubview:signupButton];
    
    [signupButton addTarget:self action:@selector(ShowSignUpForm) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 400, 180, 30)];
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


-(void)rememberMePressed
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // saving an NSString
    [prefs setObject:_loginEmail.text forKey:@"userName"];
    [prefs setObject:_loginPassword.text forKey:@"password"];
    
    [prefs synchronize];
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

    if (self.loginEmail.text.length == 1 || self.loginPassword.text.length == 1) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please fill in the login info." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];

    }
    else {
    
        NSLog(@"login info entered: %@ %@", self.loginEmail.text , self.loginPassword.text);
        NSString *newEmail = [self.loginEmail.text uppercaseString];
        responseData = [NSMutableData data];
        NSString *url = [[[@"http://localhost:3000/loginSignup/" stringByAppendingString:newEmail] stringByAppendingString:@"/"] stringByAppendingString:self.loginPassword.text];
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"url is: %@", url);
        NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:60.0];
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
            for (id key1 in key) {
                if ([key1  isEqual: @"firstname"]) {
                    appDelegate.firstName = [key objectForKey:key1];
                    NSLog(@"first name is: %@", appDelegate.firstName);
                }
                if ([key1  isEqual: @"lastname"]) {
                    appDelegate.lastName = [key objectForKey:key1];
                    //NSLog(@"first name is: %@", appDelegate.firstName);
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
                if ([key1  isEqual: @"phoneNumber"]) {
                    appDelegate.phoneNumber = [key objectForKey:key1];
                    //NSLog(@"first name is: %@", appDelegate.firstName);
                }
                if ([key1  isEqual: @"zipcode"]) {
                    appDelegate.zipcode = [key objectForKey:key1];
                    //NSLog(@"first name is: %@", appDelegate.firstName);
                }
                
            }
            NSLog(@"values are: %@, %@, %@, %@, %@, %@, %@, %@, %@", appDelegate.firstName, appDelegate.lastName, appDelegate.userEmail, appDelegate.userPassword, appDelegate.babyName, appDelegate.babyDOB, appDelegate.babyGender, appDelegate.phoneNumber, appDelegate.zipcode);
            }
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        // saving an NSString
        [prefs setObject:appDelegate.firstName forKey:@"firstName"];
        [prefs setObject:appDelegate.lastName forKey:@"lastName"];
        [prefs setObject:appDelegate.userEmail forKey:@"email"];
        [prefs setObject:appDelegate.userPassword forKey:@"password"];
        [prefs setObject:appDelegate.babyName forKey:@"babyName"];
        [prefs setObject:appDelegate.babyDOB forKey:@"babyDOB"];
        [prefs setObject:appDelegate.babyGender forKey:@"babyGender"];
        [prefs setObject:appDelegate.phoneNumber forKey:@"phoneNumber"];
        [prefs setObject:appDelegate.zipcode forKey:@"zipcode"];
        
        
        [prefs synchronize];

        
        appDelegate.firstName = @"";
        
        UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        
    }
    
    
    
    
    // Release the connection and the data object
    // by setting the properties (declared elsewhere)
    // to nil.  Note that a real-world app usually
    // requires the delegate to manage more than one
    // connection at a time, so these lines would
    // typically be replaced by code to iterate through
    // whatever data structures you are using.
    //theConnection = nil;
    receivedData = nil;
}

    //NSLog(@"id and password: %@ %@", self.delegate.userEmail , self.delegate.userPassword);
    
    /*
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
    }*/
    
    /*NSString *urlString = [[[@"http://localhost:3000/loginSignup/" stringByAppendingString:self.delegate.userEmail] stringByAppendingString:@"/"] stringByAppendingString:self.loginPassword.text];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];*/
    
    /*AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, [responseCode statusCode]);
        
    }*/
    
    /*else {
        NSString *response = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
        NSLog(@"response is: %@", response);
      */
        /*UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        
                
        NSLog(@"done sending");*/

      
@end
