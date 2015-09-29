//
//  LogMinutesContainer.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_logMinutesContainer_h
#define BrightbyThree_logMinutesContainer_h

#import<UIKit/UIKit.h>

@interface LogMinutesContainer: UIViewController

@property (weak, nonatomic) IBOutlet UIButton *logMinutes;
- (IBAction)logMinutesPressed:(id)sender;

@property (strong) NSTimer * messageTimer;

@end


#endif
