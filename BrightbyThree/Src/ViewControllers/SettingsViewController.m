//
//  SettingsViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/13/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingsViewController.h"
#import "AppDelegate.h"


@implementation SettingsViewController
{
    AppDelegate *appDelegate;
    NSMutableData *responseData;
    NSMutableData *receivedData;
}

-(void)viewDidLoad
{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    appDelegate.numberOfClicksSettings++;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Toddler on grass.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.3];
    
    self.sendFeedback.cornerRadius = 10.0;
    self.sendFeedback.shadowHeight = self.sendFeedback.frame.size.height * 0.17;
    [self.sendFeedback setTitle:@"Submit" forState:UIControlStateNormal];
    self.sendFeedback.buttonColor = [UIColor ht_greenSeaColor];
    self.sendFeedback.shadowColor = [UIColor ht_mintDarkColor];
    [self.sendFeedback addTarget:self action:@selector(sendFeedbackButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.logout.cornerRadius = 10.0;
    self.logout.shadowHeight = self.logout.frame.size.height * 0.17;
    [self.logout setTitle:@"Logout" forState:UIControlStateNormal];
    self.logout.buttonColor = [UIColor ht_bitterSweetColor];
    self.logout.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [self.logout addTarget:self action:@selector(logoutButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

-(void)sendFeedbackButtonPressed
{
    if (self.feedbackText.text.length == 1) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please enter a comment to submit." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else {
        responseData = [NSMutableData data];
        NSString *url = [[appDelegate.urlToNodeJs stringByAppendingString:@"/feedback/2/"] stringByAppendingString:self.feedbackText.text];
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"url is: %@", url);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                 [NSURL URLWithString:url]];
        request.HTTPMethod = @"POST";
        
        [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        
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
    self.feedbackText.text = @" ";
    /*if (res == NULL) {
        NSLog(@"well! there you go!");
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Could not connect to the server. Please try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];*/
    //}
    //else {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Thank You!" message:@"Your feedback has been successfully submitted." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    //}
}

-(void)logoutButtonPressed
{
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Logout?" message:@"Are you sure you want to logout?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes",nil];
    [messageAlert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if (buttonIndex == 0)
    {
        //NSLog(@"user pressed the Cancel Button");
        [self viewWillAppear:YES];
    }
    
    
    else if (buttonIndex == 1)
    {
        NSLog(@"Logout Pressed\n");
        NSLog(@"useremail is %@:\n", appDelegate.userEmail);
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        // saving an NSString
        [prefs setObject:appDelegate.userEmail forKey:@"userName"];
        [prefs setObject:appDelegate.userPassword forKey:@"password"];
        
        
        
        [prefs synchronize];
        
        NSLog(@"useremail is %@:\n", [prefs objectForKey:@"userName"]);
        appDelegate.firstName = @"";
        appDelegate.lastName = @"";
        appDelegate.userID = @"";
        //appDelegate.userEmail = @"";
        //appDelegate.userPassword = @"";
        appDelegate.babyDOB = @"";
        appDelegate.babyGender = @"";
        appDelegate.babyName = @"";
        appDelegate.phoneNumber = @"";
        appDelegate.zipcode = @"";
        
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        
        
        [self.navigationController pushViewController:uiViewController animated:NO];
        self.navigationItem.hidesBackButton=YES;
    }
}



@end