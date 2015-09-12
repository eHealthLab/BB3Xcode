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
#import "SWRevealViewController.h"

@implementation MyAccountViewController

{
    AppDelegate *appDelegate;
}

@synthesize numberOfRows;
@synthesize sectionArray;
@synthesize accounttableView;
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.title = @"My Account";

    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    appDelegate.numberOfClicksMyAccount++;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self.iconButton setImage:[[UIImage imageNamed:@"BB3_AbousUs_icon2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:@selector(saveButtonPressed)];
    
    //self.navigationItem.rightBarButtonItem = saveButton;
    //saveButton.tag = 10;

    
    
    //[super viewDidLoad];
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
    [sectionArray addObject:@""];
    
    [numberOfRows addObject:@"1"];
    [numberOfRows addObject:@"4"];
    [numberOfRows addObject:@"3"];
    [numberOfRows addObject:@"2"];
    [numberOfRows addObject:@"1"];
    
    
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
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    NSString *savedFirstName = [prefs stringForKey:@"firstName"];
    NSString *savedLastName = [prefs stringForKey:@"lastName"];
    NSString *savedEmail = [prefs stringForKey:@"email"];
    NSString *savedPassword = [prefs stringForKey:@"password"];
    NSString *savedBabyName = [prefs stringForKey:@"babyName"];
    NSString *savedBabyDOB = [prefs stringForKey:@"babyDOB"];
    NSString *savedBabyGender = [prefs stringForKey:@"babyGender"];
    NSString *savedPhoneNumber = [prefs stringForKey:@"phoneNumber"];
    NSString *savedZipcode = [prefs stringForKey:@"zipcode"];
    
    
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
        NSLog(@"delegate value: %@", appDelegate.firstName);
        textField.text = savedFirstName;
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
        textField.text = savedLastName;
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
        textField.text = savedEmail;
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
        textField.text = savedPassword;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
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
        textField.text = savedBabyName;
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
        textField.text = savedBabyDOB;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 6;
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
        textField.text = savedBabyGender;
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
        textField.text = savedPhoneNumber;
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
        textField.text = savedZipcode;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.tag = 9;
        [self.view addSubview:textField];
        
    }
    
    if (indexPath.section == 4 && indexPath.row == 0) {
     
        CGRect frame = CGRectMake(115, 620, 150, 40);
        HTPressableButton *signupButton = [[HTPressableButton alloc] initWithFrame:frame buttonStyle:HTPressableButtonStyleRounded];
        [signupButton setTitle:@"Update" forState:UIControlStateNormal];
        [signupButton addTarget:self action:@selector(sendSignUpRequest) forControlEvents:UIControlEventTouchUpInside];
        signupButton.buttonColor = [UIColor ht_grapeFruitColor];
        signupButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
        
        [signupButton addTarget:self action:@selector(sendSignUpRequest) forControlEvents:UIControlEventTouchUpInside];
        signupButton.tag = 10;
        [self.view addSubview:signupButton];
        
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    
    return [sectionArray objectAtIndex:section];
}

-(void)sendSignUpRequest
{

    
    NSLog(@"inside save button\n");
    
    HTPressableButton *button = (HTPressableButton*)[self.view viewWithTag:10];
    button.userInteractionEnabled = NO;
    button.alpha = 0.5;
    
    //UIBarButtonItem *saveButton = (UIBarButtonItem *)[self.view viewWithTag:10];
    //[saveButton setEnabled:NO];

    NSLog(@"inside save in account\n");
    UIBarButtonItem *saveButton = (UIBarButtonItem *)[self.view viewWithTag:10];
    [saveButton setEnabled:NO];

    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    UITextField *field = (UITextField *)[self.view viewWithTag:1];
    NSString *text = field.text;
    [prefs setObject:text forKey:@"firstName"];
    
    field = (UITextField *)[self.view viewWithTag:2];
    text = field.text;
    [prefs setObject:text forKey:@"lastName"];
    field.placeholder = text;
    NSLog(@"last name is: %@", text);
    
    field = (UITextField *)[self.view viewWithTag:3];
    text = field.text;
    [prefs setObject:text forKey:@"email"];
    
    field = (UITextField *)[self.view viewWithTag:4];
    text = field.text;
    [prefs setObject:text forKey:@"password"];
    
    field = (UITextField *)[self.view viewWithTag:5];
    text = field.text;
    [prefs setObject:text forKey:@"babyName"];
    
    field = (UITextField *)[self.view viewWithTag:6];
    text = field.text;
    [prefs setObject:text forKey:@"babyDOB"];
    
    field = (UITextField *)[self.view viewWithTag:7];
    text = field.text;
    [prefs setObject:text forKey:@"babyGender"];
    
    field = (UITextField *)[self.view viewWithTag:8];
    text = field.text;
    [prefs setObject:text forKey:@"phoneNumber"];
    
    field = (UITextField *)[self.view viewWithTag:9];
    text = field.text;
    [prefs setObject:text forKey:@"zipcode"];
    

    // getting an NSString
    NSString *savedFirstName = [prefs stringForKey:@"firstName"];
    NSString *savedLastName = [prefs stringForKey:@"lastName"];
    NSString *savedEmail = [prefs stringForKey:@"email"];
    NSString *savedPassword = [prefs stringForKey:@"password"];
    NSString *savedBabyName = [prefs stringForKey:@"babyName"];
    NSString *savedBabyDOB = [prefs stringForKey:@"babyDOB"];
    NSString *savedBabyGender = [prefs stringForKey:@"babyGender"];
    NSString *savedPhoneNumber = [prefs stringForKey:@"phoneNumber"];
    NSString *savedZipcode = [prefs stringForKey:@"zipcode"];
    
    appDelegate.firstName = savedFirstName;
    appDelegate.lastName = savedLastName;
    appDelegate.userEmail = savedEmail;
    appDelegate.userPassword = savedPassword;
    appDelegate.babyName = savedBabyName;
    appDelegate.babyDOB = savedBabyDOB;
    appDelegate.babyGender = savedBabyGender;
    appDelegate.phoneNumber = savedPhoneNumber;
    appDelegate.zipcode = savedZipcode;
    
    //NSString *name = [prefs stringForKey:@"firstName"];
    
    NSString *urlString = [[[[[[[[[[[[[[[[[[appDelegate.urlToNodeJs stringByAppendingString:@"/updateAccount/"] stringByAppendingString:appDelegate.userID] stringByAppendingString:@"/"] stringByAppendingString:savedFirstName] stringByAppendingString:@"/"] stringByAppendingString:savedLastName] stringByAppendingString:@"/"] stringByAppendingString:savedEmail] stringByAppendingString:@"/"] stringByAppendingString:savedPassword]  stringByAppendingString:@"/"] stringByAppendingString:savedPhoneNumber] stringByAppendingString:@"/"] stringByAppendingString:savedBabyName] stringByAppendingString:@"/"] stringByAppendingString:savedBabyGender] stringByAppendingString:@"/"] stringByAppendingString:savedZipcode];

    NSLog(@"url string: %@", urlString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];

    NSData* data = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    //NSData *receivedData = [NSMutableData dataWithCapacity: 0];

    
    NSURLResponse* response = [[NSURLResponse alloc] init];
    NSError* error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error == nil)
    {
        NSLog(@"submitted request!");
        NSLog(@"response: %@", response);
        
        UIAlertView *messageAlert = [[UIAlertView alloc]

                                     initWithTitle:@"Success!" message:@"Your profile has successfully been updated."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

        

        [messageAlert show];
        
    }
    else if (error != nil)
    {
        NSLog(@"error is: %@\n",error.description);
    }

    


    
}


@end