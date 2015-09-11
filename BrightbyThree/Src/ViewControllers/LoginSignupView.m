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
    
}

- (IBAction)selectionMade:(id)sender {
    
    int choice = (int)self.loginSignupSegment.selectedSegmentIndex;
    switch (choice) {
        case 0:
            NSLog(@"existing user\n");
            break;
        case 1:
            NSLog(@"new user\n");
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
@end