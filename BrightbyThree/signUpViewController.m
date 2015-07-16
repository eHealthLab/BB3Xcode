//
//  signUpViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 5/11/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//
//  Created by Aarti Munjal on 5/6/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
// This program is free software; you can
// redistribute it and/or modify it under the terms
// of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of
// the License, or (at your option) any later
//version.

// This program is distributed in the hope that it
// will be useful, but WITHOUT ANY WARRANTY; without
// even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.

// You should have received a copy of the GNU General
// Public License along with this program; if not,
// write to the Free Software Foundation, Inc., 51
// Franklin Street, Fifth Floor, Boston, MA
// 02110-1301, USA.



#import "signUpViewController.h"
//#import "AFNetworking.h"

@interface signUpViewController()
{
    UIDatePicker *datePicker;
}

@end
@implementation signUpViewController
{
    AppDelegate *appDelegate;
    NSData *responseData;
    NSMutableData *receivedData;
}

@synthesize numberOfRows;
@synthesize sectionArray;
@synthesize signUptableView;



- (void)viewDidLoad
{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.title = @"Sign Up";
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:@selector(sendSignUpRequest)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    saveButton.tag = 10;
    
    [super viewDidLoad];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    
    return [sectionArray count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setLocale:[NSLocale currentLocale]];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *numOfRows = [numberOfRows objectAtIndex:section];
    NSNumber *tempNum = [f numberFromString:numOfRows];
    return  [tempNum intValue];
}

