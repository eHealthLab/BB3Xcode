//
//  DashboardMessageView.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "DashboardMessageView.h"

@implementation DashboardMessageView
{
    AppDelegate *appDelegate;
    
}

-(void) viewDidLoad
{

    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.titleActivity.text = appDelegate.currentMessageTitle;
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.titleActivity.text = appDelegate.currentMessageTitle;
    
}

- (IBAction)fullMessageViewButtonPressed:(id)sender {
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"fullMessageView"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uiViewController];

    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:nav animated:NO completion:nil];
    
}

-(void)dismiss
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];

}

@end