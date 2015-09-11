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
    [super viewDidLoad];
    menu = @[@"extra",@"first", @"second", @"third", @"fourth", @"fifth", @"sixth", @"seventh"];
    imagesArray = @[@"", @"81-dashboard.png", @"76-baby.png", @"18-envelope.png", @"BB372.png", @"111-user.png",@"187-pencil.png", @"19-gear.png" ];
    
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




@end


