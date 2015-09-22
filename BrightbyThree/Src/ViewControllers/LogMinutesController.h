//
//  LogMinutesController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_Header_h
#define BrightbyThree_Header_h


#import<UIKit/UIKit.h>

@interface LogMinutesController: UIViewController
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
- (IBAction)saveButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *minutesSegmentControl;
- (IBAction)container1SelectionMade:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *container1;
@property (weak, nonatomic) IBOutlet UIButton *startStopTimer;
- (IBAction)timerPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
- (IBAction)cancelButtonPressed:(id)sender;


@end

#endif
