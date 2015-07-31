//
//  SignupController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 7/18/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SignupController.h"
#import "AppDelegate.h"

@implementation SignupController
{
    NSData *responseData;
    NSMutableData *receivedData;
    NSMutableArray *dataArray;
    AppDelegate *appDelegate;
    UIDatePicker *datePicker;
    UIPickerView *genderPicker;
    NSArray *genderArray;

}



-(void) viewDidLoad
{
   
    [self.signupScroll setScrollEnabled:YES];

    //make contentSize bigger than your scrollSize (you will need to figure out for your own use case)
    CGSize scrollContentSize = CGSizeMake(320, 1200);
    self.signupScroll.contentSize = scrollContentSize;
    
    appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Mom reading with baby - anglo.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeOverlay alpha:0.5];
    UIGraphicsEndImageContext();
    
    datePicker = [[UIDatePicker alloc] init];
    genderPicker = [[UIPickerView alloc] init];
    //genderPicker.delegate = genderPicker;
    //genderPicker.dataSource = genderPicker;
    genderArray = [[NSArray alloc] initWithObjects:@"Female", @"Male", nil];
    
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(birthDateEntered:) forControlEvents:UIControlEventValueChanged];
    //[genderPicker addTarget:self action:@selector(genderChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    [self.childDOBField setInputView:datePicker];
    //[self.childGenderField setInputView:genderPicker];
    
    self.view.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.3];
    
    [self.signupButton setTitle:@"Signup" forState:UIControlStateNormal];
    self.signupButton.cornerRadius = 10.0;
    self.signupButton.shadowHeight = self.signupButton.frame.size.height * 0.17;
    self.signupButton.buttonColor = [UIColor ht_grapeFruitColor];
    self.signupButton.shadowColor = [UIColor ht_grapeFruitDarkColor];
    
    [self.signupButton addTarget:self action:@selector(sendSignUpRequest) forControlEvents:UIControlEventTouchUpInside];
}


- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    self.childGenderField.text=[genderArray objectAtIndex:row];
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
    UIDatePicker *picker = (UIDatePicker*)self.childDOBField.inputView;

    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *formattedDate = [dateFormat stringFromDate:picker.date];
    
    NSLog(@"date is: %@", formattedDate);
    appDelegate.babyDOB = formattedDate;
    self.childDOBField.text = formattedDate;
    //[self.tableView reloadData];
}



- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}


