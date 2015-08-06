//
//  PageContentViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/12/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//
//  Created by Aarti Munjal on 5/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
// This program is free software; you can
// redistribute it and/or modify it under the terms
// of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of
// the License, or (at your option) any later
//version.

// This program is distributed in the hope that it
// will be useful, but WITHOUT ANY WARRANTY; without
// even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.

// You should have received a copy of the GNU General
// Public License along with this program; if not,
// write to the Free Software Foundation, Inc., 51
// Franklin Street, Fifth Floor, Boston, MA
// 02110-1301, USA.


#import <Foundation/Foundation.h>
#import "PageContentViewController.h"

@implementation PageContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.titleDescription.text = self.titleBlurb;
    
    
    self.titleDescription.textAlignment=NSTextAlignmentJustified;
    [self.titleDescription sizeToFit];
    [self.titleDescription setScrollEnabled:YES];
    [self.titleDescription setFont:[UIFont fontWithName:@"DIN Alternate" size:15.0]];
    //[uiViewController.view addSubview:textViewDetail1];
    CGRect frame = self.titleDescription.frame;
    frame.size.height = self.titleDescription.contentSize.height;
    self.titleDescription.frame = frame;
    
    self.skipButton.buttonColor = [UIColor ht_mintColor];
}

@end