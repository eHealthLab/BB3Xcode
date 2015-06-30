//
//  AppDelegate.h
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


#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) NSString *userEmail;
@property(strong, nonatomic) NSString *userPassword;
@property(strong, nonatomic) NSString *firstName;
@property(strong, nonatomic) NSString *lastName;
@property(strong, nonatomic) NSString *phoneNumber;
@property(strong, nonatomic) NSMutableArray *badgesArray;
@property(strong, nonatomic) NSMutableArray *goalsArray;
@property(strong, nonatomic) NSString *babyName;
@property(strong, nonatomic) NSDate *babyDOB;
@property(strong, nonatomic) NSString *babyGender;
@property(strong, nonatomic) NSString *zipcode;
@property(strong, nonatomic) NSString *loginStatus;
@property(assign, nonatomic) int minutesComponent;
@property(assign, nonatomic) int goalsMinutesComponent;
@property(assign, nonatomic) int goalsDaysComponent;
@property(strong, nonatomic) NSString *profilePicture;

@end

