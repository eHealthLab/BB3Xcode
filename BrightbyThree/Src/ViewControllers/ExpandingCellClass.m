//
//  ExpandingCellClass.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ExpandingCellClass : UITableViewCell
@property(strong,nonatomic) IBOutlet UILabel *cellLabel;
@property(strong, nonatomic) IBOutlet UILabel *cellAccessory;
@property(strong, nonatomic) IBOutlet UILabel *detailsText;

@end