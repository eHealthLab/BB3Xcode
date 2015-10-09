//
//  StartViewController.m
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
#import "StartViewController.h"
#import "AppDelegate.h"

@implementation StartViewController
{
    AppDelegate *appDelegate;
    NSUserDefaults *prefs;
    int numberOfBadgeEarned;
}


- (void)viewDidLoad
{
    
    self.title = @"Your Rewards and Badges";
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [super viewDidLoad];
    prefs = [NSUserDefaults standardUserDefaults];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;

    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    UIColor *startColour = [UIColor colorWithHue:.580555 saturation:0.31 brightness:0.90 alpha:1.0];
    UIColor *endColour = [UIColor colorWithHue:.58333 saturation:0.50 brightness:0.62 alpha:1.0];
    gradient.colors = [NSArray arrayWithObjects:(id)[startColour CGColor], (id)[endColour CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    NSString *blurb1= @"Badge description here. Sample description";

    NSString *blurb2 = @"Badge description here. Sample description";
    NSString *blurb3 = @"Badge description here. Sample description";
    NSString *blurb4 = @"Badge description here. Sample description";
    
    NSString *blurb5 = @"Badge description here. Sample description";
    
    NSString *blurb6 = @"Badge description here. Sample description";
    
    NSString *blurb7 = @"Badge description here. Sample description";
    
    NSString *blurb8 = @"Badge description here. Sample description";

    NSString *blurb9 = @"Badge description here. Sample description";
    NSString *blurb10 = @"Badge description here. Sample description";

    NSString *blurb11 = @"Badge description here. Sample description";
    
    NSString *blurb12 = @"Badge description here. Sample description";
    
    // Create the data model
    _pageTitles = @[@"Welcome", @"Dashboard", @"Setting Goals", @"Earning Points", @"Tracking Points", @"Badges and Prizes", @"Changing Your Settings", @"The BB3 Facebook Page", @"Messages", @"Favorites", @"Begin", @"one more"];
    
    _badgeBlurbs = @[blurb1, blurb2, blurb3,blurb4,blurb5,blurb6,blurb7,blurb8,blurb9,blurb10,blurb11,blurb12];
    
    
    _badgeImages = @[@"Badge150.png", @"Badge400.png", @"Badge700.png",@"Badge1000.png",@"Badge1500.png",@"Badge2000.png",@"Badge2500.png",@"Badge3000.png",@"Badge3500.png",@"Badge4000.png",@"Badge4500.png",@"Badge5000.png"];
    
    _badgeDates = @[@"09/12/2015", @"09/12/2015", @"09/12/2015",@"09/12/2015",@"09/12/2015",@"09/12/2015",@"09/12/2015",@"09/12/2015",@"09/12/2015",@"09/12/2015",@"09/12/2015",@"09/12/2015"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        NSLog(@"nothing in there");
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];

    
    NSLog(@"badges earned:%d\n", appDelegate.nextBadgeToEarn);
    int numberToDisplay = (int)(3*index+0);
    if (numberToDisplay < appDelegate.nextBadgeToEarn-1) {
        pageContentViewController.imageFile1 = self.badgeImages[3*index+0];
        pageContentViewController.descriptionBadge1 = self.badgeBlurbs[3*index+0];
        pageContentViewController.dateBadge1Earned = self.badgeDates[3*index+0];
    }
    numberToDisplay = (int)(3*index+1);
    if (numberToDisplay < appDelegate.nextBadgeToEarn-1) {
        pageContentViewController.imageFile2 = self.badgeImages[3*index+1];
        pageContentViewController.descriptionBadge2 = self.badgeBlurbs[3*index+1];
        pageContentViewController.dateBadge2Earned = self.badgeDates[3*index+1];
    }

    numberToDisplay = (int)(3*index+2);
    if (numberToDisplay < appDelegate.nextBadgeToEarn-1) {
        pageContentViewController.imageFile3 = self.badgeImages[3*index+2];
        pageContentViewController.descriptionBadge3 = self.badgeBlurbs[3*index+2];
        pageContentViewController.dateBadge3Earned = self.badgeDates[3*index+2];
    }
    
    
    
    //pageContentViewController.descriptionBadge2 = self.badgeBlurbs[index];
    //pageContentViewController.descriptionBadge3 = self.badgeBlurbs[index];
    
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    if (appDelegate.nextBadgeToEarn%3 == 0) {
        NSLog(@"number of pages: %d", appDelegate.nextBadgeToEarn/3);
        return appDelegate.nextBadgeToEarn/3;
    }
    else {
        NSLog(@"number of pages: %d", appDelegate.nextBadgeToEarn/3+1);
        return (appDelegate.nextBadgeToEarn/3)+1;
    }
    
    //return [self.pageTitles count]/3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
