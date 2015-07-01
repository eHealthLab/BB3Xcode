//
//  badgeViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/17/15.
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
#import "badgeViewController.h"
#import "AppDelegate.h"
@implementation badgeViewController
{
    AppDelegate *appDelegate;
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [_badgeView setScrollEnabled:YES];
    [_badgeView setContentSize:CGSizeMake(320,700)];
    
}

-(void)viewDidLoad
{
    
    [_badgeView setScrollEnabled:YES];
    [_badgeView setContentSize:CGSizeMake(320,400)];
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.title = @"Badges";
    appDelegate.totalPoints = 870;
    
    _badgeImagesArray = [[NSMutableArray alloc] initWithObjects:@"Badge150.png", @"Badge400.png", @"Badge700.png", @"Badge1000.png", @"Badge1500.png", @"Badge2000.png", @"Badge2500.png", @"Badge3000.png", @"Badge3500.png", @"Badge4000.png", @"Badge4500.png", @"Badge5000", nil];
    
    //NSInteger _badgePointsArray[12] = {150, 400, 700, 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000};
    
    
    //[[NSMutableArray alloc] initWithObjects:@"150", @"400", @"700", @"1000", @"1500", @"2000", @"2500", @"3000", @"3500", @"4000", @"4500", @"5000", nil];
    
    _badgeNamesArray = [[NSMutableArray alloc] initWithObjects:@"badge1", @"badge2", @"badge3", @"badge4", @"badge5", @"badge6", @"badge7", @"badge8", @"badge9", @"badge10", @"badge11", nil];
    
    UIImageView *badge1 =[[UIImageView alloc] initWithFrame:CGRectMake(10,10,150,150)];
    badge1.image=[UIImage imageNamed:@"Badge150.png"];
    
    
    UIImageView *badge2 =[[UIImageView alloc] initWithFrame:CGRectMake(150,10,150,150)];
    badge2.image=[UIImage imageNamed:@"Badge400.png"];
    
    
    UIImageView *badge3 =[[UIImageView alloc] initWithFrame:CGRectMake(10,100,150,150)];
    badge3.image=[UIImage imageNamed:@"Badge700.png"];
    
    
    UIImageView *badge4 =[[UIImageView alloc] initWithFrame:CGRectMake(150,100,150,150)];
    badge4.image=[UIImage imageNamed:@"Badge1000.png"];
    
    
    UIImageView *badge5 =[[UIImageView alloc] initWithFrame:CGRectMake(10,200,150,150)];
    badge5.image=[UIImage imageNamed:@"Badge1500.png"];
    
    
    UIImageView *badge6 =[[UIImageView alloc] initWithFrame:CGRectMake(150,200,150,150)];
    badge6.image=[UIImage imageNamed:@"Badge2000.png"];
    
    
    UIImageView *badge7 =[[UIImageView alloc] initWithFrame:CGRectMake(10,300,150,150)];
    badge7.image=[UIImage imageNamed:@"Badge2500.png"];
    
    
    UIImageView *badge8 =[[UIImageView alloc] initWithFrame:CGRectMake(150,300,150,150)];
    badge8.image=[UIImage imageNamed:@"Badge3000.png"];
    
    
    UIImageView *badge9 =[[UIImageView alloc] initWithFrame:CGRectMake(10,400,150,150)];
    badge9.image=[UIImage imageNamed:@"Badge3500.png"];
    
    
    UIImageView *badge10 =[[UIImageView alloc] initWithFrame:CGRectMake(150,400,150,150)];
    badge10.image=[UIImage imageNamed:@"Badge4000.png"];
    
    
    UIImageView *badge11 =[[UIImageView alloc] initWithFrame:CGRectMake(10,500,150,150)];
    badge11.image=[UIImage imageNamed:@"Badge4500.png"];
    
    
    UIImageView *badge12 =[[UIImageView alloc] initWithFrame:CGRectMake(150,500,150,150)];
    badge12.image=[UIImage imageNamed:@"Badge5000.png"];
    
    
    if (appDelegate.totalPoints > 150)
    {
        [_badgeView addSubview:badge1];
        if (appDelegate.totalPoints > 400) {
            [_badgeView addSubview:badge2];
            if (appDelegate.totalPoints > 700) {
                [_badgeView addSubview:badge3];
                if (appDelegate.totalPoints > 1000) {
                    [_badgeView addSubview:badge4];
                    if (appDelegate.totalPoints > 1500) {
                        [_badgeView addSubview:badge5];
                        if (appDelegate.totalPoints > 2000) {
                            [_badgeView addSubview:badge6];
                            if (appDelegate.totalPoints > 2500) {
                                [_badgeView addSubview:badge7];
                                if (appDelegate.totalPoints > 3000) {
                                    [_badgeView addSubview:badge8];
                                    if (appDelegate.totalPoints > 3500) {
                                        [_badgeView addSubview:badge9];
                                        if (appDelegate.totalPoints > 4000) {
                                            [_badgeView addSubview:badge10];
                                            if (appDelegate.totalPoints > 4500) {
                                                [_badgeView addSubview:badge11];
                                                if (appDelegate.totalPoints > 5000) {
                                                    [_badgeView addSubview:badge12];
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    /*for (int i=0; i < 12; i++) {
        if (appDelegate.totalPoints > (int)_badgePointsArray[i])
            ;
        [_badgeView addSubview:badge1];
            //[_badgeView addSubview:_badgeNamesArray[i]];
    }*/
    
    
}


@end