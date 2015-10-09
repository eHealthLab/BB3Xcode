//
//  FavoritesStartViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/8/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_FavoritesStartViewController_h
#define BrightbyThree_FavoritesStartViewController_h

#import <UIKit/UIKit.h>
#import "FavoritesPageContentViewController.h"
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"
#import "ACPButton.h"

@interface FavoritesStartViewController : UIViewController <UIPageViewControllerDataSource>

//- (IBAction)startReview:(id)sender;

@property(strong, nonatomic) UIPageViewController *pageViewController;
@property(strong, nonatomic) NSArray *pageTitles;
@property(strong, nonatomic) NSArray *messageContents;
@property(strong, nonatomic) NSArray *messageTitles;
@property(strong, nonatomic) NSArray *messageImages;
@property(strong, nonatomic) NSArray *messageVideos;

@end


#endif
