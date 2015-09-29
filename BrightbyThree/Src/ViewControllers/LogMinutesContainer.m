//
//  LogMinutesContainer.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogMinutesContainer.h"
#import "SWRevealViewController.h"

@implementation LogMinutesContainer

-(void)viewDidLoad
{
    
       
}



- (IBAction)logMinutesPressed:(id)sender {
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"logMinutes"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uiViewController];
    
    
    
    //UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:nil action:@selector(dismiss)];
    //nav.topViewController.navigationItem.rightBarButtonItem = item;
    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    //uiViewController.transitionStyle = UIModalTransitionStyleCoverVertical;
    
    //UIModalPresentationCurrentContext;
    [self presentViewController:nav animated:NO completion:nil];
    
    //[uiViewController dismissViewControllerAnimated:YES];

    
}

-(void)dismiss
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

@end