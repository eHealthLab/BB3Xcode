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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
- (IBAction)saveButtonPressed:(id)sender;

@end

#endif
