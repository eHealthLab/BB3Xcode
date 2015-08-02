//
//  QuizResponse.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuizResponse.h"
#import "AppDelegate.h"

@implementation QuizResponse
{
    AppDelegate *appDelegate;
}
-(void)viewDidLoad
{
    
    [super viewDidLoad];
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    self.replyButton.cornerRadius = 10.0;
    self.replyButton.shadowHeight = self.replyButton.frame.size.height * 0.17;
    
    [self.replyButton setTitle:@"Reply" forState:UIControlStateNormal];
    self.replyButton.buttonColor = [UIColor ht_greenSeaColor];
    self.replyButton.shadowColor = [UIColor ht_mintDarkColor];
    [self.replyButton addTarget:self action:@selector(replyButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    int length = (int)[appDelegate.messageResponseLibrary[appDelegate.currentMessageIndex] length];
    if (length > 1) {
        self.replyButton.userInteractionEnabled = NO;
        self.replyButton.alpha = 0.5;
    }
}

-(void)replyButtonPressed
{
    self.replyButton.userInteractionEnabled = NO;
    
    self.replyButton.buttonColor = [UIColor ht_bitterSweetColor];
    self.replyButton.shadowColor = [UIColor ht_bitterSweetDarkColor];
    self.replyButton.alpha = 0.5;
    
    appDelegate.messageResponseLibrary[appDelegate.currentMessageIndex] = self.responseView.text;
        self.responseView.text = @"";
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Success!" message:@"Thank You! Your response has been submitted."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [messageAlert show];
}


@end