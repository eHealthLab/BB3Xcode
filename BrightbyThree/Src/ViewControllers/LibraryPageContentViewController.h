//
//  LibraryPageContentViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/8/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_LibraryPageContentViewController_h
#define BrightbyThree_LibraryPageContentViewController_h

#import <UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"


@interface LibraryPageContentViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
    int selectedIndex;
}

@property NSUInteger pageIndex;
@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;

@end



#endif
