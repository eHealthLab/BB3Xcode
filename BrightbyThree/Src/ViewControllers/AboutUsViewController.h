//
//  AboutUsViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/25/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_AboutUsViewController_h
#define BrightbyThree_AboutUsViewController_h
#import "UIKit/UIKit.h"
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"


@interface AboutUsViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
}

@property (strong, nonatomic) IBOutlet UITableView *aboutUsTable;


@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;

@end

#endif
