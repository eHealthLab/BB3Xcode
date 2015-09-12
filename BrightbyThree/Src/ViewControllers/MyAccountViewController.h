//
//  MyAccountViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_MyAccountViewController_h
#define BrightbyThree_MyAccountViewController_h

#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import <UIColor+HTColor.h>

@interface MyAccountViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
}
@property (strong, nonatomic) IBOutlet UITableView *accounttableView;
@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *iconButton;



@end



#endif
