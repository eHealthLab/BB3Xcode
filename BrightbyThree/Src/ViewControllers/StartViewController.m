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
}


- (void)viewDidLoad
{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [super viewDidLoad];
    prefs = [NSUserDefaults standardUserDefaults];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    UIColor *startColour = [UIColor colorWithHue:.580555 saturation:0.31 brightness:0.90 alpha:1.0];
    UIColor *endColour = [UIColor colorWithHue:.58333 saturation:0.50 brightness:0.62 alpha:1.0];
    gradient.colors = [NSArray arrayWithObjects:(id)[startColour CGColor], (id)[endColour CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    NSString *blurb1= @"The Bright by Three (BB3) app brings information about how you can help your child  learn and develop directly to your phone several times per week.  You will get messages that have information about activities that you can do with your child to help him learn.   You can set goals  and earn badges and prizes  for looking at books with your child and doing activities.";

    NSString *blurb2 = @"The dashboard is the screen through which you can access all of the features of the BB3 app.  Tap on a button to set your goals, log minutes, track points, view your badges, change your settings, or access the BB3 Facebook page.";
    NSString *blurb3 = @"Set your reading goals! Looking at books together is a great way to teach your child new words and talk with him.  Looking at books with your child at least 6 days per week will help to make him ready for school.  Set your goal  by selecting the number of days and minutes that you plan to look at books with your child.  Try to increase your goal every 2 weeks until you are looking at books together at least 6 days per week for at least 10 minutes per day.";
    NSString *blurb4 = @"You get points when you log your reading minutes and complete challenges. Log the number of minutes  that you read with your child each day.  For every minute of shared reading, you will earn 1 point.  Challenges will display in your message library once a week . Once you have finished a challenge, tap the “We did it!”  button at the bottom of the screen and you will get 10 bonus points.  You may also be asked to post a photo of you and your child doing an activity to earn extra points.";
    
    NSString *blurb5 = @"The BB3 app will keep track of the points that you get for looking at books with your child and completing challenges. Your point total will increase when you log minutes or earn challenge points. You can view your point total on the same screen where you log your minutes. You can earn badges and prizes when you get enough points. A progress bar will show you how close you are to meeting your weekly goal. You can also see how you are doing compared to other users by tapping on the network button";
    
    NSString *blurb6 = @"Badges will be awarded after you earn enough points. You can see your badges by tapping on the badge button on the dashboard. Badges can be shared with friends on Facebook by clicking on the upload image at the bottom of the notification screen. For every 500 points you will be able to select a book for your child which will be mailed to your home.";
    
    NSString *blurb7 = @"You can change your password and log in information (including your email address and user name) by tapping on the Settings button on the dashboard.";
    
    NSString *blurb8 = @"You can access the BB3 Facebook page by tapping on the Facebook button on your dashboard.  This will take you to the BB3 Facebook page where you can read and comment on posts with more information about early child development. You can receive posts from the BB3 Facebook page directly to your Facebook newsfeed if you “Like” the BB3 page.";
    
    
    NSString *blurb9 = @"You will receive 3-4 messages per week in your message library.  Messages have information about different ways that you can help your child learn.  When you have a new message, a notification will display on the BB3 app icon  and your tab bar. Some messages will contain a video that demonstrates the activity. Often messages will have helpful links that you can tap on for to help you complete the activity. Tap the “Why” button for more information about how the activity can help your child learn. Tap on the camera to take a photo of your child performing the activity  and share it on the BB3 Facebook page .  You can also “rate”  the message, save it as a favorite, or share it on Facebook. Once you receive a message it will be saved in the message library for 3 months and you can view it at any time.";
    NSString *blurb10 = @"You can designate a message as favorite by tapping on the star button on your message screen. Once you have selected a message as a “favorite” it will be stored under your favorites tab.  This option allows you to access your favorite messages quickly and easily. If you no longer want a message in your favorites library, simply tap the “Remove favorite” button on the message screen under the favorites tab.";
    
    
    NSString *blurb11 = @"Your overview of the BB3 app is finished. Press Skip to begin using the BB3 app. If you want to review any of the information in the overivew you can find it by tapping on the tutorial icon on your navigation bar at the bottom of the screen.";
    
    // Create the data model
    _pageTitles = @[@"Welcome", @"Dashboard", @"Setting Goals", @"Earning Points", @"Tracking Points", @"Badges and Prizes", @"Changing Your Settings", @"The BB3 Facebook Page", @"Messages", @"Favorites", @"Begin"];
    
    _pageBlurbs = @[blurb1, blurb2, blurb3,blurb4,blurb5,blurb6,blurb7,blurb8,blurb9,blurb10,blurb11];
    
    
    _pageImages = @[@"iStock_000015216865_Large.jpg", @"dashboardShot.png", @"goalsShot.png", @"minutesShot.png",@"minutesShot.png",@"badgesShot.png",@"accountsShot.png",@"facebookShot.png",@"messagesShot.png",@"addToFavoritesShot.png",@"page4.png",@"page4.png"];
    
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
    
    
    //CGRect frame = CGRectMake(150.0, 460.0, 100.0, 100.0);
    //CGRect frame = CGRectMake(150.0, 460.0, 100, self.view.frame.size.height - 10);
    
    
    
    
    self.skipButton.cornerRadius = 10.0;
    self.skipButton.shadowHeight = self.skipButton.frame.size.height * 0.17;
    [self.skipButton setTitle:@"Skip" forState:UIControlStateNormal];
    self.skipButton.buttonColor = [UIColor ht_grapeFruitColor];
    self.skipButton.shadowColor = [UIColor ht_mintDarkColor];
    [self.skipButton addTarget:self action:@selector(startButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.skipButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startReview:(id)sender {
    NSLog(@"inside the review");
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        NSLog(@"nothing in there");
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.titleBlurb = self.pageBlurbs[index];
    pageContentViewController.pageIndex = index;
    if (index == 1) {
        
        /*UIButton *enrollNow = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [enrollNow setTitle:@"Enroll Now" forState:UIControlStateNormal];
        enrollNow.frame = CGRectMake(100.0, 530.0, 160.0, 40.0);
        [self.view addSubview:enrollNow];
    } else {
       //for (UIView *btn in btn.superview.subviews)
        //[btn removeFromSuperview];
         */
    }
         
    
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
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


-(void)startButtonPressed
{
            UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
    
    }

@end
