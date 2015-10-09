//
//  ExpandingCell.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ExpandingCell.h"

@implementation ExpandingCell

-(void)viewDidLoad
{
    self.cellLabel.text = @"Hello";
    self.detailsText.text = @"Hello there";
}

-(void)viewWillAppear:(BOOL)animated
{
    //[super viewWillAppear:YES];
    self.cellLabel.text = @"Hello";
    self.detailsText.text = @"Hello there";
}

@end

