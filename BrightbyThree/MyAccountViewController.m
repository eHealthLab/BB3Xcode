//
//  MyAccountViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/27/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyAccountViewController.h"
#import "AppDelegate.h"

@implementation MyAccountViewController

{
    AppDelegate *appDelegate;
}

@synthesize numberOfRows;
@synthesize sectionArray;
@synthesize accounttableView;
-(void) viewDidLoad
{

    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
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
    
    [accounttableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [accounttableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
    
    [accounttableView insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
    
    [tableView reloadData];
    
    self.view = tableView;
    
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"inside the table function");
    
    UITableViewCell *cell;
    UILabel *FirstNameLabel;
    UILabel *LastNameLabel;
    UILabel *EmailLabel;
    UILabel *PasswordLabel;
    UILabel *BabyNameLabel;
    UILabel *BabyDOBLabel;
    UILabel *BabyGenderLabel;
    UILabel *ZipcodeLabel;
    UILabel *PhoneNumberLabel;
    
    
    //UITextView *name;
    cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
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
        textField.placeholder = appDelegate.firstName;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        textField.placeholder = appDelegate.lastName;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        textField.placeholder = appDelegate.userEmail;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        textField.placeholder = appDelegate.userPassword;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        textField.placeholder = appDelegate.babyName;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        textField.placeholder = appDelegate.babyDOB;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self.view addSubview:textField];
        
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
        textField.placeholder = appDelegate.babyGender;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        textField.placeholder = appDelegate.phoneNumber;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
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
        textField.placeholder = appDelegate.zipcode;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self.view addSubview:textField];
        
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    
    return [sectionArray objectAtIndex:section];
}


@end