//
//  PictureViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/21/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PictureViewController.h"

@implementation PictureViewController

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self.takePhotoButton  setStyle:HTPressableButtonStyleRounded];
    [self.takePhotoButton setShadowHeight:0.80];
    [self.takePhotoButton setTitle:@"Take Photo" forState:UIControlStateNormal];
    self.takePhotoButton.buttonColor = [UIColor ht_greenSeaColor];
    self.takePhotoButton.shadowColor = [UIColor ht_mintDarkColor];
    [self.takePhotoButton addTarget:self action:@selector(takePhotoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.selectPhotoButton  setStyle:HTPressableButtonStyleRounded];
    [self.selectPhotoButton setShadowHeight:0.80];
    [self.selectPhotoButton setTitle:@"Select Photo" forState:UIControlStateNormal];
    self.selectPhotoButton.buttonColor = [UIColor ht_grapeFruitColor];
    self.selectPhotoButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    [self.selectPhotoButton addTarget:self action:@selector(browseButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.cancelButton  setStyle:HTPressableButtonStyleRounded];
    [self.cancelButton setShadowHeight:0.80];
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    self.cancelButton.buttonColor = [UIColor ht_citrusColor];
    self.cancelButton.shadowColor = [UIColor ht_carrotColor];
    [self.cancelButton addTarget:self action:@selector(cancelButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    

    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.pictureView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)cancelButtonPressed
{
    UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"libraryViewController"];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title=@"Dashboard";
    
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    [self.navigationController pushViewController:uiViewController animated:YES];

    
}


-(void)takePhotoButtonPressed
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

-(void)browseButtonPressed
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}


@end