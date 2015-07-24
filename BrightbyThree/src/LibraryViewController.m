//
//  LibraryViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LibraryViewController.h"
#import "AppDelegate.h"

@implementation LibraryViewController
{
    AppDelegate *appDelegate;
    NSMutableArray *tableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"init messages\n");
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    appDelegate.messagesSubjectLibrary = [NSMutableArray arrayWithObjects:@"Welcome", nil];
    [appDelegate.messagesSubjectLibrary addObject:@"Child's Best Teacher"];
    
    NSString *string1 = [[@"Welcome to BB3! Over hte coming months you will be receiving messages with ideas to promote " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"'s brain development"];
    NSString *string2 = [[@"True or False? 80% of " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"'s brain development will occur in the first three years of life."];
    
    
    appDelegate.messagesLibrary = [NSMutableArray arrayWithObjects:string1, string2, nil];
   
    
    appDelegate.messagesImagesLibrary = [NSMutableArray arrayWithObjects:@"BB3_AboutUs.png", nil];
    [appDelegate.messagesImagesLibrary addObject:@"Baby with tongue out.jpg"];
    
    
    appDelegate.messagesVideosLibrary = [NSMutableArray arrayWithObjects:@"linkForVideo1", nil];
    [appDelegate.messagesVideosLibrary addObject:@"linkForVideo2"];
    
    appDelegate.quizMessage = [NSMutableArray arrayWithObjects:@"0", @"1", nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"number of rows is: %lu\n", (unsigned long)[appDelegate.messagesSubjectLibrary count]);
    return [appDelegate.messagesSubjectLibrary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
   // NSLog(@"data is: %@\n", [appDelegate.messagesSubjectLibrary objectAtIndex:indexPath.row]);
    
    cell.textLabel.text = [appDelegate.messagesSubjectLibrary objectAtIndex:indexPath.row];
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
    
    uiViewController.title = [appDelegate.messagesSubjectLibrary objectAtIndex:indexPath.row];
    
    appDelegate.currentMessageContent = [appDelegate.messagesLibrary objectAtIndex:indexPath.row];
    
    appDelegate.currentImageView = [appDelegate.messagesImagesLibrary objectAtIndex:indexPath.row];
    
    appDelegate.currentVideoLink = [appDelegate.messagesVideosLibrary objectAtIndex:indexPath.row];
    
    appDelegate.currentMessageIndex = (int)indexPath.row;
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
}


@end
