//
//  RewardsViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RewardsViewController.h"

@implementation RewardsViewController

-(void)viewDidLoad
{
    self.title = @"REWARDS";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end