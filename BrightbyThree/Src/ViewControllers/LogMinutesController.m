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
    
    self.title = @"RECORD/LOG MINUTES";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    self.saveButton.hidden = YES;
    self.startStopTimer.hidden = NO;
    
}

- (IBAction)saveButtonPressed:(id)sender {
    
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)timerPressed:(id)sender {
}

- (IBAction)cancelButtonPressed:(id)sender {
}
- (IBAction)container1SelectionMade:(id)sender {
    
    int choice = (int)self.minutesSegmentControl.selectedSegmentIndex;
    switch (choice) {
        case 0:
        {
            NSLog(@"timer\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"minutesTimer"];
            vc1.view.frame = self.container1.bounds;
            [self.container1 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            self.saveButton.hidden = YES;
            self.startStopTimer.hidden = NO;
            break;
        }
        case 1:
        {
            NSLog(@"log minutes\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"minutesValue"];
            vc1.view.frame = self.container1.bounds;
            [self.container1 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            self.startStopTimer.hidden = YES;
            self.saveButton.hidden = NO;
            break;
        }
            
        default:
            break;
    }
    
    
}
@end