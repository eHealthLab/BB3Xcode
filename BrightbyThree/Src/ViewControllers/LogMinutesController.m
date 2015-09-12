//
//  LogMinutesController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogMinutesController.h"
#import "SWRevealViewController.h"

@implementation LogMinutesController

-(void)viewDidLoad
{
    
    self.title = @"LOG MINUTES";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
}

- (IBAction)saveButtonPressed:(id)sender {
    //[self dismissViewControllerAnimated:YES];
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end