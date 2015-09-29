//
//  MinutesValue.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_MinutesValue_h
#define BrightbyThree_MinutesValue_h

#import<UIKit/UIKit.h>

@interface MinutesValue : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *decrement;
@property (weak, nonatomic) IBOutlet UIButton *increment;

- (IBAction)decrementMinutes:(id)sender;
- (IBAction)incrementMinutes:(id)sender;


@property(strong, nonatomic) IBOutlet UILabel *timerLabel;

@end

#endif
