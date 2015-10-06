//
//  LoginSignupView.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/3/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginSignupView.h"
#import "SWRevealViewController.h"

@implementation LoginSignupView

-(void)viewDidLoad
{
     //UIViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    //UIViewController *view2 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-1"];
    //UIViewController *view3 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-2"];
    
    //NSArray *viewControllers = [NSArray arrayWithObjects: view1, view2, view3,nil];
    //UIViewController *currentController= view1;
    
    UIViewController *vc1 = [self viewControllerForSegmentIndex:self.loginSignupSegment.selectedSegmentIndex];
    [self addChildViewController:vc1];
    self.cancelButton.hidden = YES;
    self.nextButton.hidden = YES;
    self.createAccountButton.hidden = YES;
    //vc1.view.frame = self.contentView.bounds;
    //[self.contentView addSubview:vc1.view];
    
    
    
}

- (UIViewController *)viewControllerForSegmentIndex:(NSInteger)index {
    UIViewController *vc;
    switch (index) {
        case 0:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
            break;
        case 1:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-1"];
            break;
    }
    return vc;
}

- (IBAction)selectionMade:(id)sender {
    
    int choice = (int)self.loginSignupSegment.selectedSegmentIndex;
    switch (choice) {
        case 0:
        {
            NSLog(@"existing user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
            vc1.view.frame = self.loginView.bounds;
            [self.loginView addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            self.cancelButton.hidden = YES;
            self.nextButton.hidden = YES;
            self.createAccountButton.hidden = YES;
            break;
        }
        case 1:
        {
            NSLog(@"new user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-1"];
            vc1.view.frame = self.loginView.bounds;
            [self.loginView addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            self.cancelButton.hidden = NO;
            self.nextButton.hidden = NO;
            self.createAccountButton.hidden = YES;
            break;
        }
        default:
            break;
    }
    
}



- (IBAction)loginButtonPressed:(id)sender {
    NSLog(@"inside login pressed\n");
    
    SWRevealViewController  *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"revealView"];
    
    //SWRevealViewController *revealViewController = self.revealViewController;
    [self.revealViewController setFrontViewController:uiViewController];
    [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];

    [self.navigationController pushViewController:uiViewController  animated:YES];
    self.navigationItem.leftBarButtonItem = nil;
}
- (IBAction)nextButtonPressed:(id)sender {
    //NSLog(@"new user\n");
    UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"createAccount-2"];
    vc1.view.frame = self.loginView.bounds;
    [self.loginView addSubview:vc1.view];
    [self addChildViewController:vc1];
    [vc1 didMoveToParentViewController:self];
    self.cancelButton.hidden = NO;
    self.nextButton.hidden = YES;
    self.createAccountButton.hidden = NO;
}
- (IBAction)createAccountButtonPressed:(id)sender {
}
@end