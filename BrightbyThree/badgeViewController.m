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


-(void)viewDidLoad
{
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.title = @"Badges";
    appDelegate.totalPoints = 170;
    
    _badgeImagesArray = [[NSMutableArray alloc] initWithObjects:@"Badge150.png", @"Badge400.png", @"Badge700.png", @"Badge1000.png", @"Badge1500.png", @"Badge2000.png", @"Badge2500.png", @"Badge3000.png", @"Badge3500.png", @"Badge4000.png", @"Badge4500.png", @"Badge5000", nil];
    
    if (appDelegate.totalPoints > 150 && appDelegate.totalPoints < 400 ) {
        UIImageView *image =[[UIImageView alloc] initWithFrame:CGRectMake(50,300,300,150)];
        image.image=[UIImage imageNamed:@"Badge150.png"];
        [self.view addSubview:image];
    }

}


@end