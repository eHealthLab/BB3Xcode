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
@property(strong, nonatomic) NSString *babyDOB;
@property(strong, nonatomic) NSString *babyGender;
@property(strong, nonatomic) NSString *zipcode;
@property(strong, nonatomic) NSString *loginStatus;
@property(assign, nonatomic) int minutesComponent;
@property(strong, nonatomic) NSString *goalsMinutesComponent;
@property(strong, nonatomic) NSString *goalsDaysComponent;
@property(strong, nonatomic) NSString *profilePicture;

@property(strong, nonatomic) NSString *userID;
@property(assign, nonatomic) int nextBadgeToEarn;

@property(strong, nonatomic) NSMutableArray *messagesLibrary;
@property(strong, nonatomic) NSMutableArray *favoriteMessagesLibrary;

@property(strong, nonatomic) NSMutableArray *messagesSubjectLibrary;
@property(strong, nonatomic) NSMutableArray *messagesImagesLibrary;
@property(strong, nonatomic) NSMutableArray *messagesVideosLibrary;
@property(strong, nonatomic) NSMutableArray *messagesRatingLibrary;
@property(strong, nonatomic) NSMutableArray *messagesReadStatusLibrary;
@property(strong, nonatomic) NSMutableArray *messageResponseLibrary;

@property(strong, nonatomic) NSMutableArray *favoriteMessagesSubjectLibrary;
@property(strong, nonatomic) NSMutableArray *favoriteMessagesImagesLibrary;
@property(strong, nonatomic) NSMutableArray *favoriteMessagesVideosLibrary;

@property(strong, nonatomic) NSMutableArray *quizMessage;

@property(strong, nonatomic) NSString *currentImageView;
@property(strong, nonatomic) NSString *currentMessageContent;
@property(strong, nonatomic) NSString *currentVideoLink;
@property(assign, nonatomic) int currentMessageIndex;

@property(assign, nonatomic) int numberOfDaysEnrolled;
@property(assign, nonatomic) int numberOfUnreadMessages;
@property(assign, nonatomic) int newBadgeNotification;

@property(assign, nonatomic) int totalPoints;
@property(assign, nonatomic) int newPoints;

@property(assign, nonatomic) int numberOfClicksSetGoals;
@property(assign, nonatomic) int numberOfClicksFacebookPage;
@property(assign, nonatomic) int numberOfClicksLogMinutes;
@property(assign, nonatomic) int numberOfClicksNetwork;
@property(assign, nonatomic) int numberOfClicksBadges;
@property(assign, nonatomic) int numberOfClicksMessages;
@property(assign, nonatomic) int numberOfClicksSettings;
@property(assign, nonatomic) int numberOfClicksMyAccount;
@property(assign, nonatomic) int numberOfClicksDashboard;
@property(assign, nonatomic) int numberOfClicksTutorial;
@property(assign, nonatomic) int numberOfClicksAboutUs;

@property(strong, nonatomic) NSString *urlToNodeJs;



@end

