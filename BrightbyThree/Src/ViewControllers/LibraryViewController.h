//
//  LibraryViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_LibraryViewController_h
#define BrightbyThree_LibraryViewController_h
#import<UIKit/UIKit.h>

@interface LibraryViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
    int selectedIndex;
}
@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;

@end

#endif
