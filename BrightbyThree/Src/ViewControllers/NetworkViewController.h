//
//  NetworkViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/26/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_NetworkViewController_h
#define BrightbyThree_NetworkViewController_h
#import <UIKit/UIKit.h>

@interface NetworkViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIProgressView *totalPointsSoFar;
@property (weak, nonatomic) IBOutlet UIProgressView *pointsPerWeek;
@property (weak, nonatomic) IBOutlet UIProgressView *pointsPerMonth;

@end

#endif
