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
    NSMutableData *responseData;
    NSMutableData *receivedData;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    appDelegate.numberOfClicksDashboard++;
    
    self.title = @"Dashboard";
    
    [self.view addSubview:self.buttonsView];
    
    [self gettotalPointsInfo];
    [self getGoalsInfo];
    [self getBadgeInfo];
                                                                              
    
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"iStock_000019163656_Double.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.6];
    
    //[self.mainImage setImage:[UIImage imageNamed:@"baby with tongue out.jpg"]];
    
    
    self.setGoalsButton.cornerRadius = 10.0;
    self.setGoalsButton.shadowHeight = self.setGoalsButton.frame.size.height * 0.17;
    //[self.setGoalsButton setStyle:HTPressableButtonStyleCircular];
    self.setGoalsButton.buttonColor = [UIColor ht_grapeFruitColor];
    self.setGoalsButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    
    [self.setGoalsButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.setGoalsButton setTitle:@"Set Goals" forState:UIControlStateNormal];
    [self.setGoalsButton addTarget:self action:@selector(setGoalsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.facebookButton.cornerRadius = 10.0;
    self.facebookButton.shadowHeight = self.facebookButton.frame.size.height * 0.17;
    self.facebookButton.buttonColor = [UIColor ht_blueJeansColor];
    self.facebookButton.shadowColor = [UIColor ht_blueJeansDarkColor];
    [self.facebookButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.facebookButton setTitle:@"Facebook" forState:UIControlStateNormal];
    [self.facebookButton addTarget:self action:@selector(visitBBFBPagePressed) forControlEvents:UIControlEventTouchUpInside];
  
    
    self.logMinutesButton.cornerRadius = 10.0;
    self.logMinutesButton.shadowHeight = self.logMinutesButton.frame.size.height * 0.17;
    self.logMinutesButton.buttonColor = [UIColor ht_mintColor];
    self.logMinutesButton.shadowColor = [UIColor ht_mintDarkColor];
    [self.logMinutesButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.logMinutesButton setTitle:@"Log Minutes" forState:UIControlStateNormal];
    [self.logMinutesButton addTarget:self action:@selector(logMinutesPressed) forControlEvents:UIControlEventTouchUpInside];
   
    
    self.networkButton.cornerRadius = 10.0;
    self.networkButton.shadowHeight = self.networkButton.frame.size.height * 0.17;
    self.networkButton.buttonColor = [UIColor ht_carrotColor];
    self.networkButton.shadowColor = [UIColor ht_pumpkinColor];
    [self.networkButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.networkButton setTitle:@"Network" forState:UIControlStateNormal];
    [self.networkButton addTarget:self action:@selector(displayNetworkPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.badgesButton.cornerRadius = 10.0;
    self.badgesButton.shadowHeight = self.badgesButton.frame.size.height * 0.17;
    //[self.badgesButton setStyle:HTPressableButtonStyleCircular];
    [self.badgesButton setTitle:@"My Badges" forState:UIControlStateNormal];
    self.badgesButton.buttonColor = [UIColor ht_sunflowerColor];
    self.badgesButton.shadowColor = [UIColor ht_citrusColor];
    [self.badgesButton addTarget:self action:@selector(showBadgesPressed) forControlEvents:UIControlEventTouchUpInside];
    
    if (appDelegate.newBadgeNotification > 0) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        
        localNotification.applicationIconBadgeNumber = 1;// set here the value of badge
        
        
        
        //NSLog(@"still over 0: %d", appDelegate.numberOfUnreadMessages);
        JSBadgeView *badgeView = [[JSBadgeView alloc] initWithParentView:self.badgesButton alignment:JSBadgeViewAlignmentTopRight];
        badgeView.badgeText = [NSString stringWithFormat:@"%d", appDelegate.newBadgeNotification];
        badgeView.tag = 10;
    }
    else {
        [[self.badgesButton viewWithTag:10] removeFromSuperview];
    }

    
    
    
    [self.centralImage setImage:[UIImage imageNamed:@"Toddler on grass.jpg"]];
    self.centralImage.layer.cornerRadius = self.centralImage.frame.size.width / 2;
    self.centralImage.clipsToBounds = YES;
    
    self.centralImage.layer.borderWidth = 3.0f;
    self.centralImage.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.messagesButton.cornerRadius = 10.0;
    self.messagesButton.shadowHeight = self.messagesButton.frame.size.height * 0.17;
    //[self.messagesButton setStyle:HTPressableButtonStyleCircular];
    self.messagesButton.buttonColor = [UIColor ht_mintColor];
    self.messagesButton.shadowColor = [UIColor ht_mintDarkColor];
    [self.messagesButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [self.messagesButton setTitle:@"Messages" forState:UIControlStateNormal];
    [self.messagesButton addTarget:self action:@selector(loadMessagesLibraryPressed) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:self.messagesButton];
    //[self updateBadge];
    
    if (appDelegate.numberOfUnreadMessages > 0) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        
        localNotification.applicationIconBadgeNumber = 1;// set here the value of badge
        
        
        
        NSLog(@"still over 0: %d", appDelegate.numberOfUnreadMessages);
        JSBadgeView *badgeView = [[JSBadgeView alloc] initWithParentView:self.messagesButton alignment:JSBadgeViewAlignmentTopRight];
        badgeView.badgeText = [NSString stringWithFormat:@"%d", appDelegate.numberOfUnreadMessages];
        badgeView.tag = 10;
    }
    else {
        [[self.messagesButton viewWithTag:10] removeFromSuperview];
    }
    
}

-(void)setGoalsPressed
{
    appDelegate.numberOfClicksSetGoals++;
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"goalsViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
}

-(void)showBadgesPressed
{
    appDelegate.numberOfClicksBadges++;
    
    [self getBadgeInfo];
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"badgeViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    
}

-(void)displayNetworkPressed
{
    appDelegate.numberOfClicksNetwork++;
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"networkViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    
}

-(void)logMinutesPressed
{
 
    appDelegate.numberOfClicksLogMinutes++;

    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"logMinutesController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Dashboard";
}

-(void)visitBBFBPagePressed
{
    appDelegate.numberOfClicksFacebookPage = appDelegate.numberOfClicksFacebookPage + 1;
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
    appDelegate.numberOfClicksMessages++;
    
    UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"libraryViewController"];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Dashboard";
    //[barButton setImage:[UIImage imageNamed:@"81-dashboard.png"]];
    
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    [self.navigationController pushViewController:uiViewController animated:YES];
}

-(void) gettotalPointsInfo
{
    NSString *url = [[appDelegate.urlToNodeJs stringByAppendingString:@"/totalPointsInfo/"] stringByAppendingString:appDelegate.userID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        //return nil;
    }
    

    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@", res);
    
    //NSLog(@"points info: %@", res);
    
    for (id key in res) {
    
            for (id key1 in key) {
                if ([key1 isEqualToString:@"totalPoints"]) {
                    appDelegate.totalPoints = [[key objectForKey:key1] intValue];
                    NSLog(@"total points is: %d", appDelegate.totalPoints);
                    break;
                }
            }
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    receivedData = nil;
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}



- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a property elsewhere
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[receivedData length]);
    
    NSLog(@"received data: %@", receivedData);
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@", res);
    if (res == NULL) {
        NSLog(@"well! there you go!");
    }
    else {
        
        for (id key in res) {
            
            if ([key count] > 3 )
            {
                for (id key1 in key) {
                    if ([key1 isEqualToString:@"daysPerWeek"]) {
                        NSLog(@"goals info\n");
                        //NSLog(@"days per week is: %d", [[key objectAtIndex:key1] intValue]);
                        //NSLog(@"minutes per day is: %@", [[key objectAtIndex:key1] intValue]);
                    }
                }
            }
            
            else if ([key count] == 3)
            {
                
                for (id key1 in key) {
                    if ([key1 isEqualToString:@"totalPoints"]) {
                        appDelegate.totalPoints = [[key objectForKey:key1] intValue];
                        NSLog(@"total points is: %d", appDelegate.totalPoints);
                        break;
                    }
                    else if ([key1 isEqualToString:@"badgeToEarn"]) {
                        NSLog(@"found badge info: %@", [key objectForKey:key1]);
                        appDelegate.nextBadgeToEarn = [[key objectForKey:key1] intValue];
                        NSLog(@"badge to earn is : %d", appDelegate.nextBadgeToEarn);
                        break;
                    }
                }
                
            }
        }
               
    }
    
    receivedData = nil;
}


-(void) getGoalsInfo
{
    
    NSString *url = [[appDelegate.urlToNodeJs stringByAppendingString:@"/goalsInfo/"] stringByAppendingString:appDelegate.userID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        //return nil;
    }
    
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@", res);
    
    //NSLog(@"points info: %@", res);
    
    for (id key in res) {
        
        for (id key1 in key) {
            if ([key1 isEqualToString:@"daysPerWeek"]) {
                //appDelegate.totalPoints = [[key objectForKey:key1] intValue];
                //NSLog(@"total points is: %d", appDelegate.totalPoints);
                //break;
            }
        }
    }
}


-(void) getBadgeInfo
{
    NSString *url = [[appDelegate.urlToNodeJs stringByAppendingString:@"/badgeInfo/"] stringByAppendingString:appDelegate.userID];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        //return nil;
    }
    
    
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@", res);
    
    for (id key in res) {
        
        for (id key1 in key) {
            if ([key1 isEqualToString:@"badgeToEarn"]) {
                appDelegate.nextBadgeToEarn = [[key objectForKey:key1] intValue];
                NSLog(@"badge to earn is: %d", appDelegate.nextBadgeToEarn);
                break;
            }
        }
    }
}



@end