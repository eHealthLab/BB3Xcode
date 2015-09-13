//
//  facebookViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/12/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "facebookViewController.h"
#import "SWRevealViewController.h"

@implementation facebookViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuButton setImage:[[UIImage imageNamed:@"menu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self.iconButton setImage:[[UIImage imageNamed:@"BB3_AbousUs_icon2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.tag=55;
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://m.facebook.com/coloradoBrightBeginnings"]]];
    [[self view] addSubview:webView];
    
/*    CGRect frame = CGRectMake(260, 80, 80, 40);
    HTPressableButton *closeButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    closeButton.buttonColor = [UIColor ht_mintColor];
    closeButton.shadowColor = [UIColor ht_mintDarkColor];
    [closeButton setTitle:@"Done" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeFBPage) forControlEvents:UIControlEventTouchUpInside];
    [webView addSubview:closeButton];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Dashboard";*/
    
}

@end

