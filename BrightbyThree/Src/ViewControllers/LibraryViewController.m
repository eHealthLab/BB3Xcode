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
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    // send http request to get messages
    
    /*NSString *url = [@"http://localhost:3000/messages/" stringByAppendingString:appDelegate.userID];
    NSLog(@"login url is: %@\n", url);
    
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
    else {
        NSError *myError = nil;
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingMutableLeaves error:&myError];
        NSLog(@"%@", res);
        
     
        for (id key in res) {
            
            for (id key1 in key) {
                if ([key1 isEqualToString:@"ID"]) {
                    int id = [[key objectForKey:key1] intValue];
                    appDelegate.userID = [NSString stringWithFormat:@"%d", id];
                    NSLog(@"User Id is: %@", appDelegate.userID);
                    break;
                }
            }
        }
    }*/
    
    
    NSLog(@"init messages\n");
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    appDelegate.messagesSubjectLibrary = [NSMutableArray arrayWithObjects:@"Welcome", nil];
    [appDelegate.messagesSubjectLibrary addObject:@"Child's Best Teacher"];
    
    NSString *string1 = [[@"Welcome to BB3! Over the coming months you will be receiving messages with ideas to promote " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"'s brain development"];
    NSString *string2 = [[@"True or False? 80% of " stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"'s brain development will occur in the first three years of life."];
    
    
    appDelegate.messagesLibrary = [NSMutableArray arrayWithObjects:string1, string2, nil];
   
    
    appDelegate.messagesImagesLibrary = [NSMutableArray arrayWithObjects:@"Mom reading with baby - anglo.jpg", nil];
    [appDelegate.messagesImagesLibrary addObject:@"Baby with tongue out.jpg"];
    
    
    appDelegate.messagesVideosLibrary = [NSMutableArray arrayWithObjects:@"linkForVideo1", nil];
    [appDelegate.messagesVideosLibrary addObject:@" "];
    
    appDelegate.quizMessage = [NSMutableArray arrayWithObjects:@"0", @"1", nil];
    
    appDelegate.messagesRatingLibrary = [NSMutableArray arrayWithObjects:@"0", @"0", nil];
    
    appDelegate.messageResponseLibrary = [NSMutableArray arrayWithObjects:@"", @"", nil];
    
    appDelegate.messagesReadStatusLibrary = [NSMutableArray arrayWithObjects:@"0", @"1", nil];

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
    
   // NSLog(@"data is: %@\n", [appDelegate.messagesSubjectLibrary objectAtIndex:indexPath.row]);
    
    cell.textLabel.text = [appDelegate.messagesSubjectLibrary objectAtIndex:indexPath.row];
    if ([appDelegate.messagesReadStatusLibrary[indexPath.row] isEqualToString: @"0"]) {
        NSLog(@"found zero, so bolding\n");
        UIFont *myFont = [ UIFont boldSystemFontOfSize: 21.0];
        cell.textLabel.font = myFont;
    }
    else{
        UIFont *myFont = [ UIFont systemFontOfSize:18.0];
        cell.textLabel.font = myFont;
        NSLog(@"FOUND: %@\n", appDelegate.messagesReadStatusLibrary[appDelegate.currentMessageIndex]);
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.imageView.image = [UIImage imageNamed:@"Toddler on grass.jpg"];
    //cell.
    
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
    
    appDelegate.messagesReadStatusLibrary[indexPath.row] = @"1";
    
    appDelegate.numberOfUnreadMessages = appDelegate.numberOfUnreadMessages-1;
    
    NSLog(@"new unread number is: %d", appDelegate.numberOfUnreadMessages);
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    [tableView reloadData];
    
}


@end
