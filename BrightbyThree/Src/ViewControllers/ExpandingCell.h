//
//  ExpandingCell.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_ExpandingCell_h
#define BrightbyThree_ExpandingCell_h


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ExpandingCell : UITableViewCell
@property(strong,nonatomic) IBOutlet UILabel *cellLabel;
@property(strong, nonatomic) IBOutlet UILabel *cellAccessory;
@property(strong, nonatomic) IBOutlet UILabel *detailsText;

@end

#endif
