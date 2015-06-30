//
//  TutorialViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/7/15.
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
#import "TutorialViewController.h"
#import "AppDelegate.h"
#import "AFNetworking.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation TutorialViewController
{
    AppDelegate *appDelegate;
}

-(void)viewDidAppear:(BOOL)animated
{
    [_tutorialScrollView setScrollEnabled:YES];
    [_tutorialScrollView setContentSize:CGSizeMake(320,700)];
}


-(void) viewDidLoad
{
    [_tutorialScrollView setScrollEnabled:YES];
    [_tutorialScrollView setContentSize:CGSizeMake(320,700)];
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.title = @"Tutorial";
    
    
    
    CGRect frame = CGRectMake(30, 50, 315, 50);
    HTPressableButton *roundedRectButton1 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    [roundedRectButton1 setTitle:@"What is BB3?" forState:UIControlStateNormal];
    [roundedRectButton1 addTarget:self action:@selector(whatIsBB3Pressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton1];
    
    frame = CGRectMake(30, 102, 315, 50);
    HTPressableButton *roundedRectButton2 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    
    roundedRectButton2.buttonColor = [UIColor ht_mintColor];
    roundedRectButton2.shadowColor = [UIColor ht_mintDarkColor];
    
    
    [roundedRectButton2 setTitle:@"What is Dashboard?" forState:UIControlStateNormal];
    [roundedRectButton2 addTarget:self action:@selector(whatIsDashboardPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton2];
    
    frame = CGRectMake(30, 154, 315, 50);
    HTPressableButton *roundedRectButton3 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    
    roundedRectButton3.buttonColor = [UIColor ht_bitterSweetColor];
    roundedRectButton3.shadowColor = [UIColor ht_bitterSweetDarkColor];
    
    [roundedRectButton3 setTitle:@"How can I set goals?" forState:UIControlStateNormal];
    [roundedRectButton3 addTarget:self action:@selector(howToSetGoalsPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton3];
    
    frame = CGRectMake(30, 206, 315, 50);
    HTPressableButton *roundedRectButton4 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    
    roundedRectButton4.buttonColor = [UIColor ht_leadColor];
    roundedRectButton4.shadowColor = [UIColor ht_leadDarkColor];
    
    [roundedRectButton4 setTitle:@"How do I earn points?" forState:UIControlStateNormal];
    [roundedRectButton4 addTarget:self action:@selector(howToEarnPointsPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton4];

    frame = CGRectMake(30, 258, 315, 50);
    HTPressableButton *roundedRectButton5 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    
    [roundedRectButton5 setTitle:@"How do I track points?" forState:UIControlStateNormal];
    [roundedRectButton5 addTarget:self action:@selector(howDoITrackPointsPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton5];
    
    frame = CGRectMake(30, 310, 315, 50);
    HTPressableButton *roundedRectButton6 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    roundedRectButton6.buttonColor = [UIColor ht_mintColor];
    roundedRectButton6.shadowColor = [UIColor ht_mintDarkColor];
    [roundedRectButton6 setTitle:@"How do I earn badges and prizes?" forState:UIControlStateNormal];
    [roundedRectButton6 addTarget:self action:@selector(HowToEarnBadgesPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton6];
    
    frame = CGRectMake(30, 362, 315, 50);
    HTPressableButton *roundedRectButton7 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    roundedRectButton7.buttonColor = [UIColor ht_bitterSweetColor];
    roundedRectButton7.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [roundedRectButton7 setTitle:@"How can I change my password?" forState:UIControlStateNormal];
    [roundedRectButton7 addTarget:self action:@selector(changePasswordPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton7];
    
    frame = CGRectMake(30, 414, 315, 50);
    HTPressableButton *roundedRectButton8 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    [roundedRectButton8 setTitle:@"How can I access the Facebook page?" forState:UIControlStateNormal];
    roundedRectButton8.buttonColor = [UIColor ht_leadColor];
    roundedRectButton8.shadowColor = [UIColor ht_leadDarkColor];
    [roundedRectButton8 addTarget:self action:@selector(howToAccessFBPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton8];
    
    frame = CGRectMake(30, 466, 315, 50);
    HTPressableButton *roundedRectButton9 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    [roundedRectButton9 setTitle:@"How can I view messages?" forState:UIControlStateNormal];
    [roundedRectButton9 addTarget:self action:@selector(howToViewMessagesPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton9];
    
    frame = CGRectMake(30, 518, 315, 50);
    HTPressableButton *roundedRectButton10 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    roundedRectButton10.buttonColor = [UIColor ht_mintColor];
    roundedRectButton10.shadowColor = [UIColor ht_mintDarkColor];
    [roundedRectButton10 setTitle:@"How can I save favorite messages?" forState:UIControlStateNormal];
    [roundedRectButton10 addTarget:self action:@selector(saveFavoriteMessagesPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton10];
    
    frame = CGRectMake(30, 570, 315, 50);
    HTPressableButton *roundedRectButton11 = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
    roundedRectButton11.buttonColor = [UIColor ht_bitterSweetColor];
    roundedRectButton11.shadowColor = [UIColor ht_bitterSweetDarkColor];
    [roundedRectButton11 setTitle:@"Other questions?" forState:UIControlStateNormal];
    [roundedRectButton11 addTarget:self action:@selector(otherQuestionsPressed) forControlEvents:UIControlEventTouchUpInside];
    [_tutorialScrollView addSubview:roundedRectButton11];
    
    
    //Circular mint color button
    
    [super viewDidLoad];
}

-(void)whatIsBB3Pressed
{
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"What is BB3?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = [[[[@"The mission of Bright by Three (formerly Bright Beginnings) is to provide a bright beginning for all Colorado children by helping families support their children’s physical, emotional, and intellectual development during the critical first three years of life. You can find more information about Bright by Three and our other sponsors under “about” tab at the top of your screen. The Bright by Three app is designed to bring information about how you can help " stringByAppendingString:appDelegate.babyName] stringByAppendingString: @" learn and develop directly to your phone several times per week. You will receive this information via messages that contain useful information and activities that you can engage in with "] stringByAppendingString :appDelegate.babyName] stringByAppendingString:@". You can set your own goals and earn badges and prizes for reading with your child and completing recommended activities."];
    
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
    
    UILabel *textViewDetail2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 370, 350, 350)];
    NSString *string2 = [[[[@"The Bright by Three app is designed to bring information about how you can help " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"learn and develop directly to your phone several times per week. You will receive this information via messages that contain useful information and activities that you can engage in with "] stringByAppendingString: appDelegate.babyName] stringByAppendingString: @"You can set your own goals and earn badges and prizes for reading with your child and completing recommended activities."];

    textViewDetail2.text = string2;
    [textViewDetail2 setNumberOfLines:30];
    textViewDetail2.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail2];

    
}

-(void)whatIsDashboardPressed
{

    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"What is Dashboard?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = @"The dashboard is the screen through which you can access many of the features of the BB3 app. Tap on the appropriate button to set your goals, log minutes, track points, view your badges, change your settings, or access the BB3 Facebook page.";
    
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}


-(void)howToSetGoalsPressed
{
    
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How can I set goals?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = [[[[[[[[@"Set your reading goals! Looking at books together is a great way to teach" stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"new words and converse with "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@ ". Reading aloud at least 6 days per week helps to prepare children for school. Set your reading goals by selecting the number of days that you plan to read for at least 10 minutes with"] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" Challenge yourself to increase your goal every 2 weeks until you reading with "] stringByAppendingString: appDelegate.babyName] stringByAppendingString:@" at least 6 times per week."];
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}



-(void)howToEarnPointsPressed
{
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How do I earn points?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = [[[[[[[@"You earn points when you log your reading minutes and by completing challenges.\n\n" stringByAppendingString:@"Log the number of minutes that you read with "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" each day."] stringByAppendingString:@"For every minute of shared reading, you will earn 1 point.\n\n"] stringByAppendingString:@"Challenges will display in your message library once a week. These tasks are designated with a special icon     . Once you have completed the challenge, you can tap the “We did it!” button at the bottom of the screen and 10 bonus points will be added to your total. You may also be invited to post a photo of you and "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" doing the activity for the opportunity to earn extra points."];
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
}


-(void)howDoITrackPointsPressed
{
 
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How do I track points?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = [[@"The BB3 app automatically tracks points that you earn for reading aloud with " stringByAppendingString:appDelegate.babyName] stringByAppendingString: @" and completing challenges.Your point total will automatically update when you log minutes or earn challenge points.  You can view your point total on the same screen where you log your minutes.  You can earn badges and prizes for accumulating points.  You can also view how you are doing compared with other users by tapping on the graph image. A progress bar will show you how close you are to meeting your weekly goal."];
    
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}


-(void)HowToEarnBadgesPressed
{
    
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How do I earn badges and prizes?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = [[@"Virtual badges will be awarded after you earn a pre-determined number of points. You can track the badges that you have earned by tapping on the badge button on the dashboard IMAGE. Once you have earned a badge, a special notification screen will display.  Badges can be shared with friends on Facebook by clicking  on the upload image at the bottom of the  notification screen IMAGE. For every 500 points you will be able to select a book for " stringByAppendingString:appDelegate.babyName] stringByAppendingString: @" which will be mailed to your home."];
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}



-(void)changePasswordPressed
{
    
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How can I change my password?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = @"You can change your password and log in information (including your email address and user name) by tapping on the Settings button on the dashboard IMAGE. You can also choose to “Like” the BB3 Facebook page if you did not already “Like” the BB3 Facebook page when you registered for the app IMAGE.  When you “Like” the BB3 Facebook page you will receive messages and information from BB3 on your Facebook newsfeed.";
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}



-(void)howToAccessFBPressed
{
 
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How can I access the Facebook page?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = @"You can access the BB3 Facebook page by tapping on the Facebook button on your dashboard IMAGE. This will take you to the BB3 Facebook page where you can read and comment on posts with information about early child development. You can receive posts from the BB3 Facebook page directly to your Facebook newsfeed if you “Like” the BB3 page when you register for the app or when you tap on the “Settings” button on your dashboard IMAGE.";
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}



-(void)howToViewMessagesPressed
{
    
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How can I view messages?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = [[[[@"You will receive 3-4 messages per week in your message library.  Messages will contain information about different ways that you can help " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" learn.  When a new message is available, a notification will display on the BB3 app icon and your tab bar IMAGE. Some messages will contain a video of a parent and child performing the activity. Often messages will also have helpful links that you can tap on for additional information to help you complete the activity.  Tap the “Why” button for more information about how the activity can help "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"  learn INSERT IMAGE.  Tap on the camera IMAGE to take a photo of your child performing the activity and share it on the IMAGE. You can also “rate” the message  IMAGE, save it as a favorite  INSERT IMAGE, or share it on Facebook IMAGE. Once you receive a message it will be saved  in the message library and you can view it at any time."];
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}



-(void)saveFavoriteMessagesPressed
{
    
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How can I save favorite messages?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = @"You can designate a message as favorite by tapping on the “Favorite” button on your IMAGE. Once you have selected a message as a “favorite” it will be stored under your favorites tab.  This option allows you to access your favorite messages quickly and easily.  If no longer want a message in your favorites library, simply tap the “Remove favorite” button on the message screen under the favorites tab INSERT IMAGE.";
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}


-(void)otherQuestionsPressed
{
    
    appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"Other questions?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UILabel *textViewDetail1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 350, 350)];
    NSString *string1 = @"If you cannot find the answer to your question in this tutorial or you are having any problems with the app, simply tap <a href=mailto:agileehealth@gmail.com?subject=Question related to BB3&body=Question/comment releated to BB3. target> Contact Us </a> and send us your question. We will email a response within 24-48 hours.";
    
    textViewDetail1.text = string1;
    [textViewDetail1 setNumberOfLines:30];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [uiViewController.view addSubview:textViewDetail1];
    
}


@end