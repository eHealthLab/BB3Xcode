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
#import "MinutesTimer.h"
#import "Dashboard.h"

@implementation LogMinutesController
{
    AppDelegate *delegate;
    int timerValue;
    NSTimeInterval time;
    MinutesTimer *minutesTimer;
    Dashboard *dashboard;
}

-(void)viewDidLoad
{
     delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    dashboard = [[Dashboard alloc] init];
    minutesTimer = [[MinutesTimer alloc] init];
    
     timerValue = 0;
    
    self.title = @"RECORD/LOG MINUTES";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.saveButton.hidden = YES;
    self.startStopTimer.hidden = NO;
    self.startTimer = @"start";
    
    delegate.badgesArray = [[NSMutableArray alloc] initWithObjects:@"150", @"400", @"700", @"1000", @"1500", @"2000", @"2500", @"3000", @"3500", @"4000", @"4500", @"5000", nil];
    
    //delegate.nextBadgeToEarn = 3;
    
    NSLog(@"inside log minutes; next badge to earn: %d", delegate.nextBadgeToEarn);
    
    NSLog(@"value in array: %d, %@", delegate.nextBadgeToEarn, delegate.badgesArray[delegate.nextBadgeToEarn]);
    
}

- (IBAction)timerPressed:(id)sender {
    NSLog(@"timer pressed\n");
    if ([self.startTimer isEqualToString:@"start"]) {
        
        NSLog(@"timer start\n");
        time = [NSDate timeIntervalSinceReferenceDate];
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

-(void)updateMinutes
{
    NSLog(@"value changed to: %d", timerValue);
    timerValue++;
    //NSString *timeString = [[NSString alloc] initWithFormat:@"%d", timerValue];
    
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsedTime = currentTime - time;
    
    int minutes = (int)(elapsedTime/60.0);
    int seconds = (int)(elapsedTime = elapsedTime - (minutes*60));
    
    delegate.logMinutesCounter = [NSString stringWithFormat:@"%u:%02u", minutes, seconds];
    NSLog(@"value: %@", delegate.logMinutesCounter);
    [minutesTimer updateMinutes:delegate.logMinutesCounter];
    [self performSelector:@selector(updateMinutes) withObject:self afterDelay:1];
    
}


- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    int value = [delegate.badgesArray[delegate.nextBadgeToEarn-1] intValue];
    //NSString *points = [NSString stringWithFormat:@"%d", delegate.totalPoints];
    NSLog(@"total points are: %d and value is: %d", delegate.totalPoints, value);
    if (delegate.totalPoints >= value) {
        NSLog(@"total points are: %d and value is: %d", delegate.totalPoints, value);
        delegate.nextBadgeToEarn++;
        
        [self updateDBBadgeInfo];
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Congratualtions!" message:@"You have earned a new badge."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        delegate.newBadgeNotification=1;
        
    }
    
}

- (void)onDoneButton:(id)sender {
    //[dashboard.view ];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)updateDBBadgeInfo
{
    
    NSString *badgeString = [NSString stringWithFormat:@"%d", delegate.nextBadgeToEarn];
    NSString *urlString = [[[[delegate.urlToNodeJs stringByAppendingString:@"/updateBadge/"] stringByAppendingString:badgeString] stringByAppendingString:@"/"] stringByAppendingString:delegate.userID];
    NSLog(@"url string: %@", urlString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSData* data = [badgeString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //NSData *receivedData = [NSMutableData dataWithCapacity: 0];
    
    NSURLResponse* response = [[NSURLResponse alloc] init];
    NSError* error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error != nil)
    {
        NSLog(@"Error: %@\n", error.description);
    }
    else if (error == nil) {
        NSLog(@"Success!");
        NSLog(@"response is: %@\n", response);
    }
    
    
}


@end