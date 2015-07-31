//
//  StartViewController.h
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


#ifndef BrightbyThree_StartViewController_h
#define BrightbyThree_StartViewController_h

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface StartViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startReview:(id)sender;

@property(strong, nonatomic) UIPageViewController *pageViewController;
@property(strong, nonatomic) NSArray *pageTitles;
@property(strong, nonatomic) NSArray *pageBlurbs;
@property(strong, nonatomic) NSArray *pageImages;

@end

#endif
