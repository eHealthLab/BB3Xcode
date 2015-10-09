//
//  FavoritesStartViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/8/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoritesStartViewController.h"
#import "AppDelegate.h"

@implementation FavoritesStartViewController
{
    AppDelegate *appDelegate;
    NSUserDefaults *prefs;
    //int numberOfBadgeEarned;
}


- (void)viewDidLoad
{
    
    self.title = @"Favorites";
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

    
    // Create the data model
    _pageTitles = @[@"Welcome", @"Dashboard", @"Setting Goals", @"Earning Points", @"Tracking Points", @"Badges and Prizes", @"Changing Your Settings", @"The BB3 Facebook Page", @"Messages", @"Favorites", @"Begin", @"one more"];
    
    _messageContents = @[@"one", @"two"];
    
    
    _messageImages = @[@"Badge150.png", @"Badge400.png", @"Badge700.png",@"Badge1000.png",@"Badge1500.png",@"Badge2000.png",@"Badge2500.png",@"Badge3000.png",@"Badge3500.png",@"Badge4000.png",@"Badge4500.png",@"Badge5000.png"];
    
    _messageTitles = @[@"one",@"two"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoritesPageViewController"];
    self.pageViewController.dataSource = self;
    
    FavoritesPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-30);
    
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

- (FavoritesPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        NSLog(@"nothing in there");
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    FavoritesPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoritesPageContentViewController"];
    
    //int numberToDisplay = (int)(3*index+0);
    /*if (numberToDisplay < appDelegate.nextBadgeToEarn) {
        pageContentViewController.imageFile1 = self.badgeImages[3*index+0];
        pageContentViewController.descriptionBadge1 = self.badgeBlurbs[3*index+0];
        pageContentViewController.dateBadge1Earned = self.badgeDates[3*index+0];
    }
    numberToDisplay = (int)(3*index+1);
    if (numberToDisplay < appDelegate.nextBadgeToEarn) {
        pageContentViewController.imageFile2 = self.badgeImages[3*index+1];
        pageContentViewController.descriptionBadge2 = self.badgeBlurbs[3*index+1];
        pageContentViewController.dateBadge2Earned = self.badgeDates[3*index+1];
    }
    
    numberToDisplay = (int)(3*index+2);
    if (numberToDisplay < appDelegate.nextBadgeToEarn) {
        pageContentViewController.imageFile3 = self.badgeImages[3*index+2];
        pageContentViewController.descriptionBadge3 = self.badgeBlurbs[3*index+2];
        pageContentViewController.dateBadge3Earned = self.badgeDates[3*index+2];
    }*/
    
    
    
    //pageContentViewController.descriptionBadge2 = self.badgeBlurbs[index];
    //pageContentViewController.descriptionBadge3 = self.badgeBlurbs[index];
    
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((FavoritesPageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((FavoritesPageContentViewController*) viewController).pageIndex;
    
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
    /*if (appDelegate.favoriteMessagesLibrary.count%10 == 0) {
        NSLog(@"number of pages: %lu", appDelegate.favoriteMessagesLibrary.count/10);
        return appDelegate.nextBadgeToEarn/10;
    }
    else {
        NSLog(@"number of pages: %lu", appDelegate.favoriteMessagesLibrary.count/10+1);
        return (appDelegate.favoriteMessagesLibrary.count/10)+1;
    }*/
    
    return 3;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end

