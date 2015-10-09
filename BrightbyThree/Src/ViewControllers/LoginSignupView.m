//
//  LoginSignupView.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/3/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginSignupView.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "SignUpViewPart1.h"
#import "SignUpViewPart2.h"

@implementation LoginSignupView
{
    NSData *responseData;
    NSMutableData *receivedData;
    AppDelegate *delegate;
    SignUpViewPart1 *signUpPart1;
    SignUpViewPart2 *signUpPart2;
   
}

-(void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    //signUpPart1 = [[SignUpViewPart1 alloc]init];
    //signUpPart2 = [[SignUpViewPart2 alloc]init];
    
    
        UIViewController *vc1 = [self viewControllerForSegmentIndex:self.loginSignupSegment.selectedSegmentIndex];
        [self addChildViewController:vc1];
        self.cancelButton.hidden = YES;
        self.nextButton.hidden = YES;
        self.createAccountButton.hidden = YES;
}

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

- (UIViewController *)viewControllerForSegmentIndex:(NSInteger)index {
    UIViewController *vc;
    switch (index) {
        case 0:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
            break;
        case 1:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-1"];
            break;
    }
    return vc;
}

- (IBAction)selectionMade:(id)sender {
    
    int choice = (int)self.loginSignupSegment.selectedSegmentIndex;
    switch (choice) {
        case 0:
        {
            NSLog(@"existing user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
            vc1.view.frame = self.loginView.bounds;
            [self.loginView addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            self.cancelButton.hidden = YES;
            self.nextButton.hidden = YES;
            self.createAccountButton.hidden = YES;
            break;
        }
        case 1:
        {
            NSLog(@"new user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-1"];
            vc1.view.frame = self.loginView.bounds;
            [self.loginView addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            
            self.cancelButton.hidden = NO;
            self.nextButton.hidden = NO;
            self.createAccountButton.hidden = YES;
            break;
        }
        default:
            break;
    }
    
}


- (IBAction)nextButtonPressed:(id)sender {
    
    if ([delegate.firstName isEqualToString:@""] || [delegate.lastName isEqualToString:@""] || [delegate.userEmail isEqualToString:@""] || [delegate.userPassword isEqualToString:@""] || [delegate.confirmPassword isEqualToString:@""]) {
        NSLog(@"other info: %@, %@, %@, %@", delegate.firstName, delegate.lastName, delegate.userPassword, delegate.confirmPassword);
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"All information is required."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else if (![self validateEmail:delegate.userEmail])
    {
        NSLog(@"email entered: %@", delegate.userEmail);
        NSLog(@"other info: %@, %@, %@, %@", delegate.firstName, delegate.lastName, delegate.userPassword, delegate.confirmPassword);
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please enter a valid email."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else if (![delegate.userPassword isEqualToString:delegate.confirmPassword])
    {
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Passwords don't match."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    
    else {
    
        UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-2"];
        vc1.view.frame = self.loginView.bounds;
        [self.loginView addSubview:vc1.view];
        [self addChildViewController:vc1];
        [vc1 didMoveToParentViewController:self];
        self.cancelButton.hidden = NO;
        self.nextButton.hidden = YES;
        self.createAccountButton.hidden = NO;
    }
}
- (IBAction)createAccountButtonPressed:(id)sender {
    
    if ([delegate.zipcode isEqualToString:@""] || [delegate.phoneNumber isEqualToString:@""] || [delegate.babyName isEqualToString:@""] || [delegate.babyDOB isEqualToString:@""] || [delegate.babyGender isEqualToString:@""]) {
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"All information is required."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else {
        
        responseData = [NSMutableData data];
        NSString *newEmail = [delegate.userEmail uppercaseString];
        NSString *bodyData = [[[[[[[[[[[[[[[[delegate.firstName stringByAppendingString:@"/"] stringByAppendingString:delegate.lastName] stringByAppendingString:@"/"] stringByAppendingString:newEmail] stringByAppendingString:@"/"] stringByAppendingString:delegate.userPassword] stringByAppendingString:@"/"] stringByAppendingString:delegate.phoneNumber] stringByAppendingString:@"/"] stringByAppendingString:delegate.babyName] stringByAppendingString:@"/"] stringByAppendingString:delegate.babyDOB] stringByAppendingString:@"/"] stringByAppendingString:delegate.babyGender] stringByAppendingString:@"/"] stringByAppendingString:delegate.zipcode];
        
        NSString *urlString = [[delegate.urlToNodeJs stringByAppendingString:@"/loginSignup/"] stringByAppendingString:bodyData];
        
        NSLog(@"query is: %@", urlString);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                        [NSURL URLWithString:urlString]];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPMethod:@"POST"];
        NSData* data = [bodyData dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
        receivedData = [NSMutableData dataWithCapacity: 0];
        
        NSURLResponse* response = [[NSURLResponse alloc] init];
        NSError* error = nil;
        [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    if (error == nil)
    {
        NSLog(@"submitted request!");
        NSLog(@"response: %@", response);
        NSLog(@"received date: %@ \n", receivedData);
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Success!" message:@"You have successfully signed up."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
        
        //PROCESS RESPONSE; SET DELEGATE VALUES
        NSString *newEmail = [delegate.userEmail uppercaseString];
        NSString *url = [[[[delegate.urlToNodeJs stringByAppendingString:@"/loginSignUp/"] stringByAppendingString:newEmail] stringByAppendingString:@"/"] stringByAppendingString:delegate.userPassword];
        NSLog(@"login url is: %@\n", url);
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"GET"];
        [request setURL:[NSURL URLWithString:url]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *responseCode = nil;
        
        NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
        
        if([responseCode statusCode] != 200){
            NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
            //return nil;
        }
        
        
        NSError *myError = nil;
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingMutableLeaves error:&myError];
        NSLog(@"%@", res);
        
        for (id key in res) {
            
            for (id key1 in key) {
                if ([key1 isEqualToString:@"ID"]) {
                    int id = [[key objectForKey:key1] intValue];
                    delegate.userID = [NSString stringWithFormat:@"%d", id];
                    NSLog(@"User Id is: %@", delegate.userID);
                    break;
                }
            }
        }
        
        NSLog(@"values are: %@, %@, %@, %@, %@, %@, %@, %@, %@, %@", delegate.userID,delegate.firstName, delegate.lastName, delegate.userEmail, delegate.userPassword, delegate.babyName, delegate.babyDOB, delegate.babyGender, delegate.phoneNumber, delegate.zipcode);
        
        delegate.numberOfDaysEnrolled = 0;
        
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:delegate.firstName forKey:@"firstName"];
        [prefs setObject:delegate.lastName forKey:@"lastName"];
        [prefs setObject:delegate.userEmail forKey:@"email"];
        [prefs setObject:delegate.userPassword forKey:@"password"];
        [prefs setObject:delegate.babyName forKey:@"babyName"];
        [prefs setObject:delegate.babyDOB forKey:@"babyDOB"];
        [prefs setObject:delegate.babyGender forKey:@"babyGender"];
        [prefs setObject:delegate.phoneNumber forKey:@"phoneNumber"];
        NSLog(@"inside log in: phone number is: %@", delegate.phoneNumber);
        [prefs setObject:delegate.zipcode forKey:@"zipcode"];
        
        [prefs synchronize];
        
        if ([self initializeTables]) {
            SWRevealViewController  *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"revealView"];
            
            //appDelegate.firstName = @"MARY";
            uiViewController.title = [@"Welcome Back, " stringByAppendingString:delegate.firstName];
            
            SWRevealViewController *uiRearViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"slideMenu"];
            
            SWRevealViewController *uiFrontViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"frontMenu"];
            
            [uiViewController setFrontViewController:uiFrontViewController];
            [uiViewController setRearViewController:uiRearViewController];
            [uiViewController setFrontViewPosition: FrontViewPositionLeft animated: NO];
            
            [self.navigationController pushViewController:uiViewController  animated:YES];
            self.navigationItem.leftBarButtonItem = nil;
            
            UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"BB3_AbousUs_icon2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:nil];
            
            uiViewController.navigationItem.leftBarButtonItem = settingsButton;
            
            UIImage *menuImage = [UIImage imageNamed:@"menu.png"];
            UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:menuImage style:UIBarButtonItemStylePlain target:uiViewController action:@selector(revealToggle:)];
            
            [menuButton setImage:[[UIImage imageNamed:@"menu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            
            [uiViewController.frontViewController.view addGestureRecognizer:uiViewController.panGestureRecognizer];
            uiViewController.navigationItem.rightBarButtonItem = menuButton;
        }
        
        else {
            NSLog(@"could not initialize\n");
        }
    }// end error nil
    else if (error != nil) {
        NSString* errorLogFormat = @"request failed, error: %@";
        NSLog(errorLogFormat, error.description);
    }
  }
}

-(bool) initializeTables
{
    NSLog(@"user id: %@\n", delegate.userID);
    NSString *urlString = [[delegate.urlToNodeJs stringByAppendingString:@"/initialize/"] stringByAppendingString:delegate.userID];
    
    NSLog(@"query is: %@", urlString);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSData* data = [delegate.userID dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    receivedData = [NSMutableData dataWithCapacity: 0];
    
    NSURLResponse* response = [[NSURLResponse alloc] init];
    NSError* error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    if (error == nil) {
        NSLog(@"success! and response is: %@\n", response);
        return TRUE;
    }
    else {
        NSLog(@"error is: %@\n", error.description);
        return FALSE;
    }
}


- (IBAction)cancelButtonPressed:(id)sender {
    
    UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    vc1.view.frame = self.loginView.bounds;
    [self.loginView addSubview:vc1.view];
    [self addChildViewController:vc1];
    [vc1 didMoveToParentViewController:self];
    self.cancelButton.hidden = YES;
    self.nextButton.hidden = YES;
    self.createAccountButton.hidden = YES;
    
    delegate.firstName = @"";
    delegate.lastName = @"";
    delegate.userEmail = @"";
    delegate.userPassword = @"";
    delegate.confirmPassword = @"";
}

@end