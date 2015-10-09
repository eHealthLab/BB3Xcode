//
//  DashboardMessageView.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_DashboardMessageView_h
#define BrightbyThree_DashboardMessageView_h

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"
#import "ACPButton.h"

@interface DashboardMessageView: UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleActivity;
- (IBAction)fullMessageViewButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *messageTextContainer;

@end


#endif
