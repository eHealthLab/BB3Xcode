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
#import "DKCircleButton.h"

@implementation Dashboard
{
    AppDelegate *appDelegate;
}

@synthesize sectionArray;
@synthesize numberOfRows;
@synthesize dashboardTableView;

-(IBAction)showPopOver {
    NSLog(@"inside show pop");
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:popoverView];
    [pop setDelegate:self];
    [pop presentPopoverFromRect:login.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    UIButton* fakeButton = (UIButton *) [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BB3_logo-icon_WEB_rgb_28x28.png"]];
    UIBarButtonItem *fakeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:fakeButton];
    self.navigationItem.rightBarButtonItem = fakeButtonItem;
}

-(void) viewDidLoad
{
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    self.title = @"Dashboard";
    [self.navigationItem setHidesBackButton:YES];
    
    appDelegate.messagesReadStatusLibrary = [NSMutableArray arrayWithObjects:@"0", @"0", nil];
    
    [super viewDidLoad];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionArray count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setLocale:[NSLocale currentLocale]];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *numOfRows = [numberOfRows objectAtIndex:section];
    NSNumber *tempNum = [f numberFromString:numOfRows];
    return  [tempNum intValue];
}

-(void) loadView {
    
    //Circular mint color button
    /*CGRect frame = CGRectMake(110, 300, 100, 100);
    HTPressableButton *circularButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleCircular];
    circularButton.buttonColor = [UIColor ht_mintColor];
    circularButton.shadowColor = [UIColor ht_mintDarkColor];
    [circularButton setDisabledButtonColor:[UIColor ht_sunflowerColor]];
    [circularButton setTitle:@"Circular" forState:UIControlStateNormal];
    [self.view addSubview:circularButton];*/
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.sectionArray = [[NSMutableArray alloc] initWithCapacity:2];
    self.numberOfRows = [[NSMutableArray alloc] initWithCapacity:2];
    [sectionArray addObject:@"Dashboard"];
    [sectionArray addObject:@"Child Information"];
    [sectionArray addObject:@"Demographics"];
    
    [numberOfRows addObject:@"5"];
    [numberOfRows addObject:@"3"];
    [numberOfRows addObject:@"2"];
    
    [dashboardTableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [dashboardTableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
    
    [dashboardTableView insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
    
    [tableView reloadData];
    
    self.view = tableView;
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"inside the table function");
    
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    //Step 2:
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        cell.imageView.image=[UIImage imageNamed:@"messages.jpeg"];
        
        UILabel *library = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 30.0, 150.0, 30.0)];
        library.font = [UIFont boldSystemFontOfSize:22.0];
        library.text = @"BB3 Library";
        library.textAlignment = NSTextAlignmentLeft;
        library.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:library];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        [cell setBackgroundColor:[UIColor lightGrayColor]];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        cell.imageView.image=[UIImage imageNamed:@"setGoals.png"];
        
        UILabel *goals = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 10.0, 150.0, 30.0)];
        goals.font = [UIFont boldSystemFontOfSize:22.0];
        goals.text = @"Current Goal";
        goals.textAlignment = NSTextAlignmentLeft;
        goals.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:goals];
        //cell.backgroundColor = [UIColor grayColor];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        cell.imageView.image=[UIImage imageNamed:@"badges.png"];
        
        UILabel *badges = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 10.0, 150.0, 30.0)];
        badges.font = [UIFont boldSystemFontOfSize:22.0];
        badges.text = @"Current Badge";
        badges.textAlignment = NSTextAlignmentLeft;
        badges.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:badges];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 3) {
        
        cell.imageView.image = [UIImage imageNamed:@"setGoals.png"];
        
        
        UILabel *minutes = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 10.0, 150.0, 30.0)];
        minutes.font = [UIFont boldSystemFontOfSize:22.0];
        minutes.text = @"Log Minutes";
        minutes.textAlignment = NSTextAlignmentLeft;
        minutes.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:minutes];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    }
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        
        
        cell.imageView.image = [UIImage imageNamed:@"badges.png"];
        
        UILabel *network = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 10.0, 150.0, 30.0)];
        network.font = [UIFont boldSystemFontOfSize:22.0];
        network.text = @"Network";
        network.textAlignment = NSTextAlignmentLeft;
        network.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:network];
        [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"inside row at index");
    return 75.0;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        if(indexPath.row == 0)
        {
            UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorialViewController"];
            [self.navigationController pushViewController:uiViewController animated:YES];
            //UITableViewCell *tb = [tableView cellForRowAtIndexPath:indexPath];
        }
    else if (indexPath.row == 1)
    {
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"goalsViewController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        //UITableViewCell *tb = [tableView cellForRowAtIndexPath:indexPath];
    }
    else if (indexPath.row == 2) {
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"badgeViewController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        
        
    }
   
 else if (indexPath.row == 3) {
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"logMinutesController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
    }
    
    else if (indexPath.row == 4) {
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"networkViewController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
    }

}


    
@end