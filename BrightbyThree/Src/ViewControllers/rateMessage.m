//
//  rateMessage.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/25/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rateMessage.h"
#import "StarRatingView.h"
#import "AppDelegate.h"

#define kLabelAllowance 50.0f
#define kStarViewHeight 30.0f
#define kStarViewWidth 160.0f
#define kLeftPadding 5.0f



@implementation rateMessage
{
    AppDelegate *appDelegate;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    StarRatingView* starviewAnimated = [[StarRatingView alloc]initWithFrame:CGRectMake(50, 100, kStarViewWidth+kLabelAllowance+kLeftPadding, kStarViewHeight) andRating:0 withLabel:YES animated:YES];
    [starviewAnimated setTag:1];

    [self.view addSubview:starviewAnimated];
    
    
    
    self.saveButton.cornerRadius = 10.0;
    self.saveButton.shadowHeight = self.saveButton.frame.size.height * 0.17;
    [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    self.saveButton.buttonColor = [UIColor ht_grapeFruitColor];
    self.saveButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    
    [self.saveButton addTarget:self action:@selector(saveRatingPressed) forControlEvents:UIControlEventTouchUpInside];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveRatingPressed
{
    self.saveButton.userInteractionEnabled = NO;
    self.saveButton.alpha=0.5;
    
    //NSLog(@"current index: %d", appDelegate.currentMessageIndex);
    
    appDelegate.messagesRatingLibrary[appDelegate.currentMessageIndex] = @"3";
    
    //NSLog(@"saved into delegate: %@\n", appDelegate.messagesRatingLibrary[appDelegate.currentMessageIndex]);
    
    
    
   //
    // SAVE THIS TO APPDELEGATE
}


@end
