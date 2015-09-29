//
//  LogMinutesController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogMinutesController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"

@implementation LogMinutesController
{
    AppDelegate *delegate;
}

-(void)viewDidLoad
{
     delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.title = @"RECORD/LOG MINUTES";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.saveButton.hidden = YES;
    self.startStopTimer.hidden = NO;
    self.startTimer = @"start";
    
}

- (IBAction)saveButtonPressed:(id)sender {
    
    delegate.totalPoints += delegate.newPoints;
    NSString *pointsstring = [NSString stringWithFormat:@"%d", delegate.newPoints];
    NSString *urlString = [[[[delegate.urlToNodeJs stringByAppendingString:@"/logMinutes/"] stringByAppendingString:pointsstring] stringByAppendingString:@"/"] stringByAppendingString:delegate.userID];
    NSLog(@"url string: %@", urlString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSData* data = [pointsstring dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    NSURLResponse* response = [[NSURLResponse alloc] init];
    NSError* error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error == nil)
    {
        NSLog(@"submitted request!");
        NSLog(@"response: %@", response);
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Success!" message:@"Your points have successfully been updated."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
    }
    else if (error != nil)
    {
        NSLog(@"error is: %@\n",error.description);
    }
    

    
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)timerPressed:(id)sender {
    NSLog(@"timer pressed\n");
    if ([self.startTimer isEqualToString:@"start"]) {
        
        NSLog(@"timer start\n");
        self.startTimer = @"stop";
        self.messageTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                         target:self
                                                       selector:@selector(updateMinutes)
                                                       userInfo:nil
                                                        repeats:YES];
    }
    else {
        NSLog(@"timer stop\n");
        [self.messageTimer invalidate];
        self.messageTimer = nil;
    }
}

- (IBAction)cancelButtonPressed:(id)sender {
}
- (IBAction)container1SelectionMade:(id)sender {
    
    int choice = (int)self.minutesSegmentControl.selectedSegmentIndex;
    switch (choice) {
        case 0:
        {
            NSLog(@"timer\n");
            
            
            
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"minutesTimer"];
            vc1.view.frame = self.container1.bounds;
            [self.container1 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            self.saveButton.hidden = YES;
            self.startStopTimer.hidden = NO;
            break;
        }
        case 1:
        {
            NSLog(@"log minutes\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"minutesValue"];
            vc1.view.frame = self.container1.bounds;
            [self.container1 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            self.startStopTimer.hidden = YES;
            self.saveButton.hidden = NO;
            break;
        }
            
        default:
            break;
    }
    
    
}

-(void)updateMinutes
{
    
}

@end