//
//  SignUpViewPart2.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 10/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SignUpViewPart2.h"
#import "AppDelegate.h"
#import "LoginSignupView.h"

@implementation SignUpViewPart2
{
    NSData *responseData;
    NSMutableData *receivedData;
    AppDelegate *delegate;
    UIDatePicker *datePicker;
    UIPickerView *genderPicker;
    NSArray *genderArray;
}



-(void) viewDidLoad
{
   delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.zipcode.delegate = self;
    self.phone.delegate = self;
    self.babyName.delegate = self;
    self.babyDOB.delegate = self;
    self.babyGender.delegate = self;
    
    datePicker = [[UIDatePicker alloc] init];
    genderPicker = [[UIPickerView alloc] init];
    genderPicker.delegate = self;
    genderPicker.dataSource = self;
    genderPicker.showsSelectionIndicator = YES;
    genderArray = [[NSArray alloc] initWithObjects:@"Female", @"Male", nil];
    
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(birthDateEntered:) forControlEvents:UIControlEventValueChanged];
    
    [self.babyDOB setInputView:datePicker];
    [self.babyGender setInputView:genderPicker];
}

- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    self.babyGender.text=[genderArray objectAtIndex:row];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return genderArray.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [genderArray objectAtIndex:row];
}

-(void)birthDateEntered:(id)sender
{
    
    //UITextField *field = (UITextField *)[self.view viewWithTag:6];
    UIDatePicker *picker = (UIDatePicker*)self.babyDOB.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormat stringFromDate:picker.date];
    
    NSLog(@"date is: %@", formattedDate);
    delegate.babyDOB = formattedDate;
    self.babyDOB.text = formattedDate;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
    if (textField == self.zipcode) {
        delegate.zipcode = self.zipcode.text;
    }
    else if (textField == self.phone) {
        delegate.phoneNumber = self.phone.text;
    }
    else if (textField == self.babyName){
        delegate.babyName = self.babyName.text;
    }
    else if (textField == self.babyDOB){
        delegate.babyDOB = self.babyDOB.text;
    }
    else if (textField == self.babyGender){
        delegate.babyGender = self.babyGender.text;
    }
}


@end

