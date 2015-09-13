//
//  AppDelegate.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/6/15.
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


#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)initProfile
{
    self.babyName=@"";
    self.profilePicture = @"";
    _firstName = @"";
    _lastName = @"";
    _userEmail = @"";
    _userPassword = @"";
    _babyGender = @"";
    _babyDOB = @"";
    _phoneNumber = @"";
    _zipcode = @"";
    _goalsDaysComponent = @"2";
    _goalsMinutesComponent = @"10";
    _userID = @"";
    self.nextBadgeToEarn = 0;
    
    self.badgesArray = [[NSMutableArray alloc] initWithObjects:@"150", @"400", @"700", @"1000", @"1500", @"2000", @"2500", @"3000", @"3500", @"4000", @"4500", @"5000", nil];
    
    self.numberOfDaysEnrolled = 0;

    self.numberOfClicksSettings=0;
    self.numberOfClicksMyAccount=0;
    
    self.numberOfClicksDashboard=0;
    self.numberOfClicksTutorial=0;
    self.numberOfClicksAboutUs=0;
    
    self.numberOfClicksSetGoals=0;
    self.numberOfClicksBadges=0;
    self.numberOfClicksFacebookPage=0;
    self.numberOfClicksLogMinutes=0;
    self.numberOfClicksMessages=0;
    self.numberOfClicksNetwork=0;
    self.numberOfUnreadMessages=1;
    self.newBadgeNotification=0;
    //self.urlToNodeJs = @"http://localhost:3000";
    self.urlToNodeJs = @"http://cbb.ucdenver.edu:3000";
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //self.urlToNodeJs = @"http://localhost:3000";
    self.urlToNodeJs = @"http://cbb.ucdenver.edu:3000";
    _goalsDaysComponent = @"2";
    _goalsMinutesComponent = @"10";
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    
    self.firstName = [prefs objectForKey:@"firstName"];
    self.lastName = [prefs objectForKey:@"lastName"];
    self.userEmail = [prefs objectForKey:@"email"];
    self.userPassword = [prefs objectForKey:@"password"];
    self.babyName = [prefs objectForKey:@"babyName"];
    self.babyDOB = [prefs objectForKey:@"babyDOB"];
    self.babyGender = [prefs objectForKey:@"babyGender"];
    self.phoneNumber = [prefs objectForKey:@"phoneNumber"];
    self.zipcode = [prefs objectForKey:@"zipcode"];
    
    
    self.numberOfUnreadMessages=1;
    
    return YES;
    
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:self.firstName forKey:@"firstName"];
    [prefs setObject:self.lastName forKey:@"lastName"];
    [prefs setObject:self.userEmail forKey:@"email"];
    [prefs setObject:self.userPassword forKey:@"password"];
    [prefs setObject:self.babyName forKey:@"babyName"];
    [prefs setObject:self.babyDOB forKey:@"babyDOB"];
    [prefs setObject:self.babyGender forKey:@"babyGender"];
    [prefs setObject:self.phoneNumber forKey:@"phoneNumber"];
    [prefs setObject:self.zipcode forKey:@"zipcode"];
    NSLog(@"inside log in: phone number is: %@", self.phoneNumber);
    
    [prefs synchronize];
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
