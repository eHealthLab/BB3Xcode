//
//  MinutesValue.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MinutesValue.h"
#import "AppDelegate.h"

@implementation MinutesValue
{
    AppDelegate *delegate;
}

-(void)viewDidLoad
{
     delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
}

- (IBAction)decrementMinutes:(id)sender {
    
    if ([self.timerLabel.text isEqualToString:@"2"]) {
        
        NSLog(@"invalid\n");

    }
    else {
        //NSString *label = self.timerLabel.text;
        int value = [self.timerLabel.text intValue];
        value--;
        self.timerLabel.text = [@(value) stringValue];
        delegate.newPoints = value;
    }
    
}

- (IBAction)incrementMinutes:(id)sender {
    if ([self.timerLabel.text isEqualToString:@"30"]) {
        
        NSLog(@"invalid\n");
        
    }
    else {
        //NSString *label = self.timerLabel.text;
        int value = [self.timerLabel.text intValue];
        value++;
        self.timerLabel.text = [@(value) stringValue];
        delegate.newPoints = value;
        
    }
}
@end