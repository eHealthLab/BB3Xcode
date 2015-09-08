//
//  SlideMenu.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/7/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideMenu.h"
#import "AppDelegate.h"

@implementation SlideMenu
{
    AppDelegate *appDelegate;
    NSMutableArray *tableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray = [NSMutableArray arrayWithObjects: @" ", @"My Account", @"Messages", @"About BrightbyThree", @"Contact Us", @"Private Policy", @"Sign Out", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0 && indexPath.row == 0) {
        return 65.0;
    }
    
    return 65.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
        UIFont *myFont = [ UIFont systemFontOfSize:18.0];
    cell.textLabel.font = myFont;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.backgroundColor = [UIColor grayColor];
    //cell.imageView.image = [UIImage imageNamed:@"Toddler on grass.jpg"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [tableData removeObjectAtIndex:indexPath.row];
    
    // Request table view to reload
    [tableView reloadData];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *uiViewController;
    if (indexPath.row == 1) {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"accountViewController"];
    }
    else if (indexPath.row == 2)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"libraryViewController"];
    }
    
    else if (indexPath.row == 3)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutUs"];
    }
    
    else if (indexPath.row == 4)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contactUs"];
    }
    else if (indexPath.row == 5)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"privacyPolicy"];
    }
    else {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"logOut"];
    }
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    //[tableView reloadData];
    
}


@end

