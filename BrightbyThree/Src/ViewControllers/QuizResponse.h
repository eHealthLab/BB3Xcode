//
//  QuizResponse.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_QuizResponse_h
#define BrightbyThree_QuizResponse_h
#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface QuizResponse : UIViewController

@property (weak, nonatomic) IBOutlet HTPressableButton *replyButton;

@property (weak, nonatomic) IBOutlet UITextField *responseView;

@end

#endif
