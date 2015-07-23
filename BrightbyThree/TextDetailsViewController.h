//
//  TextDetailsViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_TextDetailsViewController_h
#define BrightbyThree_TextDetailsViewController_h

#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface TextDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)takeAPicture:(id)sender;
- (IBAction)addToFavorites:(id)sender;
- (IBAction)rateThisMessage:(id)sender;

- (IBAction)messageReplyButton:(id)sender;
@property (weak, nonatomic) IBOutlet HTPressableButton *replyButton;



@end

#endif
