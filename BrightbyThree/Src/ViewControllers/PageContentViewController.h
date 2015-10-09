//
//  PageContentViewController.h
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


#ifndef BrightbyThree_PageContentViewController_h
#define BrightbyThree_PageContentViewController_h

#import <UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"


@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *badge1Image;
@property (weak, nonatomic) IBOutlet UIImageView *badge2Image;
@property (weak, nonatomic) IBOutlet UIImageView *badge3Image;

@property (weak, nonatomic) IBOutlet UILabel *dateBadge1;
@property (weak, nonatomic) IBOutlet UILabel *dateBadge2;
@property (weak, nonatomic) IBOutlet UILabel *dateBadge3;

@property (weak, nonatomic) IBOutlet UILabel *badge1Label;
@property (weak, nonatomic) IBOutlet UILabel *badge2Label;
@property (weak, nonatomic) IBOutlet UILabel *badge3Label;

@property (weak, nonatomic) IBOutlet UILabel *earned1Label;
@property (weak, nonatomic) IBOutlet UILabel *earned2Label;
@property (weak, nonatomic) IBOutlet UILabel *earned3Label;

@property NSUInteger pageIndex;

@property NSString *descriptionBadge1;
@property NSString *descriptionBadge2;
@property NSString *descriptionBadge3;


@property NSString *dateBadge1Earned;
@property NSString *dateBadge2Earned;
@property NSString *dateBadge3Earned;

@property NSString *imageFile1;
@property NSString *imageFile2;
@property NSString *imageFile3;

@end

#endif
