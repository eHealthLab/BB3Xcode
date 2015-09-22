//
//  ProgressViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProgressViewController.h"

@implementation ProgressViewController

-(void)viewDidLoad{
    
    
}

- (IBAction)modifyGoalsButtonPressed:(id)sender {
    
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"goalsView"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uiViewController];
    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:nav animated:NO completion:nil];
}
- (IBAction)rewardsButtonPressed:(id)sender {
    
    
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rewardsView"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uiViewController];
    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:nav animated:NO completion:nil];
}
@end