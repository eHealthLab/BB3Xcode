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
    
    [self.view addSubview:self.buttonsView];
    
    
                                                                              
        
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Mom reading with baby - anglo.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.3];
    

    /*CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    UIColor *startColour = [UIColor colorWithHue:.580555 saturation:0.31 brightness:0.90 alpha:1.0];
    UIColor *endColour = [UIColor colorWithHue:.58333 saturation:0.50 brightness:0.62 alpha:1.0];
    gradient.colors = [NSArray arrayWithObjects:(id)[startColour CGColor], (id)[endColour CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];*/
    
    //CGRect frame = CGRectMake(30, 320, 150, 80);
    //HTPressableButton *goalsButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    
    [self.mainImage setImage:[UIImage imageNamed:@"baby with tongue out.jpg"]];
    //self.mainImage.layer.cornerRadius = 10.0f;
    //self.mainImage.clipsToBounds = YES;
    
    //self.mainImage.layer.borderWidth = 3.0f;
    //self.mainImage.layer.borderColor = [UIColor grayColor].CGColor;
    
    [self.setGoalsButton setStyle:HTPressableButtonStyleRounded];
    self.setGoalsButton.buttonColor = [UIColor ht_grapeFruitColor];
    self.setGoalsButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    [self.setGoalsButton setShadowHeight:0.80];
    [self.setGoalsButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.setGoalsButton setTitle:@"Set Goals" forState:UIControlStateNormal];
    [self.setGoalsButton addTarget:self action:@selector(setGoalsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    //[self.view addSubview:self.setGoalsButton];
    
    //frame = CGRectMake(210, 320, 150, 80);
    //HTPressableButton *facebookButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    [self.facebookButton setStyle:HTPressableButtonStyleRounded];
    self.facebookButton.buttonColor = [UIColor ht_blueJeansColor];
    self.facebookButton.shadowColor = [UIColor ht_blueJeansDarkColor];
    [self.facebookButton setShadowHeight:0.80];
    [self.facebookButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.facebookButton setTitle:@"Facebook" forState:UIControlStateNormal];
    [self.facebookButton addTarget:self action:@selector(visitBBFBPagePressed) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:self.facebookButton];
    
    //frame = CGRectMake(30, 420, 150, 80);
    //HTPressableButton *logMinutesButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    [self.logMinutesButton setStyle:HTPressableButtonStyleRounded];
    self.logMinutesButton.buttonColor = [UIColor ht_mintColor];
    self.logMinutesButton.shadowColor = [UIColor ht_mintDarkColor];
    [self.logMinutesButton setShadowHeight:0.80];
    [self.logMinutesButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.logMinutesButton setTitle:@"Log Minutes" forState:UIControlStateNormal];
    [self.logMinutesButton addTarget:self action:@selector(logMinutesPressed) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:self.logMinutesButton];
    
    //frame = CGRectMake(210, 420, 150, 80);
    //HTPressableButton *networkButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    [self.networkButton setStyle:HTPressableButtonStyleRounded];
    self.networkButton.buttonColor = [UIColor ht_carrotColor];
    self.networkButton.shadowColor = [UIColor ht_pumpkinColor];
    [self.networkButton setShadowHeight:0.80];
    [self.networkButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.networkButton setTitle:@"Network" forState:UIControlStateNormal];
    [self.networkButton addTarget:self action:@selector(displayNetworkPressed) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:self.networkButton];
    
    //frame = CGRectMake(30, 520, 150, 80);
    //frame = CGRectMake(110, 300, 100, 100);
    //HTPressableButton *badgesButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    
    /*self.badgesButton.backgroundColor = [UIColor clearColor];
    self.badgesButton.imageView.image = [UIImage imageNamed:@"twitter@2x.png"];
    self.badgesButton.detailTextLabel.font = [UIFont systemFontOfSize:10];*/
    
    [self.badgesButton setStyle:HTPressableButtonStyleRounded];
    [self.badgesButton setTitle:@"My Badges" forState:UIControlStateNormal];
    self.badgesButton.buttonColor = [UIColor ht_sunflowerColor];
    self.badgesButton.shadowColor = [UIColor ht_citrusColor];
    [self.badgesButton setShadowHeight:0.80];
    [self.badgesButton addTarget:self action:@selector(showBadgesPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.centralImage setImage:[UIImage imageNamed:@"Mom reading with baby - anglo.jpg"]];
    self.centralImage.layer.cornerRadius = self.centralImage.frame.size.width / 2;
    self.centralImage.clipsToBounds = YES;
    
    self.centralImage.layer.borderWidth = 3.0f;
    self.centralImage.layer.borderColor = [UIColor blackColor].CGColor;

    
    
    //[self.view addSubview:self.badgesButton];
    
    //frame = CGRectMake(210, 520, 150, 80);
    //HTPressableButton *messagesButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    [self.messagesButton setStyle:HTPressableButtonStyleRounded];
    self.messagesButton.buttonColor = [UIColor ht_leadColor];
    self.messagesButton.shadowColor = [UIColor ht_leadDarkColor];
    [self.messagesButton setShadowHeight:0.80];
    [self.messagesButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.messagesButton setTitle:@"Messages" forState:UIControlStateNormal];
    [self.messagesButton addTarget:self action:@selector(loadMessagesLibraryPressed) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:self.messagesButton];

    
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
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Dashboard";
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
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Dashboard";
    
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