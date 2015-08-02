//
//  FavoriteMessagesViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_FavoriteMessagesViewController_h
#define BrightbyThree_FavoriteMessagesViewController_h

#import<UIKit/UIKit.h>

@interface FavoriteMessagesViewController: UITableViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
{
    NSMutableArray *sectionArray;
    NSMutableArray *numberOfRows;
}
@property(strong, nonatomic) NSMutableArray *sectionArray;
@property(strong, nonatomic) NSMutableArray *numberOfRows;

@end


#endif
