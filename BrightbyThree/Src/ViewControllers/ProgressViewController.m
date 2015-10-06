//
//  ProgressViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProgressViewController.h"
#import "AppDelegate.h"

@implementation ProgressViewController
{
    AppDelegate *delegate;
}

-(void)viewDidLoad{
    delegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.totalMinutesLabel.text = [NSString stringWithFormat:@"%d", delegate.totalPoints];
    self.lastWeekPoints.text = [NSString stringWithFormat:@"%d", delegate.weeklyPoints];
    self.monthlyPoints.text = [NSString stringWithFormat:@"%d", delegate.monthlyPoints];
    
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