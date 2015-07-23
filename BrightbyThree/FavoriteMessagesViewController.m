//
//  FavoriteMessagesViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteMessagesViewController.h"
#import "AppDelegate.h"

@implementation FavoriteMessagesViewController
{
    AppDelegate *appDelegate;
    NSMutableArray *tableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"init messages\n");
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"number of rows is: %lu\n", (unsigned long)[appDelegate.favoriteMessagesSubjectLibrary count]);
    NSLog(@"the contents are: %@\n", [appDelegate.favoriteMessagesSubjectLibrary objectAtIndex:0]);
    return [appDelegate.favoriteMessagesSubjectLibrary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSLog(@"data is: %@\n", [appDelegate.favoriteMessagesSubjectLibrary objectAtIndex:indexPath.row]);
    
    cell.textLabel.text = [appDelegate.favoriteMessagesSubjectLibrary objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.imageView.image = [UIImage imageNamed:@"Mom reading with baby - anglo.jpg"];
    
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
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"textDetailsViewController"];
    
    uiViewController.title = [appDelegate.favoriteMessagesSubjectLibrary objectAtIndex:indexPath.row];
    
    appDelegate.currentMessageContent = [appDelegate.favoriteMessagesLibrary objectAtIndex:indexPath.row];
    
    appDelegate.currentImageView = [appDelegate.favoriteMessagesImagesLibrary objectAtIndex:indexPath.row];
    
    appDelegate.currentVideoLink = [appDelegate.favoriteMessagesVideosLibrary objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
}



@end