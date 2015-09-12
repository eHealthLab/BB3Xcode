//
//  PrivacyPolicy.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/12/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrivacyPolicy.h"
#import "SWRevealViewController.h"

@implementation PrivacyPolicy

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Privacy Policy";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self.iconButton setImage:[[UIImage imageNamed:@"BB3_AbousUs_icon2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

@end
