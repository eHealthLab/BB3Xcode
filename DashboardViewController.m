//
//  DashboardViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/24/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DashboardViewController.h"
#import "AppDelegate.h"


@implementation DashboardViewController
{
    AppDelegate *appDelegate;
}

-(void) viewDidLoad
{
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.title = @"Dashboard";

    
    CGRect frame = CGRectMake(30, 320, 150, 80);
    HTPressableButton *goalsButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    goalsButton.buttonColor = [UIColor ht_grapeFruitColor];
    goalsButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    [goalsButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [goalsButton setTitle:@"Set Goals" forState:UIControlStateNormal];
    [goalsButton addTarget:self action:@selector(setGoalsPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goalsButton];
    
    frame = CGRectMake(210, 320, 150, 80);
    HTPressableButton *facebookButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    facebookButton.buttonColor = [UIColor ht_blueJeansColor];
    facebookButton.shadowColor = [UIColor ht_blueJeansDarkColor];
    [facebookButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [facebookButton setTitle:@"Facebook" forState:UIControlStateNormal];
    [facebookButton addTarget:self action:@selector(visitBBFBPagePressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookButton];
    
    frame = CGRectMake(30, 420, 150, 80);
    HTPressableButton *logMinutesButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    logMinutesButton.buttonColor = [UIColor ht_mintColor];
    logMinutesButton.shadowColor = [UIColor ht_mintDarkColor];
    [logMinutesButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [logMinutesButton setTitle:@"Log Minutes" forState:UIControlStateNormal];
    [logMinutesButton addTarget:self action:@selector(logMinutesPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logMinutesButton];
    
    frame = CGRectMake(210, 420, 150, 80);
    HTPressableButton *networkButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    networkButton.buttonColor = [UIColor ht_carrotColor];
    networkButton.shadowColor = [UIColor ht_pumpkinColor];
    
    [networkButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [networkButton setTitle:@"Network" forState:UIControlStateNormal];
    [networkButton addTarget:self action:@selector(displayNetworkPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:networkButton];
    
    frame = CGRectMake(30, 520, 150, 80);
    //frame = CGRectMake(110, 300, 100, 100);
    HTPressableButton *badgesButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    [badgesButton setTitle:@"My Badges" forState:UIControlStateNormal];
    badgesButton.buttonColor = [UIColor ht_sunflowerColor];
    badgesButton.shadowColor = [UIColor ht_citrusColor];
    [badgesButton addTarget:self action:@selector(showBadgesPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:badgesButton];
    
    frame = CGRectMake(210, 520, 150, 80);
    HTPressableButton *messagesButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    messagesButton.buttonColor = [UIColor ht_leadColor];
    messagesButton.shadowColor = [UIColor ht_leadDarkColor];
    [messagesButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [messagesButton setTitle:@"Messages" forState:UIControlStateNormal];
    [messagesButton addTarget:self action:@selector(loadMessagesLibraryPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:messagesButton];

    
}

-(void)setGoalsPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"goalsViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
}

-(void)showBadgesPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"badgeViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    
}

-(void)displayNetworkPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"networkViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    
}

-(void)logMinutesPressed
{
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"logMinutesController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
}

-(void)visitBBFBPagePressed
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.tag=55;
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //[webView setFrame:CGRectMake(0, 0, 375, 720)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.facebook.com/coloradoBrightBeginnings"]]];
    [[self view] addSubview:webView];
    
    CGRect frame = CGRectMake(260, 80, 80, 40);
    HTPressableButton *closeButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    closeButton.buttonColor = [UIColor ht_mintColor];
    closeButton.shadowColor = [UIColor ht_mintDarkColor];
    [closeButton setTitle:@"Done" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeFBPage) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:closeButton];
    
}

-(void)closeFBPage
{
    [[self.view viewWithTag:55] removeFromSuperview];
}

-(void)loadMessagesLibraryPressed
{
    UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"libraryViewController"];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Dashboard";
    //[barButton setImage:[UIImage imageNamed:@"81-dashboard.png"]];
    
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    [self.navigationController pushViewController:uiViewController animated:YES];
}


@end