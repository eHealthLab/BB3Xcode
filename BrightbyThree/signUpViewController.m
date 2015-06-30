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
#import "AFNetworking.h"

@implementation signUpViewController
{
    AppDelegate *appDelegate;
}

@synthesize numberOfRows;
@synthesize sectionArray;
@synthesize signUptableView;

- (void)viewDidLoad
{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
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
    [sectionArray addObject:@"Personal Information"];
    [sectionArray addObject:@"Child Information"];
    [sectionArray addObject:@"Demographics"];
    [sectionArray addObject:@""];
    
    [numberOfRows addObject:@"5"];
    [numberOfRows addObject:@"3"];
    [numberOfRows addObject:@"2"];
    [numberOfRows addObject:@"1"];
    
    [signUptableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [signUptableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
    
    [signUptableView insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
    
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
    UILabel *PasswordConfirmLabel;
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
        FirstNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        LastNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        PasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 0 && indexPath.row == 3) {
        PasswordConfirmLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        EmailLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 170.0, 30.0)];
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
        BabyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];

    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        BabyDOBLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];

    }
    
    if (indexPath.section == 1 && indexPath.row == 2) {
        BabyGenderLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        PhoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
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
        [self.view addSubview:textField];
        
        
    }
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        ZipcodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 10.0, 100.0, 30.0)];
        
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
    return cell;

    
}

-(void)sendSignUpRequest
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/loginSignup/TEST@TEST.COM/qwe"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", url, [responseCode statusCode]);
        
    }
    else {

        NSString *response = [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", response);
        
        UITabBarController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabbarController"];
        [self.navigationController pushViewController:uiViewController animated:YES];
        
        NSLog(@"done sending");
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    
    return [sectionArray objectAtIndex:section];
}


@end