-(void) loadView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    self.sectionArray = [[NSMutableArray alloc] initWithCapacity:2];
    self.numberOfRows = [[NSMutableArray alloc] initWithCapacity:2];
    [sectionArray addObject:@""];
    [sectionArray addObject:@""];
    [sectionArray addObject:@""];
    [sectionArray addObject:@""];
    
    [numberOfRows addObject:@"1"];
    [numberOfRows addObject:@"4"];
    [numberOfRows addObject:@"3"];
    [numberOfRows addObject:@"2"];
    
    [signUptableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [signUptableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
    
    [signUptableView insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
    
    [tableView reloadData];
    
    self.view = tableView;
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"inside the table function");
    
    UITableViewCell *cell, *cell1, *cell2, *cell3, *cell4, *cell5, *cell6, *cell7, *cell8, *cell9;
    UILabel *FirstNameLabel;
    UILabel *LastNameLabel;
    UILabel *EmailLabel;
    UILabel *PasswordLabel;
    //UILabel *PasswordConfirmLabel;
    UILabel *BabyNameLabel;
    UILabel *BabyDOBLabel;
    UILabel *BabyGenderLabel;
    UILabel *ZipcodeLabel;
    UILabel *PhoneNumberLabel;
    
    
    //UITextView *name;
    cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell1"];
    
    
    //Step 2:
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        UILabel *DescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 400.0, 30.0)];
        DescriptionLabel.font = [UIFont boldSystemFontOfSize:14.0];
        DescriptionLabel.textColor = [UIColor redColor];
        DescriptionLabel.text = @"Tap on each field to edit its value.";
        DescriptionLabel.textAlignment = NSTextAlignmentCenter;
        DescriptionLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:DescriptionLabel];
        
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        FirstNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        FirstNameLabel.font = [UIFont boldSystemFontOfSize:16.0];
        FirstNameLabel.text = @"First Name";
        FirstNameLabel.textAlignment = NSTextAlignmentLeft;
        FirstNameLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:FirstNameLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 120, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        NSLog(@"delegate value: %@", appDelegate.firstName);
        textField.placeholder = @"enter first name";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 1;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        LastNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        LastNameLabel.font = [UIFont boldSystemFontOfSize:16.0];
        LastNameLabel.text = @"Last Name";
        LastNameLabel.textAlignment = NSTextAlignmentLeft;
        LastNameLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:LastNameLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 163, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"enter last name";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 2;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 1 && indexPath.row == 2) {
        EmailLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        EmailLabel.font = [UIFont boldSystemFontOfSize:16.0];
        EmailLabel.text = @"Email";
        EmailLabel.textAlignment = NSTextAlignmentLeft;
        EmailLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:EmailLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 206, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"enter email";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 3;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 1 && indexPath.row == 3) {
        PasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        
        PasswordLabel.font = [UIFont boldSystemFontOfSize:16.0];
        PasswordLabel.text = @"Password";
        
        PasswordLabel.textAlignment = NSTextAlignmentLeft;
        PasswordLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:PasswordLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 252, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"enter password";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.secureTextEntry = YES;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 4;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        BabyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        //name = [UITextView alloc] ini
        //[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 150.0, 15.0)]];
        BabyNameLabel.font = [UIFont boldSystemFontOfSize:16.0];
        BabyNameLabel.text = @"Child Name";
        //[cell setBackgroundColor:[UIColor lightGrayColor]];
        BabyNameLabel.textAlignment = NSTextAlignmentLeft;
        BabyNameLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:BabyNameLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 333, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter child name";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 5;
        [self.view addSubview:textField];
        
    }
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        BabyDOBLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        //name = [UITextView alloc] ini
        //[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)]];
        BabyDOBLabel.font = [UIFont boldSystemFontOfSize:16.0];
        BabyDOBLabel.text = @"Child DOB";
        //[cell setBackgroundColor:[UIColor lightGrayColor]];
        BabyDOBLabel.textAlignment = NSTextAlignmentLeft;
        BabyDOBLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:BabyDOBLabel];
        

        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 375, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter date of birth";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        //textField.delegate = textField;
        //textField.delegate = self;
        datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        [datePicker addTarget:self action:@selector(birthDateEntered:) forControlEvents:UIControlEventValueChanged];
        
        
        [textField setInputView:datePicker];
        textField.tag = 6;
        [self.view addSubview:textField];

        
        //textField.keyboardType = UIKeyboardTypeDefault;
        //textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
    }
    
    if (indexPath.section == 2 && indexPath.row == 2) {
        BabyGenderLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        
        BabyGenderLabel.font = [UIFont boldSystemFontOfSize:16.0];
        BabyGenderLabel.text = @"Child Gender";
        
        BabyGenderLabel.textAlignment = NSTextAlignmentLeft;
        BabyGenderLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:BabyGenderLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 417, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter gender";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 7;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 3 && indexPath.row == 0) {
        PhoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        PhoneNumberLabel.font = [UIFont boldSystemFontOfSize:16.0];
        PhoneNumberLabel.text = @"Phone";
        PhoneNumberLabel.textAlignment = NSTextAlignmentLeft;
        PhoneNumberLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:PhoneNumberLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 500, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter phone";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 8;
        [self.view addSubview:textField];
        
        
    }
    
    if (indexPath.section == 3 && indexPath.row == 1) {
        ZipcodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        
        ZipcodeLabel.font = [UIFont boldSystemFontOfSize:16.0];
        ZipcodeLabel.text = @"Zipcode";
        ZipcodeLabel.textAlignment = NSTextAlignmentLeft;
        ZipcodeLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:ZipcodeLabel];
        
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 543, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter zipcode";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 9;
        [self.view addSubview:textField];
        
    }
    
    return cell;

}

-(void)birthDateEntered:(id)sender
{
    
    UITextField *field = (UITextField *)[self.view viewWithTag:6];
    UIDatePicker *picker = (UIDatePicker*)field.inputView;
    //NSDate *eventDate = datePicker.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormat stringFromDate:picker.date];
    //self.dateString = [dateFormat stringFromDate:eventDate];
    
    NSLog(@"date is: %@", formattedDate);
    appDelegate.babyDOB = formattedDate;
    field.text = formattedDate;
    //[self.tableView reloadData];
}

