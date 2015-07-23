//
//  logMinutes.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "logMinutes.h"
#import "AppDelegate.h"
#import "badgeViewController.h"


@implementation LogMinutes
{
    AppDelegate *delegate;
    //badgeViewController *badgesControl = [[badgeViewController alloc] init];
}


- (void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [super viewDidLoad];
    
    
    
    [self.logMinutesImage setImage:[UIImage imageNamed:@"Mom reading with baby - anglo.jpg"]];

    
    _minutesArray = [[NSArray alloc] initWithObjects:@"5", @"10", @"15", @"20", @"25", @"30", @"35", @"40", @"45", @"50", @"55", @"60", nil];
    
    _logInMinutesPickerView.delegate = self;
    _logInMinutesPickerView.dataSource = self;
    
    //UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 320, 350, 100)];
    /*self.label.numberOfLines = 3;
    self.label.text = [[@"You currently have " stringByAppendingString:[NSString stringWithFormat:@"%d", (int)delegate.totalPoints]] stringByAppendingString:@" total points. Log in more minutes."];
    
    self.label.textAlignment=NSTextAlignmentJustified;
    [self.label sizeToFit];*/

    /*CGRect frame = self.label.frame;
    frame.size.height = self.label.
    self.label.frame = frame;*/
    
    self.totalPointsView.text = [[@"You currently have " stringByAppendingString:[NSString stringWithFormat:@"%d", (int)delegate.totalPoints]] stringByAppendingString:@" total points. \n Log in more minutes."];
    self.totalPointsView.textAlignment=NSTextAlignmentJustified;
    [self.totalPointsView sizeToFit];
    [self.totalPointsView setScrollEnabled:YES];
    //[uiViewController.view addSubview:textViewDetail1];
    [self.view addSubview:self.totalPointsView];
    CGRect frame = self.totalPointsView.frame;
    frame.size.height = self.totalPointsView.contentSize.height;
    frame.size.width = self.totalPointsView.contentSize.width;
    self.totalPointsView.frame = frame;
    

    [self.saveButton setStyle:HTPressableButtonStyleRounded];
    self.saveButton.buttonColor = [UIColor ht_bitterSweetColor];
    self.saveButton.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [self.saveButton setShadowHeight:0.8];
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(saveMinutesPressed) forControlEvents:UIControlEventTouchUpInside];
    self.saveButton.tag = 1;
    
    [_logInMinutesPickerView reloadAllComponents];
}

-(void)saveMinutesPressed
{
    HTPressableButton *button = (HTPressableButton*)[self.view viewWithTag:1];
    button.userInteractionEnabled = NO;
    button.alpha = 0.5;
    NSLog(@"total minutes before: %d", (int)delegate.totalPoints);
    int newPoints = (int)[[_minutesArray objectAtIndex:[_logInMinutesPickerView selectedRowInComponent:0]] intValue];
    delegate.totalPoints = delegate.totalPoints + newPoints;
    NSLog(@"total minutes after: %d", (int)delegate.totalPoints);
    
    self.totalPointsView.text = [[@"You currently have " stringByAppendingString:[NSString stringWithFormat:@"%d", (int)delegate.totalPoints]] stringByAppendingString:@" total points. \n Log in more minutes."];
    self.totalPointsView.textAlignment=NSTextAlignmentJustified;
    [self.totalPointsView sizeToFit];
    [self.totalPointsView setScrollEnabled:YES];
    //[uiViewController.view addSubview:textViewDetail1];
    [self.view addSubview:self.totalPointsView];
    CGRect frame = self.totalPointsView.frame;
    frame.size.height = self.totalPointsView.contentSize.height;
    frame.size.width = self.totalPointsView.contentSize.width;
    self.totalPointsView.frame = frame;
    
    delegate.badgesArray = [[NSMutableArray alloc] initWithObjects:@"150", @"400", @"700", @"1000", @"1500", @"2000", @"2500", @"3000", @"3500", @"4000", @"4500", @"5000", nil];
    
    //delegate.nextBadgeToEarn = 3;
    
    NSLog(@"inside log minutes; next badge to earn: %d", delegate.nextBadgeToEarn);
    
    /*for (int i=0; i < 11; i++) {
        NSLog(@"element is: %@", [delegate.badgesArray objectAtIndex:i]);
    }*/
    
    
    NSLog(@"value in array: %d, %@", delegate.nextBadgeToEarn, delegate.badgesArray[delegate.nextBadgeToEarn]);
    int value = [delegate.badgesArray[delegate.nextBadgeToEarn] intValue];
    
    if (delegate.totalPoints >= value) {
        NSLog(@"total points are: %d and value is: %d", delegate.totalPoints, value);
        delegate.nextBadgeToEarn++;
        
        [self updateDBBadgeInfo];
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Congratualtions!" message:@"You have earned a new badge."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
    }
    
    
    NSString *pointsstring = [NSString stringWithFormat:@"%d", newPoints];
    NSString *urlString = [[[@"http://cbb.ucdenver.edu:3000/logMinutes/" stringByAppendingString:pointsstring] stringByAppendingString:@"/"] stringByAppendingString:delegate.userID];
    NSLog(@"url string: %@", urlString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSData* data = [pointsstring dataUsingEncoding:NSUTF8StringEncoding];
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
                                     initWithTitle:@"Success!" message:@"Your points have successfully been updated."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
    }
    else if (error != nil)
    {
        NSLog(@"error is: %@\n",error.description);
    }

    
}

-(void)updateDBBadgeInfo
{
    
    NSString *badgeString = [NSString stringWithFormat:@"%d", delegate.nextBadgeToEarn];
    NSString *urlString = [[[@"http://localhost:3000/updateBadge/" stringByAppendingString:badgeString] stringByAppendingString:@"/"] stringByAppendingString:delegate.userID];
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

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _minutesArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_minutesArray objectAtIndex:row];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end