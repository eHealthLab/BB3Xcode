//
//  MinutesTimer.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MinutesTimer.h"

@implementation MinutesTimer

-(void)viewDidLoad
{
    NSLog(@"timer pressed\n");
    if ([self.startTimer isEqualToString:@"start"]) {
        
        NSLog(@"timer start\n");
        self.startTimer = @"stop";
        self.messageTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                             target:self
                                                           selector:@selector(updateMinutes)
                                                           userInfo:nil
                                                            repeats:YES];
    }
    else {
        NSLog(@"timer stop\n");
        [self.messageTimer invalidate];
        self.messageTimer = nil;
        [self updateMinutes];
    }

    
}
-(void)updateMinutes {
    NSDate *currentDate = [NSDate date];
    NSDate *date = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:date];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    // Create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    
    // Format the elapsed time and set it to the label
    NSString *timeString = [dateFormatter stringFromDate:timerDate];
    self.timerLabel.text = timeString;
}


@end