/*
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        
        
        UILabel *FirstNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        FirstNameLabel.font = [UIFont boldSystemFontOfSize:16.0];
        FirstNameLabel.text = @"First Name";
        FirstNameLabel.textAlignment = NSTextAlignmentLeft;
        FirstNameLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:FirstNameLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 60, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"enter first name";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 1;
        [self.view addSubview:textField];
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        
       
        UILabel *LastNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        LastNameLabel.font = [UIFont boldSystemFontOfSize:16.0];
        LastNameLabel.text = @"Last Name";
        LastNameLabel.textAlignment = NSTextAlignmentLeft;
        LastNameLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:LastNameLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 105, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"enter last name";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 2;
        [self.view addSubview:textField];
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        
       
        UILabel *PasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        PasswordLabel.font = [UIFont boldSystemFontOfSize:16.0];
        PasswordLabel.text = @"Email";
        PasswordLabel.textAlignment = NSTextAlignmentLeft;
        PasswordLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:PasswordLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 150, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"enter email";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 3;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 0 && indexPath.row == 3) {
        
       
        UILabel *PasswordConfirmLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        //name = [UITextView alloc] ini
        //[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)]];
        PasswordConfirmLabel.font = [UIFont boldSystemFontOfSize:16.0];
        PasswordConfirmLabel.text = @"Password";
        //[cell setBackgroundColor:[UIColor lightGrayColor]];
        PasswordConfirmLabel.textAlignment = NSTextAlignmentLeft;
        PasswordConfirmLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:PasswordConfirmLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 195, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"enter password";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 4;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        
       
        UILabel *EmailLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 170.0, 30.0)];
        //name = [UITextView alloc] ini
        //[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)]];
        EmailLabel.font = [UIFont boldSystemFontOfSize:16.0];
        EmailLabel.text = @"Confirm Password";
        //[cell setBackgroundColor:[UIColor lightGrayColor]];
        EmailLabel.textAlignment = NSTextAlignmentLeft;
        EmailLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:EmailLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 235, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:14];
        textField.placeholder = @"confirm password";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        
        UILabel *BabyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        //name = [UITextView alloc] ini
        //[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 150.0, 15.0)]];
        BabyNameLabel.font = [UIFont boldSystemFontOfSize:16.0];
        BabyNameLabel.text = @"Child Name";
        //[cell setBackgroundColor:[UIColor lightGrayColor]];
        BabyNameLabel.textAlignment = NSTextAlignmentLeft;
        BabyNameLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:BabyNameLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 335, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter child name";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 5;
        [self.view addSubview:textField];

    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        
        UILabel *BabyDOBLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        //name = [UITextView alloc] ini
        //[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)]];
        BabyDOBLabel.font = [UIFont boldSystemFontOfSize:16.0];
        BabyDOBLabel.text = @"Child DOB";
        //[cell setBackgroundColor:[UIColor lightGrayColor]];
        BabyDOBLabel.textAlignment = NSTextAlignmentLeft;
        BabyDOBLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:BabyDOBLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 380, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter child DOB";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 6;
        [self.view addSubview:textField];

    }
    
    if (indexPath.section == 1 && indexPath.row == 2) {
        
        
        UILabel *BabyGenderLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        //name = [UITextView alloc] ini
        //[[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 15.0)]];
        BabyGenderLabel.font = [UIFont boldSystemFontOfSize:16.0];
        BabyGenderLabel.text = @"Child Gender";
        //[cell setBackgroundColor:[UIColor lightGrayColor]];
        BabyGenderLabel.textAlignment = NSTextAlignmentLeft;
        BabyGenderLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:BabyGenderLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 425, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter child gender";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 7;
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        
        
        UILabel *PhoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        PhoneNumberLabel.font = [UIFont boldSystemFontOfSize:16.0];
        PhoneNumberLabel.text = @"Phone";
        PhoneNumberLabel.textAlignment = NSTextAlignmentLeft;
        PhoneNumberLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:PhoneNumberLabel];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 525, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter phone";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 8;
        [self.view addSubview:textField];
        
        
    }
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        
        
        UILabel *ZipcodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        
        ZipcodeLabel.font = [UIFont boldSystemFontOfSize:16.0];
        ZipcodeLabel.text = @"Zipcode";
        ZipcodeLabel.textAlignment = NSTextAlignmentLeft;
        ZipcodeLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:ZipcodeLabel];
    
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(180, 570, 183, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont systemFontOfSize:15];
        textField.placeholder = @"enter zipcode";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 9;
        [self.view addSubview:textField];
        
    }
    //if (indexPath.section == 3 && indexPath.row == 0) {
        
        
        CGRect frame = CGRectMake(115, 643, 150, 40);
        HTPressableButton *signupButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
        [signupButton setTitle:@"Signup" forState:UIControlStateNormal];
        [signupButton addTarget:self action:@selector(sendSignUpRequest) forControlEvents:UIControlEventTouchUpInside];
        signupButton.buttonColor = [UIColor ht_grapeFruitColor];
        signupButton.shadowColor = [UIColor ht_grapeFruitDarkColor];

        [signupButton addTarget:self action:@selector(sendSignUpRequest) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:signupButton];
        
        
        
    //}
    //return cell;

    
}
 */


- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}


-(void)sendSignUpRequest
{
    
    
    UITextField *field = (UITextField *)[self.view viewWithTag:1];
    NSString *text1 = field.text;
    
    field = (UITextField *)[self.view viewWithTag:2];
    NSString *text2 = field.text;
    
    field = (UITextField *)[self.view viewWithTag:3];
    NSString *text3 = field.text;
    //NSString *emailEntered= text3;
    
    field = (UITextField *)[self.view viewWithTag:4];
    NSString *text4 = field.text;
    
    field = (UITextField *)[self.view viewWithTag:5];
    NSString *text5 = field.text;
    
    field = (UITextField *)[self.view viewWithTag:6];
    NSString *text6 = field.text;
    
    field = (UITextField *)[self.view viewWithTag:7];
    NSString *text7 = field.text;
    
    field = (UITextField *)[self.view viewWithTag:8];
    NSString *text8 = field.text;
    
    field = (UITextField *)[self.view viewWithTag:9];
    NSString *text9 = field.text;
    
    if ([text1 isEqualToString:@""] || [text2 isEqualToString:@""] || [text3 isEqualToString:@""] || [text4 isEqualToString:@""] || [text5 isEqualToString:@""] || [text6 isEqualToString:@""] || [text7 isEqualToString:@""] || [text8 isEqualToString:@""] || [text9 isEqualToString:@""]) {
        
            UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"All information is required."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [messageAlert show];
    }
    else if (![self validateEmail:text3])
    {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please enter a valid email."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else {
        
    
        UIBarButtonItem *saveButton = (UIBarButtonItem *)[self.view viewWithTag:10];
        [saveButton setEnabled:NO];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        UITextField *field = (UITextField *)[self.view viewWithTag:1];
        NSString *text = field.text;
        [prefs setObject:text forKey:@"firstName"];
        appDelegate.firstName = text;
        
        field = (UITextField *)[self.view viewWithTag:2];
        text = field.text;
        [prefs setObject:text forKey:@"lastName"];
        field.placeholder = text;
        //NSLog(@"last name is: %@", text);
        appDelegate.lastName = text;
        
        field = (UITextField *)[self.view viewWithTag:3];
        text = field.text;
        [prefs setObject:text forKey:@"email"];
        appDelegate.userEmail = text;
        
        field = (UITextField *)[self.view viewWithTag:4];
        text = field.text;
        [prefs setObject:text forKey:@"password"];
        appDelegate.userPassword = text;
        
        field = (UITextField *)[self.view viewWithTag:5];
        text = field.text;
        [prefs setObject:text forKey:@"babyName"];
        appDelegate.babyName = text;
        
        field = (UITextField *)[self.view viewWithTag:6];
        text = field.text;
        [prefs setObject:text forKey:@"babyDOB"];
        //appDelegate.babyDOB = text;
        
        field = (UITextField *)[self.view viewWithTag:7];
        text = field.text;
        [prefs setObject:text forKey:@"babyGender"];
        appDelegate.babyGender = text;
        
        field = (UITextField *)[self.view viewWithTag:8];
        text = field.text;
        [prefs setObject:text forKey:@"phoneNumber"];
        appDelegate.phoneNumber = text;
        
        field = (UITextField *)[self.view viewWithTag:9];
        text = field.text;
        [prefs setObject:text forKey:@"zipcode"];
        appDelegate.zipcode = text;

        responseData = [NSMutableData data];
        
        appDelegate.userEmail = [appDelegate.userEmail uppercaseString];
        
        NSString *bodyData = [[[[[[[[[[[[[[[[appDelegate.firstName stringByAppendingString:@"/"] stringByAppendingString:appDelegate.lastName] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.userEmail] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.userPassword] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.phoneNumber] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.babyDOB] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.babyGender] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.zipcode];
        
        NSString *urlString = [@"http://localhost:3000/loginSignup/" stringByAppendingString:bodyData];
        
        NSLog(@"wuery is: %@", urlString);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                             [NSURL URLWithString:urlString]];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPMethod:@"POST"];
        NSData* data = [bodyData dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:data];
        receivedData = [NSMutableData dataWithCapacity: 0];
        
        NSURLResponse* response = [[NSURLResponse alloc] init];
        NSError* error = nil;
        [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

        //NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
        /*if (!theConnection) {
                receivedData = nil;
        }*/
    
        
        if (error != nil)
        {
            NSLog(@"submitted request!");
            NSLog(@"response: %@", response);
            
            UIAlertView *messageAlert = [[UIAlertView alloc]
                                         initWithTitle:@"Success!" message:@"You have successfully signed up."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [messageAlert show];

            
            
            UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
            [self.navigationController pushViewController:uiViewController animated:YES];
            
            UIImage *settingsImage = [UIImage imageNamed:@"19-gear.png"];
            UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:settingsImage style:UIBarButtonItemStylePlain target:self action:@selector(settingsPressed)];
            uiViewController.navigationItem.leftBarButtonItem = settingsButton;
            
            UIImage *accountImage = [UIImage imageNamed:@"76-baby.png"];
            UIBarButtonItem *myAccountButton = [[UIBarButtonItem alloc] initWithImage:accountImage style:UIBarButtonItemStylePlain target:self action:@selector(myAccountPressed)];
            
            uiViewController.navigationItem.rightBarButtonItem = myAccountButton;
            

            
        }
        else {
            NSString* errorLogFormat = @"request failed, error: %@";
            NSLog(errorLogFormat, error);
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
    // do something with the data
    // receivedData is declared as a property elsewhere
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[receivedData length]);
    
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@", res);
    NSLog(@"received data: %@", receivedData);
    
    UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
    
    UIImage *settingsImage = [UIImage imageNamed:@"19-gear.png"];
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:settingsImage style:UIBarButtonItemStylePlain target:self action:@selector(settingsPressed)];
    uiViewController.navigationItem.leftBarButtonItem = settingsButton;
    
    UIImage *accountImage = [UIImage imageNamed:@"76-baby.png"];
    UIBarButtonItem *myAccountButton = [[UIBarButtonItem alloc] initWithImage:accountImage style:UIBarButtonItemStylePlain target:self action:@selector(myAccountPressed)];
    
    uiViewController.navigationItem.rightBarButtonItem = myAccountButton;
    
    
    receivedData = nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
      return [sectionArray objectAtIndex:section];
}

-(void)myAccountPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"accountViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
}

-(void)settingsPressed
{
    UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingsViewController"];
    [self.navigationController pushViewController:uiViewController animated:YES];
}




@end