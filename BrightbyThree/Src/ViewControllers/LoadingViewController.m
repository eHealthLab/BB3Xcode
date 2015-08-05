//
//  LoadingViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 8/4/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingViewController.h"
#import "AppDelegate.h"

@implementation LoadingViewController
{
    NSUserDefaults *prefs;
    AppDelegate *appDelegate;
}
-(void)viewDidLoad
{
    NSLog(@"inside did load\n");
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSString *stringEmail = [prefs objectForKey:@"userName"];
    NSString *stringPassword = [prefs objectForKey:@"password"];
    //NSString *id = [prefs objectForKey:@"userID"];
    if (stringEmail.length < 2 || stringPassword.length < 2) {
         NSLog(@"%@, %@\n", stringEmail, stringPassword);
        NSLog(@"not logged in\n");
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"startViewController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
    }
    else {
        NSLog(@"logged in\n");
        NSLog(@"%@, %@\n", stringEmail, stringPassword);
        appDelegate.firstName = [prefs objectForKey:@"firstName"];
        appDelegate.lastName = [prefs objectForKey:@"lastName"];
        appDelegate.userEmail = [prefs objectForKey:@"email"];
        appDelegate.userPassword = [prefs objectForKey:@"password"];
        appDelegate.babyName = [prefs objectForKey:@"babyName"];
        appDelegate.babyDOB = [prefs objectForKey:@"babyDOB"];
        appDelegate.babyGender = [prefs objectForKey:@"babyGender"];
        appDelegate.phoneNumber = [prefs objectForKey:@"phoneNumber"];
        appDelegate.zipcode  = [prefs objectForKey:@"zipcode"];
        appDelegate.userID = [prefs objectForKey:@"userID"];
        
        
        NSLog(@"values are: %@, %@, %@, %@, %@, %@, %@, %@, %@", appDelegate.firstName, appDelegate.lastName, appDelegate.userEmail, appDelegate.userPassword, appDelegate.babyName, appDelegate.babyDOB, appDelegate.babyGender, appDelegate.phoneNumber, appDelegate.zipcode);
        
        
        UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        UIImage *settingsImage = [UIImage imageNamed:@"19-gear.png"];
        UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:settingsImage style:UIBarButtonItemStylePlain target:self action:@selector(settingsPressed)];
        uiViewController.navigationItem.leftBarButtonItem = settingsButton;
        
        UIImage *accountImage = [UIImage imageNamed:@"76-baby.png"];
        UIBarButtonItem *myAccountButton = [[UIBarButtonItem alloc] initWithImage:accountImage style:UIBarButtonItemStylePlain target:self action:@selector(myAccountPressed)];
        //uiViewController.navigationItem.leftBarButtonItem = settingsButton;
        
        uiViewController.navigationItem.rightBarButtonItem = myAccountButton;
    }
    
}


-(void)myAccountPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"accountViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    //UIImage *accountImage = [UIImage imageNamed:@"76-baby.png"];
    //UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:nil];
    //[[UIBarButtonItem alloc] initWithImage:accountImage style:UIBarButtonItemStylePlain target:self action:@selector(myAccountPressed)];
    //uiViewController.navigationItem.rightBarButtonItem = saveButton;
    
    //uiViewController.navigationItem.rightBarButtonItem = myAccountButton;
}

-(void)settingsPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingsViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
}

@end