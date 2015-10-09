//
//  FullMessageView.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FullMessageView.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"


@implementation FullMessageView
{
    AppDelegate *delegate;
    
}

-(void)viewDidLoad
{
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.title = @"Message detail";
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    self.messageTitleLabel.text = @"Welcome to BB3!";
    NSString *string1 = [[@"Welcome to BB3! Over the coming months you will be receiving messages with ideas to promote " stringByAppendingString:delegate.babyName] stringByAppendingString:@"'s brain development"];
    self.fullMessageText.text = string1;
    
    [self.fullMessageText setFont:[UIFont systemFontOfSize:18]];
    self.fullMessageText.textColor = [UIColor whiteColor];
    self.fullMessageText.textAlignment=NSTextAlignmentJustified;
    [self.fullMessageText sizeToFit];
    [self.fullMessageText setScrollEnabled:YES];
    [self.view addSubview:self.fullMessageText];
    CGRect frame = self.fullMessageText.frame;
    frame.size.height = self.fullMessageText.contentSize.height;
    self.fullMessageText.frame = frame;
    
    
    
    
}

- (void)onDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)addToFavsPressed:(id)sender {
}

- (IBAction)viewFavsPressed:(id)sender {
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoritesStartViewController"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uiViewController];
    
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:nav animated:NO completion:nil];
    
}
@end
