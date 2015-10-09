//
//  CurrentMessageView.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/8/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentMessageView.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"


@implementation CurrentMessageView
{
    AppDelegate *delegate;
    
}

-(void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.fullMessageText.text = delegate.currentMessageContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.fullMessageText.text = delegate.currentMessageContent;
}


@end
