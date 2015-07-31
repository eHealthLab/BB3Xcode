//
//  TutorialViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/2/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_TutorialViewController_h
#define BrightbyThree_TutorialViewController_h
#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface TutorialViewController : UITableViewController<UIPopoverControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
}

@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;
@property (strong, nonatomic) IBOutlet UITableView *tutorialTableView;

@end

#endif
