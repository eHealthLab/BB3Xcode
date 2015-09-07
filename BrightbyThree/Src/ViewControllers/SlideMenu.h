//
//  SlideMenu.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/7/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_SlideMenu_h
#define BrightbyThree_SlideMenu_h

#import<UIKit/UIKit.h>

@interface SlideMenu : UITableViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
    NSMutableArray *dataArray;
}
@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;
@property(strong, nonatomic) NSMutableArray *dataArray;

@end



#endif
