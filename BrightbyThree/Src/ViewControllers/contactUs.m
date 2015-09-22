//
//  contactUs.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "contactUs.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"


@implementation contactUs
{
    AppDelegate *appDelegate;
    NSMutableData *responseData;
    NSMutableData *receivedData;
}

-(void)viewDidLoad
{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.title = @"Contact Us";
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuButton setImage:[[UIImage imageNamed:@"menu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self.iconButton setImage:[[UIImage imageNamed:@"BB3_AbousUs_icon2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    //appDelegate.numberOfClicksSettings++;
    
    /*UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"iStock_000024540608_Double.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.3];*/
    
    self.sendFeedback.cornerRadius = 10.0;
    self.sendFeedback.shadowHeight = self.sendFeedback.frame.size.height * 0.17;
    [self.sendFeedback setTitle:@"Submit" forState:UIControlStateNormal];
    self.sendFeedback.buttonColor = [UIColor ht_greenSeaColor];
    self.sendFeedback.shadowColor = [UIColor ht_mintDarkColor];
    [self.sendFeedback addTarget:self action:@selector(sendFeedbackButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.textLabel sizeToFit];
    [self.view addSubview:self.textLabel];
    CGRect frame = self.textLabel.frame;
    frame.size.height = self.textLabel.contentSize.height;
    self.textLabel.frame = frame;
    
}

-(void)sendFeedbackButtonPressed
{
    if (self.feedbackText.text.length == 1) {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please enter a comment to submit." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else {
        responseData = [NSMutableData data];
        NSString *url = [[[[appDelegate.urlToNodeJs stringByAppendingString:@"/feedback/"] stringByAppendingString:appDelegate.userID] stringByAppendingString:@"/"]
                         stringByAppendingString:self.feedbackText.text];
        url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"url is: %@", url);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                        [NSURL URLWithString:url]];
        request.HTTPMethod = @"POST";
        
        [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        
        receivedData = [NSMutableData dataWithCapacity: 0];
        NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request     delegate:self];
        
        if (!theConnection) {
            
            receivedData = nil;
            NSLog(@"no connection \n");
            // Inform the user that the connection failed.
        }
        
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    receivedData = nil;
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}



- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[receivedData length]);
    
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@", res);
    self.feedbackText.text = @" ";
    
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Thank You!" message:@"Your feedback has been successfully submitted." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [messageAlert show];
    //}
}



@end
