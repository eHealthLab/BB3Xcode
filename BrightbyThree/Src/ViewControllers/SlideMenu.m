//
//  SlideMenu.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/7/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideMenu.h"
#import "AppDelegate.h"
#import "SWRevealViewController.h"



/*
@implementation SlideMenu
{
    AppDelegate *appDelegate;
    NSMutableArray *tableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray = [NSMutableArray arrayWithObjects: @" ", @"My Account", @"Messages", @"About BrightbyThree", @"Contact Us", @"Private Policy", @"Sign Out", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0 && indexPath.row == 0) {
        return 65.0;
    }
    
    return 65.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
        UIFont *myFont = [ UIFont systemFontOfSize:18.0];
    cell.textLabel.font = myFont;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.backgroundColor = [UIColor grayColor];
    //cell.imageView.image = [UIImage imageNamed:@"Toddler on grass.jpg"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [tableData removeObjectAtIndex:indexPath.row];
    
    // Request table view to reload
    [tableView reloadData];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *uiViewController;
    if (indexPath.row == 1) {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"accountViewController"];
    }
    else if (indexPath.row == 2)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"libraryViewController"];
    }
    
    else if (indexPath.row == 3)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutUs"];
    }
    
    else if (indexPath.row == 4)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contactUs"];
    }
    else if (indexPath.row == 5)
    {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"privacyPolicy"];
    }
    else {
        uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"logOut"];
    }
    
    [self.navigationController pushViewController:uiViewController animated:YES];
    //[tableView reloadData];
    
}


@end
 */

@implementation SlideMenu{
    NSArray *menu;
    NSArray *imagesArray;
    NSArray *titlePages;
    AppDelegate *appDelegate;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [super viewDidLoad];
    menu = @[@"extra",@"first", @"second", @"third", @"fourth", @"fifth", @"sixth", @"seventh", @"eigth", @"ninth", @"tenth", @"eleventh",@"twelth"];
    imagesArray = @[@"", @"81-dashboard.png", @"123-id-card.png", @"40-inbox.png", @"ribbon-18-xl.png" , @"17-bar-chart.png", @"28-star.png", @"facebook_icon.jpeg", @"164-glasses-2.png", @"112-group.png", @"187-pencil.png", @"54-lock.png", @"63-runner.png"];
    titlePages = @[@"",@"Dashboard",@"My Account",@"Notifications",@"Rewards",@"Leaderboard",@"Favorites",@"Facebook Page",@"Tutorial",@"About BrightbyThree",@"Contact Us",@"Privacy Policy",@"Sign Out"];
    // badge_icon_24.png
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = [menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    
    //UIFont *myFont = [ UIFont systemFontOfSize:18.0];
    UIFont *myFont = [UIFont fontWithName:@"DIN Alternate" size:21.0];
    cell.textLabel.font = myFont;
    cell.textLabel.textColor= [UIColor whiteColor];
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.backgroundColor = [UIColor grayColor];
    cell.imageView.image = [UIImage imageNamed:[imagesArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*if (indexPath.row == 3) {
        
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LibraryStartViewController"];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uiViewController];
        
        //nav.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:nav animated:NO completion:nil];
    }*/
    
    /*if (indexPath.row == 6) {
        
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoritesStartViewController"];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uiViewController];
        
        //nav.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:nav animated:NO completion:nil];
    }*/
    
    if (indexPath.row == 12) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign out" message:@"Are you sure you want to sign out?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        //UIImage *image = [UIImage imageNamed:@"184-warning.png"];
        //UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        //[alert addSubview:imageView];
        
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //NSLog(@"user pressed the Cancel Button");
        [self viewWillAppear:YES];
    }
    
    
    else if (buttonIndex == 1)
    {
        NSLog(@"Logout Pressed\n");
        NSLog(@"useremail is %@:\n", appDelegate.userEmail);
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        // saving an NSString
        [prefs setObject:appDelegate.userEmail forKey:@"userName"];
        [prefs setObject:appDelegate.userPassword forKey:@"password"];
        
        
        
        [prefs synchronize];
        
        NSLog(@"useremail is %@:\n", [prefs objectForKey:@"userName"]);
        appDelegate.firstName = @"";
        appDelegate.lastName = @"";
        appDelegate.userID = @"";
        //appDelegate.userEmail = @"";
        //appDelegate.userPassword = @"";
        appDelegate.babyDOB = @"";
        appDelegate.babyGender = @"";
        appDelegate.babyName = @"";
        appDelegate.phoneNumber = @"";
        appDelegate.zipcode = @"";
        
        UINavigationController *uiView = [self.storyboard instantiateViewControllerWithIdentifier:@"loginNavigation"];
        
        //[self.navigationController pushViewController:uiView  animated:YES];
        
        uiView.navigationItem.hidesBackButton = YES;
        
        //UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
        
        
        
        //[self.revealViewController frontViewController:uiView];
        //self.navigationItem.hidesBackButton=YES;
    }
}


@end