-(void)sendSignUpRequest
{

    if ([self.firstNameField.text isEqualToString:@""] || [self.lastNameField.text isEqualToString:@""] || [self.emailField.text isEqualToString:@""] || [self.passwordField.text isEqualToString:@""] || [self.childNameField.text isEqualToString:@""] || [self.childDOBField.text isEqualToString:@""] || [self.childGenderField.text isEqualToString:@""] || [self.phoneNumberField.text isEqualToString:@""] || [self.zipcodeField.text isEqualToString:@""]) {
        
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"All information is required."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else if (![self validateEmail:self.emailField.text])
    {
        UIAlertView *messageAlert = [[UIAlertView alloc]
                                     initWithTitle:@"Error" message:@"Please enter a valid email."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [messageAlert show];
    }
    else {
        
        //UIBarButtonItem *saveButton = (UIBarButtonItem *)[self.view viewWithTag:10];
        //[saveButton setEnabled:NO];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        /*UITextField *field = (UITextField *)[self.view viewWithTag:1];*/
        NSString *text = self.firstNameField.text;
        [prefs setObject:text forKey:@"firstName"];
        appDelegate.firstName = text;
        
        /*field = (UITextField *)[self.view viewWithTag:2];*/
        text = self.lastNameField.text;
        [prefs setObject:text forKey:@"lastName"];
        appDelegate.lastName = text;
        
        /*field = (UITextField *)[self.view viewWithTag:3];*/
        text = self.emailField.text;
        [prefs setObject:text forKey:@"email"];
        appDelegate.userEmail = text;
        
        
        text = self.passwordField.text;
        [prefs setObject:text forKey:@"password"];
        appDelegate.userPassword = text;
        

        text = self.childNameField.text;
        [prefs setObject:text forKey:@"babyName"];
        appDelegate.babyName = text;
        

        text = self.childDOBField.text;
        [prefs setObject:text forKey:@"babyDOB"];
        appDelegate.babyDOB = text;
        
        
        text = self.childGenderField.text;
        [prefs setObject:text forKey:@"babyGender"];
        appDelegate.babyGender = text;
        
        
        text = self.phoneNumberField.text;
        [prefs setObject:text forKey:@"phoneNumber"];
        appDelegate.phoneNumber = text;
        
        text = self.zipcodeField.text;
        [prefs setObject:text forKey:@"zipcode"];
        appDelegate.zipcode = text;
        
        responseData = [NSMutableData data];
        
        appDelegate.userEmail = [appDelegate.userEmail uppercaseString];
        
        NSString *bodyData = [[[[[[[[[[[[[[[[appDelegate.firstName stringByAppendingString:@"/"] stringByAppendingString:appDelegate.lastName] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.userEmail] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.userPassword] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.phoneNumber] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.babyName] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.babyDOB] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.babyGender] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.zipcode];
        
        NSString *urlString = [@"http://cbb.ucdenver.edu:3000/loginSignup/" stringByAppendingString:bodyData];
        
        NSLog(@"query is: %@", urlString);
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
        
        
        if (error == nil)
        {
            NSLog(@"submitted request!");
            NSLog(@"response: %@", response);
            NSLog(@"received date: %@ \n", receivedData);
            
            UIAlertView *messageAlert = [[UIAlertView alloc]
                                         initWithTitle:@"Success!" message:@"You have successfully signed up."   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [messageAlert show];
            
            
            //PROCESS RESPONSE; SET DELEGATE VALUES
            
            NSString *url = [[[@"http://cbb.ucdenver.edu:3000/loginSignUp/" stringByAppendingString:appDelegate.userEmail] stringByAppendingString:@"/"] stringByAppendingString:appDelegate.userPassword];
            NSLog(@"login url is: %@\n", url);
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setHTTPMethod:@"GET"];
            [request setURL:[NSURL URLWithString:url]];
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *responseCode = nil;
            
            NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
            
            if([responseCode statusCode] != 200){
                NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
                //return nil;
            }
            
            
            NSError *myError = nil;
            NSDictionary *res = [NSJSONSerialization JSONObjectWithData:oResponseData options:NSJSONReadingMutableLeaves error:&myError];
            NSLog(@"%@", res);
            
            for (id key in res) {
                
                for (id key1 in key) {
                    if ([key1 isEqualToString:@"ID"]) {
                        int id = [[key objectForKey:key1] intValue];
                        appDelegate.userID = [NSString stringWithFormat:@"%d", id];
                        NSLog(@"User Id is: %@", appDelegate.userID);
                        break;
                    }
                }
            }

           
            NSLog(@"values are: %@, %@, %@, %@, %@, %@, %@, %@, %@, %@", appDelegate.userID,appDelegate.firstName, appDelegate.lastName, appDelegate.userEmail, appDelegate.userPassword, appDelegate.babyName, appDelegate.babyDOB, appDelegate.babyGender, appDelegate.phoneNumber, appDelegate.zipcode);
            
            appDelegate.numberOfDaysEnrolled = 0;
            
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:appDelegate.firstName forKey:@"firstName"];
            [prefs setObject:appDelegate.lastName forKey:@"lastName"];
            [prefs setObject:appDelegate.userEmail forKey:@"email"];
            [prefs setObject:appDelegate.userPassword forKey:@"password"];
            [prefs setObject:appDelegate.babyName forKey:@"babyName"];
            [prefs setObject:appDelegate.babyDOB forKey:@"babyDOB"];
            [prefs setObject:appDelegate.babyGender forKey:@"babyGender"];
            [prefs setObject:appDelegate.phoneNumber forKey:@"phoneNumber"];
            NSLog(@"inside log in: phone number is: %@", appDelegate.phoneNumber);
            [prefs setObject:appDelegate.zipcode forKey:@"zipcode"];
                    
            [prefs synchronize];
            
            if ([self initializeTables]) {
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
                NSLog(@"could not initialize\n");
            }
            
            
        } // end if error == nil
    
        else if (error != nil) {
            NSString* errorLogFormat = @"request failed, error: %@";
            NSLog(errorLogFormat, error.description);
        }// end else
        
    }// else
} // end sendsignuprequest

-(bool) initializeTables
{
    NSLog(@"user id: %@\n", appDelegate.userID);
    NSString *urlString = [@"http://cbb.ucdenver.edu:3000/initialize/" stringByAppendingString:appDelegate.userID];
    
    NSLog(@"query is: %@", urlString);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:
                                    [NSURL URLWithString:urlString]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    NSData* data = [appDelegate.userID dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    receivedData = [NSMutableData dataWithCapacity: 0];
    
    NSURLResponse* response = [[NSURLResponse alloc] init];
    NSError* error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    if (error == nil) {
        NSLog(@"success! and response is: %@\n", response);
        return TRUE;
    }
    else {
        NSLog(@"error is: %@\n", error.description);
        return FALSE;
    }
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