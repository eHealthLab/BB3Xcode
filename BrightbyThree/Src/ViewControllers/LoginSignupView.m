//
//  LoginSignupView.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/3/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginSignupView.h"

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
@end