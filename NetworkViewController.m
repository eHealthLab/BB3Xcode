//
//  NetworkViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/26/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkViewController.h"
#import "AppDelegate.h"
#import "UIColor+HTColor.h"

@implementation NetworkViewController
{
    AppDelegate *delegate;
}

-(void)viewDidLoad
{
    
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [super viewDidLoad];
    /*
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(30,425,100,50)];
    label1.text = @"Total Points";
    [self.view addSubview:label1];
    UIProgressView *totalProgressView = [[UIProgressView alloc] init];
    totalProgressView.frame = CGRectMake(150,450,200,50);
    [self.view addSubview:totalProgressView];
    [totalProgressView setProgress:0.35];
    [totalProgressView setTransform:CGAffineTransformMakeScale(1.0, 4.0)];
    totalProgressView.progressTintColor = [UIColor ht_grapeFruitDarkColor];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(30,495,100,50)];
    label2.text = @"Points/Week";
    [self.view addSubview:label2];
    UIProgressView *progressPerWeekView = [[UIProgressView alloc] init];
    progressPerWeekView.frame = CGRectMake(150,520,200,50);
    [self.view addSubview:progressPerWeekView];
    [progressPerWeekView setProgress:0.20];
    [progressPerWeekView setTransform:CGAffineTransformMakeScale(1.0, 4.0)];
    progressPerWeekView.progressTintColor = [UIColor ht_grapeFruitDarkColor];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(30,565,120,50)];
    label3.text = @"Points/Month";
    [self.view addSubview:label3];
    UIProgressView *progressPerMonthView = [[UIProgressView alloc] init];
    progressPerMonthView.frame = CGRectMake(150,590,200,50);
    [self.view addSubview:progressPerMonthView];
    [progressPerMonthView setProgress:0.70];
    [progressPerMonthView setTransform:CGAffineTransformMakeScale(1.0, 4.0)];
    progressPerMonthView.progressTintColor = [UIColor ht_grapeFruitDarkColor];
    
    self.totalPointsSoFar.progress=.15;
    self.pointsPerWeek.progress = .25;
    self.pointsPerMonth.progress = .35;
     */
    
}

@end