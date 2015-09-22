//
//  dashboard.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/7/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//
//  Created by Aarti Munjal on 5/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
// This program is free software; you can
// redistribute it and/or modify it under the terms
// of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of
// the License, or (at your option) any later
//version.

// This program is distributed in the hope that it
// will be useful, but WITHOUT ANY WARRANTY; without
// even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.

// You should have received a copy of the GNU General
// Public License along with this program; if not,
// write to the Free Software Foundation, Inc., 51
// Franklin Street, Fifth Floor, Boston, MA
// 02110-1301, USA.


#import <Foundation/Foundation.h>
#import "dashboard.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"


@implementation Dashboard
{
    AppDelegate *appDelegate;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    NSLog(@"the view loads\n");
    
    [self.menuButton setImage:[[UIImage imageNamed:@"menu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //appDelegate.firstName = @"MARY";
    self.title = [@"WELCOME BACK, " stringByAppendingString:appDelegate.firstName];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (IBAction)selectionContainer1Made:(id)sender {
    int choice = (int)self.minutesBadgesSegment.selectedSegmentIndex;
    switch (choice) {
        case 0:
        {
            NSLog(@"existing user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"minutes"];
            vc1.view.frame = self.container1.bounds;
            [self.container1 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            break;
        }
        case 1:
        {
            NSLog(@"new user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"badges"];
            vc1.view.frame = self.container1.bounds;
            [self.container1 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            break;
        }
        default:
            break;
    }

}

- (IBAction)selectionContainer2Made:(id)sender {
 
    int choice = (int)self.goalsSegment.selectedSegmentIndex;
    switch (choice) {
        case 0:
        {
            NSLog(@"existing user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"progress"];
            vc1.view.frame = self.container2.bounds;
            [self.container2 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            break;
        }
        case 1:
        {
            NSLog(@"new user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"dailyGoals"];
            vc1.view.frame = self.container2.bounds;
            [self.container2 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            break;
        }
        default:
            break;
    }
    
}
@end