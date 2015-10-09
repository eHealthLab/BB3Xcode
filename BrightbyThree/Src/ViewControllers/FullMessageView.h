//
//  FullMessageView.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_FullMessageView_h
#define BrightbyThree_FullMessageView_h

#import<UIKit/UIKit.h>

@interface FullMessageView: UIViewController

@property (weak, nonatomic) IBOutlet UILabel *messageTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *fullMessageText;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)addToFavsPressed:(id)sender;
- (IBAction)viewFavsPressed:(id)sender;

@end


#endif
