//
//  PictureViewController.h
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#ifndef BrightbyThree_PictureViewController_h
#define BrightbyThree_PictureViewController_h
#import<UIKit/UIKit.h>
#import "HTPressableButton.h"
#import "UIColor+HTColor.h"

@interface PictureViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *pictureView;
@property (strong, nonatomic) IBOutlet HTPressableButton *takePhotoButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *selectPhotoButton;
@property (weak, nonatomic) IBOutlet HTPressableButton *cancelButton;


@end

#endif
