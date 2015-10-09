//
//  dashboard.m
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
#import "dashboard.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"


@implementation Dashboard
{
    AppDelegate *appDelegate;
    NSMutableData *responseData;
    NSMutableData *receivedData;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    NSLog(@"the view loads\n");
    
    [self.menuButton setImage:[[UIImage imageNamed:@"menu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //appDelegate.firstName = @"MARY";
    self.title = [@"Welcome " stringByAppendingString:appDelegate.firstName];
    
    NSString *string1 = [[@"Welcome to BB3! Over the coming months you will be receiving messages with ideas to promote " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"'s brain development"];
    
    appDelegate.currentImageView = @"BB3_AbousUs.png";
    appDelegate.currentMessageContent = string1;
    appDelegate.currentMessageTitle = @"Welcome to BB3";
    appDelegate.currentVideoLink = @"";
    
    
    [self gettotalPointsInfo];
    [self getGoalsInfo];
    [self getBadgeInfo];
    
    //[self reloadInputViews];

}

/*-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}*/

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (IBAction)selectionContainer2Made:(id)sender {
 
    int choice = (int)self.goalsSegment.selectedSegmentIndex;
    switch (choice) {
        case 0:
        {
            //NSLog(@"existing user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"progress"];
            vc1.view.frame = self.container2.bounds;
            [self.container2 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            
            break;
        }
        case 1:
        {
            //NSLog(@"new user\n");
            UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"dailyGoals"];
            vc1.view.frame = self.container2.bounds;
            [self.container2 addSubview:vc1.view];
            [self addChildViewController:vc1];
            [vc1 didMoveToParentViewController:self];
            break;
        }
        default:
            break;
    }
    
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
            if ([key1 isEqualToString:@"minutesPerDay"]) {
                appDelegate.dailyPointsGoals = [[key objectForKey:key1] intValue];
                NSLog(@"dailyPointsGoals: %d", appDelegate.dailyPointsGoals);
                //break;
            }
            else if ([key1 isEqualToString:@"daysPerWeek"]) {
                int days = [[key objectForKey:key1] intValue];
                appDelegate.weeklyPointsGoals = appDelegate.dailyPointsGoals * days;
                NSLog(@"weeklyPointsGoals: %d", appDelegate.weeklyPointsGoals);
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