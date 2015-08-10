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
#import <MessageUI/MessageUI.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation TutorialViewController
{
    AppDelegate *appDelegate;
}

-(void)viewDidAppear:(BOOL)animated
{
    appDelegate.numberOfClicksTutorial++;
    
    appDelegate.babyName = [appDelegate.babyName uppercaseString];
    
    [_tutorialScrollView setScrollEnabled:YES];
    [_tutorialScrollView setContentSize:CGSizeMake(320,750)];
}


-(void) viewDidLoad
{
    [_tutorialScrollView setScrollEnabled:YES];
    [_tutorialScrollView setContentSize:CGSizeMake(320,700)];
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.title = @"Tutorial";
    
    // Create the colors
    /*UIColor *darkOp =
    [UIColor colorWithRed:0.62f green:0.4f blue:0.42f alpha:1.0];
    UIColor *lightOp =
    [UIColor colorWithRed:0.43f green:0.76f blue:0.07f alpha:1.0];*/
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"blue_minimalistic_gradient_colors_1200x1920.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:1.0];
    
    /*
    UIColor *darkOp =
    [UIColor whiteColor];
    UIColor *lightOp =
    [UIColor grayColor];
    
    // Create the gradient
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    // Set colors
    gradient.colors = [NSArray arrayWithObjects:
                       (id)lightOp.CGColor,
                       (id)darkOp.CGColor,
                       nil];
    
    // Set bounds
    gradient.frame = self.view.bounds;
    
    // Add the gradient to the view
    [self.view.layer insertSublayer:gradient atIndex:0];
    */
    
    /*UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Mom reading with baby - anglo.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.3];*/
    
    self.button1.cornerRadius = 10.0;
    self.button1.shadowHeight = self.button1.frame.size.height * 0.17;
    [self.button1 setTitle:@"What is BB3?" forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(whatIsBB3Pressed) forControlEvents:UIControlEventTouchUpInside];
    self.button1.buttonColor = [UIColor ht_ashColor];
    self.button1.shadowColor = [UIColor ht_ashDarkColor];
    
    
    self.button2.cornerRadius = 10.0;
    self.button2.shadowHeight = self.button2.frame.size.height * 0.17;
    [self.button2 setTitle:@"What is Dashboard?" forState:UIControlStateNormal];
    [self.button2 addTarget:self action:@selector(whatIsDashboardPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button2.buttonColor = [UIColor ht_ashColor];
    self.button2.shadowColor = [UIColor ht_ashDarkColor];
    
    
    self.button3.cornerRadius = 10.0;
    self.button3.shadowHeight = self.button3.frame.size.height * 0.17;
    [self.button3 setTitle:@"How can I set goals?" forState:UIControlStateNormal];
    [self.button3 addTarget:self action:@selector(howToSetGoalsPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button3.buttonColor = [UIColor ht_mediumColor];
    self.button3.shadowColor = [UIColor ht_mediumDarkColor];
    
    
    [self.button4 setTitle:@"How do I earn points?" forState:UIControlStateNormal];
    [self.button4 addTarget:self action:@selector(howToEarnPointsPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button4.cornerRadius = 10.0;
    self.button4.shadowHeight = self.button4.frame.size.height * 0.17;
    self.button4.buttonColor = [UIColor ht_ashColor];
    self.button4.shadowColor = [UIColor ht_ashDarkColor];

    
    [self.button5 setTitle:@"How do I track points?" forState:UIControlStateNormal];
    [self.button5 addTarget:self action:@selector(howDoITrackPointsPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button5.cornerRadius = 10.0;
    self.button5.shadowHeight = self.button5.frame.size.height * 0.17;
    self.button5.buttonColor = [UIColor ht_ashColor];
    self.button5.shadowColor = [UIColor ht_ashDarkColor];
    
    
    [self.button6 setTitle:@"How to earn badges?" forState:UIControlStateNormal];
    [self.button6 addTarget:self action:@selector(HowToEarnBadgesPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button6.cornerRadius = 10.0;
    self.button6.shadowHeight = self.button6.frame.size.height * 0.17;
    self.button6.buttonColor = [UIColor ht_ashColor];
    self.button6.shadowColor = [UIColor ht_ashDarkColor];
    
    
    [self.button7 setTitle:@"How to change my password?" forState:UIControlStateNormal];
    [self.button7 addTarget:self action:@selector(changePasswordPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button7.cornerRadius = 10.0;
    self.button7.shadowHeight = self.button7.frame.size.height * 0.17;
    self.button7.buttonColor = [UIColor ht_bitterSweetColor];
    self.button7.shadowColor = [UIColor ht_bitterSweetDarkColor];
    
    [self.button8 setTitle:@"How to access Facebook page?" forState:UIControlStateNormal];
    [self.button8 addTarget:self action:@selector(howToAccessFBPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button8.cornerRadius = 10.0;
    self.button8.shadowHeight = self.button8.frame.size.height * 0.17;
    self.button8.buttonColor = [UIColor ht_lemonColor];
    self.button8.shadowColor = [UIColor ht_lemonDarkColor];
    
    
    [self.button9 setTitle:@"How can I view messages?" forState:UIControlStateNormal];
    [self.button9 addTarget:self action:@selector(howToViewMessagesPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button9.cornerRadius = 10.0;
    self.button9.shadowHeight = self.button9.frame.size.height * 0.17;
    
    
    
    [self.button10 setTitle:@"How to save favorite messages?" forState:UIControlStateNormal];
    [self.button10 addTarget:self action:@selector(saveFavoriteMessagesPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button10.cornerRadius = 10.0;
    self.button10.shadowHeight = self.button10.frame.size.height * 0.17;
    self.button10.buttonColor = [UIColor ht_mintColor];
    self.button10.shadowColor = [UIColor ht_mintDarkColor];
    
    
    
    [self.button11 setTitle:@"Other questions?" forState:UIControlStateNormal];
    [self.button11 addTarget:self action:@selector(otherQuestionsPressed) forControlEvents:UIControlEventTouchUpInside];
    self.button11.cornerRadius = 10.0;
    self.button11.shadowHeight = self.button11.frame.size.height * 0.17;
    self.button11.buttonColor = [UIColor ht_bitterSweetColor];
    self.button11.shadowColor = [UIColor ht_bitterSweetDarkColor];
    
    
    
    //Circular mint color button
    
    [super viewDidLoad];
}

-(void)whatIsBB3Pressed
{
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"What is BB3?";
    
    
        UIColor *darkOp =
        [UIColor whiteColor];
        UIColor *lightOp =
        [UIColor grayColor];
        
        // Create the gradient
        CAGradientLayer *gradient = [CAGradientLayer layer];
        
        // Set colors
        gradient.colors = [NSArray arrayWithObjects:
                           (id)lightOp.CGColor,
                           (id)darkOp.CGColor,
                           nil];
        
        // Set bounds
        gradient.frame = self.view.bounds;
        
        // Add the gradient to the view
        [uiViewController.view.layer insertSublayer:gradient atIndex:0];
    

    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    NSString *string1 = [[[[[[[[[[[@"The mission of Bright by Three (formerly Bright Beginnings) is to provide a bright beginning for all Colorado children by helping families support their children’s physical, emotional, and intellectual development during the critical first three years of life. You can find more information about Bright by Three and our other sponsors under “About Us” tab of this tabbar view. The Bright by Three app is designed to bring information about how you can help " stringByAppendingString: appDelegate.babyName] stringByAppendingString: @" "] stringByAppendingString: @"learn and develop directly to your phone several times per week. You will receive this information via messages that contain useful information and activities that you can engage in with "] stringByAppendingString :appDelegate.babyName] stringByAppendingString:@". You can set your own goals and earn badges and prizes for reading with your child and completing recommended activities.\n\n"] stringByAppendingString:@"The Bright by Three app is designed to bring information about how you can help "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"learn and develop directly to your phone several times per week. You will receive this information via messages that contain useful information and activities that you can engage in with "] stringByAppendingString: appDelegate.babyName]  stringByAppendingString: @". " ] stringByAppendingString: @"You can set your own goals and earn badges and prizes for reading with your child and completing recommended activities."];
    
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    textViewDetail1.text = string1;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:15]];
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    textViewDetail1.backgroundColor = [UIColor clearColor];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    

    
}

-(void)whatIsDashboardPressed
{

    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"What is Dashboard?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    
    NSString *string1 = @"The dashboard is the screen through which you can access many of the features of the BB3 app. Tap on the appropriate button to set your goals, log minutes, track points, view your badges, change your settings, or access the BB3 Facebook page.";
    
    
    //[self.navigationController pushViewController:uiViewController animated:YES];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    
}


-(void)howToSetGoalsPressed
{
    
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How can I set goals?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    NSString *string1 = [[[[[[[[@"Set your reading goals! Looking at books together is a great way to teach " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" new words and converse with "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@ ". Reading aloud at least 6 days per week helps to prepare children for school. Set your reading goals by selecting the number of days that you plan to read for at least 10 minutes with "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@". Challenge yourself to increase your goal every 2 weeks until you reading with "] stringByAppendingString: appDelegate.babyName] stringByAppendingString:@" at least 6 times per week."];
    
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}



-(void)howToEarnPointsPressed
{
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How do I earn points?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = [[[[[[[@"You earn points when you log your reading minutes and by completing challenges.\n\n" stringByAppendingString:@"Log the number of minutes that you read with "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" each day."] stringByAppendingString:@" For every minute of shared reading, you will earn 1 point.\n\n"] stringByAppendingString:@"Challenges will display in your message library once a week. These tasks are designated with a special icon. Once you have completed the challenge, you can tap the “We did it!” button at the bottom of the screen and 10 bonus points will be added to your total. You may also be invited to post a photo of you and "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" doing the activity for the opportunity to earn extra points."];
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}


-(void)howDoITrackPointsPressed
{
 
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How do I track points?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = [[@"The BB3 app automatically tracks points that you earn for reading aloud with " stringByAppendingString:appDelegate.babyName] stringByAppendingString: @" and completing challenges.Your point total will automatically update when you log minutes or earn challenge points. You can view your point total on the same screen where you log your minutes. You can earn badges and prizes for accumulating points. You can also view how you are doing compared with other users by tapping on the graph image. A progress bar will show you how close you are to meeting your weekly goal."];
    
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
}


-(void)HowToEarnBadgesPressed
{
    
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How to earn badges and prizes?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = [[@"Virtual badges will be awarded after you earn a pre-determined number of points. You can track the badges that you have earned by tapping on the badge button on the dashboard. Once you have earned a badge, a special notification screen will display. Badges can be shared with friends on Facebook by clicking on the upload image at the bottom of the  notification screen. For every 500 points you will be able to select a book for " stringByAppendingString:appDelegate.babyName] stringByAppendingString: @" which will be mailed to your home."];
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}



-(void)changePasswordPressed
{
    
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How to change my password?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = @"You can change your password and log in information (including your email address and user name) by tapping on the Settings button on the dashboard. You can also choose to “Like” the BB3 Facebook page if you did not already “Like” the BB3 Facebook page when you registered for the app.  When you “Like” the BB3 Facebook page you will receive messages and information from BB3 on your Facebook newsfeed.";
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
}



-(void)howToAccessFBPressed
{
 
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How to access the Facebook page?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = @"You can access the BB3 Facebook page by tapping on the Facebook button on your dashboard. This will take you to the BB3 Facebook page where you can read and comment on posts with information about early child development. You can receive posts from the BB3 Facebook page directly to your Facebook newsfeed if you “Like” the BB3 page when you register for the app or when you tap on the “Settings” button on your dashboard.";
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    //textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}



-(void)howToViewMessagesPressed
{
    
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How can I view messages?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = [[[[@"You will receive 3-4 messages per week in your message library. Messages will contain information about different ways that you can help " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" learn. When a new message is available, a notification will display on the BB3 app icon and your tab bar. Some messages will contain a video of a parent and child performing the activity. Often messages will also have helpful links that you can tap on for additional information to help you complete the activity.  Tap the “Why” button for more information about how the activity can help "] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@" learn. Tap on the camera to take a photo of your child performing the activity and share it on Facebook. You can also “rate” the message, save it as a favorite, or share it on Facebook. Once you receive a message it will be saved in the message library and you can view it at any time."];
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
 
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}



-(void)saveFavoriteMessagesPressed
{
    
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"How to save favorite messages?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = @"You can designate a message as favorite by tapping on the “Favorite” button on your text message screen. Once you have selected a message as a “favorite” it will be stored under your favorites tab.  This option allows you to access your favorite messages quickly and easily.  If no longer want a message in your favorites library, simply tap the “Remove favorite” button on the message screen under the favorites tab.";
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
}


-(void)otherQuestionsPressed
{
    
    //appDelegate.babyName = @"Nathan";
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialDetailsViewController"];
    
    uiViewController.title = @"Other questions?";
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    NSString *string1 = @"If you cannot find the answer to your question in this tutorial or you are having any problems with the app, simply tap the button below and send us your question. We will email a response within 24.";
    
    //<a href=mailto:agileehealth@gmail.com?subject=Question related to BB3&body=Question/comment
    
    UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    textViewDetail1.text = string1;
    textViewDetail1.textAlignment=NSTextAlignmentJustified;
    [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
    [textViewDetail1 sizeToFit];
    [textViewDetail1 setScrollEnabled:YES];
    [uiViewController.view addSubview:textViewDetail1];
    CGRect frame = textViewDetail1.frame;
    frame.size.height = textViewDetail1.contentSize.height;
    textViewDetail1.frame = frame;
    
    CGRect frame1 = CGRectMake(115, 220, 150, 40);
    HTPressableButton *contactusButton = [[HTPressableButton alloc] initWithFrame:frame1 buttonStyle:HTPressableButtonStyleRounded];
    [contactusButton setTitle:@"Contact Us" forState:UIControlStateNormal];
    [contactusButton addTarget:self action:@selector(contactUsPressed) forControlEvents:UIControlEventTouchUpInside];
    contactusButton.buttonColor = [UIColor ht_grapeFruitColor];
    contactusButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    
    [uiViewController.view addSubview:contactusButton];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Tutorial";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)contactUsPressed
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailComposer;
        NSString *emailTitle = @"Question on BB3";
        NSString *messageBody = @"TYPE YOUR QUESTION HERE.";
        mailComposer =[[MFMailComposeViewController alloc]init];
        mailComposer.mailComposeDelegate = self;
        NSArray *emailAddresses = [[NSArray alloc]initWithObjects:@"agileehealth@gmail.com", nil];
        [mailComposer setSubject:emailTitle];
        [mailComposer setMessageBody:messageBody isHTML:YES];
        [mailComposer setToRecipients:emailAddresses];
        [self presentModalViewController:mailComposer animated:YES];
        [self presentViewController:mailComposer animated:YES completion:nil];
        
    }
    else {
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please Set Up an email accout on your device first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
        
    }

}


@end