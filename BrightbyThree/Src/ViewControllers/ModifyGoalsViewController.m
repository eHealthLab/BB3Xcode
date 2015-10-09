//
//  ModifyGoalsViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModifyGoalsViewController.h"
#import "AppDelegate.h"

@implementation ModifyGoalsViewController
{
    AppDelegate *delegate;
}
-(void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.title = @"MODIFY YOUR GOALS";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savePressed:(id)sender {
    int numOfDays = delegate.weeklyPointsGoals/delegate.dailyPointsGoals;
    NSLog(@"goals are: %d, %d, %d\n", delegate.dailyPointsGoals, delegate.weeklyPointsGoals, numOfDays);
    
    NSString *days = [NSString stringWithFormat:@"%d", numOfDays];
    NSString *minutes = [NSString stringWithFormat:@"%d", delegate.dailyPointsGoals];
    
    NSString *goalsString = [[[[days stringByAppendingString:@"/"] stringByAppendingString: minutes] stringByAppendingString:@"/"] stringByAppendingString:delegate.userID];
    
    //NSString *goalsString = @"3/10/199";
    
    NSLog(@"goals are: %@", goalsString);
    
    NSString *urlString = [[delegate.urlToNodeJs stringByAppendingString:@"/setGoals/"] stringByAppendingString:goalsString];
    NSLog(@"url string: %@", urlString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSData* data = [goalsString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //NSData *receivedData = [NSMutableData dataWithCapacity: 0];
    
    NSURLResponse* response = [[NSURLResponse alloc] init];
    NSError* error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error == nil)
    {
        NSLog(@"submitted request!");
        NSLog(@"response: %@", response);
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Success!" message:@"Your goals have successfully been updated."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
    }
    else if (error != nil) {
        NSLog(@"error is: %@\n", error.description);
    }
    

}

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
