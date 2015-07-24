//
//  TextDetailsViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextDetailsViewController.h"
#import "AppDelegate.h"

@implementation TextDetailsViewController
{
    AppDelegate *appDelegate;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    int index = appDelegate.currentMessageIndex;
    if ([appDelegate.quizMessage[index]  isEqual: @"1"]) {
        self.replyButton.hidden = NO;
    }
    else
        self.replyButton.hidden = YES;
    
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    self.imageView.image = [UIImage imageNamed:appDelegate.currentImageView];
    
    self.textView.text = appDelegate.currentMessageContent;
    self.textView.textAlignment=NSTextAlignmentJustified;
    [self.textView sizeToFit];
    [self.textView setScrollEnabled:YES];
    //[uiViewController.view addSubview:self.textView];
    CGRect frame = self.textView.frame;
    frame.size.height = self.textView.contentSize.height;
    self.textView.frame = frame;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.tag=55;
    //webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [webView setFrame:CGRectMake(0, 350, 375, 200)];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.dropbox.com/home/BB3%20Education%20Vids?preview=Hide+and+Seek_Eng_052915.mp4"]]];
    [[self view] addSubview:webView];

}


- (IBAction)takeAPicture:(id)sender {
    
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"takePicture"];

    
    [self.navigationController pushViewController:uiViewController animated:YES];
    
}

- (IBAction)addToFavorites:(id)sender {
    
    NSLog(@"fav pressed\n");
    int index = (int)[appDelegate.messagesLibrary indexOfObject:appDelegate.currentMessageContent];

    BOOL found = false;
    for (int i=0; i < [appDelegate.favoriteMessagesLibrary count]; i++) {
        if ([appDelegate.currentMessageContent isEqualToString:[appDelegate.favoriteMessagesLibrary objectAtIndex:i]]) {
            found = true;
            break;
        }
    }
    
    //NSLog(@"index is: %d\n", index);
    if (found == false) {
        

        if ([appDelegate.favoriteMessagesLibrary count] == 0 && found == false) {
            NSLog(@"count is zero");
        
            appDelegate.favoriteMessagesLibrary = [NSMutableArray arrayWithObjects:[appDelegate.messagesLibrary objectAtIndex:index], nil];
        
            appDelegate.favoriteMessagesImagesLibrary = [NSMutableArray arrayWithObjects:[appDelegate.messagesImagesLibrary objectAtIndex:index], nil];
        
            appDelegate.favoriteMessagesSubjectLibrary = [NSMutableArray arrayWithObjects:[appDelegate.messagesSubjectLibrary objectAtIndex:index], nil];
        
            appDelegate.favoriteMessagesVideosLibrary = [NSMutableArray arrayWithObjects:[appDelegate.messagesVideosLibrary objectAtIndex:index], nil];
            
            UIAlertView *messageAlert = [[UIAlertView alloc]
                                         initWithTitle:@"Added!" message:@"The current text has been added to your favorites!"   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [messageAlert show];
        }
    
        else {
    
            [appDelegate.favoriteMessagesLibrary addObject:[appDelegate.messagesLibrary objectAtIndex:index]];
            [appDelegate.favoriteMessagesSubjectLibrary addObject:[appDelegate.messagesSubjectLibrary objectAtIndex:index]];
            [appDelegate.favoriteMessagesImagesLibrary addObject:[appDelegate.messagesImagesLibrary objectAtIndex:index]];
            [appDelegate.favoriteMessagesVideosLibrary addObject:[appDelegate.messagesVideosLibrary objectAtIndex:index]];
            
            UIAlertView *messageAlert = [[UIAlertView alloc]
                                         initWithTitle:@"Added!" message:@"The current text has been added to your favorites!"   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [messageAlert show];
        }
    }
    else {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error!" message:@"The current text already appears in your favorites!"   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
}

- (IBAction)rateThisMessage:(id)sender {
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Rate this message" otherButtonTitles:@"Share",@"Other", nil];
    
    [actionSheet showFromTabBar:self.tabBarController.tabBar];

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        
    }
    else if (buttonIndex == 1) {
        
    }
    else if (buttonIndex == 2) {
        
    }
        
        
}
    

- (IBAction)messageReplyButton:(id)sender {
}
@end
