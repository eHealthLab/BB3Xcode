//
//  ModifyGoalsViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModifyGoalsViewController.h"

@implementation ModifyGoalsViewController

-(void)viewDidLoad
{
    self.title = @"MODIFY YOUR GOALS";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savePressed:(id)sender {
}

- (IBAction)cancelPressed:(id)sender {
}
@end
