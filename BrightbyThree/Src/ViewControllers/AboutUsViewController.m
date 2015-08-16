//
//  AboutUsViewController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 6/25/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AboutUsViewController.h"
#import "AppDelegate.h"

@implementation AboutUsViewController
{
    AppDelegate *appDelegate;
}

@synthesize numberOfRows;
@synthesize sectionArray;
@synthesize aboutUsTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    aboutUsTable.delegate = self;
    aboutUsTable.dataSource = self;
    return self;
}
-(void) viewDidLoad
{
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
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
    [sectionArray addObject:@"Partners"];
    [sectionArray addObject:@"Funders"];
    //[sectionArray addObject:@""];
    
    [numberOfRows addObject:@"1"];
    [numberOfRows addObject:@"4"];
    [numberOfRows addObject:@"4"];
    //[numberOfRows addObject:@"2"];
    
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
    
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
    
    [tableView reloadData];
    
    self.view = tableView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0 && indexPath.row == 0) {
        return 75.0;
    }
    
    return 75.0;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"inside the table function");
    
    UITableViewCell *cell;
       NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
   
    
    
    //UITextView *name;
    //cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    //Step 2:
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section == 0 && indexPath.row == 0) {
       
        
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
      
        
        UIImage *bgImage = [UIImage imageNamed:@"Piton.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"The Piton Foundation";
        cell.detailTextLabel.text = @"http://www.piton.org/piton-foundation";
        [cell.contentView addSubview:bgImageView];


    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        UIImage *bgImage = [UIImage imageNamed:@"walton.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"The Walton Family Foundation";
        cell.detailTextLabel.text = @"http://www.waltonfamilyfoundation.org";
        [cell.contentView addSubview:bgImageView];
    }
    
    if (indexPath.section == 1 && indexPath.row == 2) {
        UIImage *bgImage = [UIImage imageNamed:@"daniels.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"The Daniels Fund";
        cell.detailTextLabel.text = @"http://www.danielsfund.org/home.asp";
        [cell.contentView addSubview:bgImageView];

    }
    
    if (indexPath.section == 1 && indexPath.row == 3) {
        UIImage *bgImage = [UIImage imageNamed:@"steve.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"Steve and Elaine Berman";
        cell.detailTextLabel.text = @"";
        [cell.contentView addSubview:bgImageView];
           }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        UIImage *bgImage = [UIImage imageNamed:@"BB3_Aboutus.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"Bright By Three";
        cell.detailTextLabel.text = @"http://brightbythree.org";
        [cell.contentView addSubview:bgImageView];
    }
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        UIImage *bgImage = [UIImage imageNamed:@"childrens.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(280, 10, 80, 50)];
        cell.textLabel.text = @"Children’s Hospital Colorado";
        cell.detailTextLabel.text = @"http://www.childrenscolorado.org";
        [cell.contentView addSubview:bgImageView];
        
    }
    
    if (indexPath.section == 2 && indexPath.row == 2) {
        UIImage *bgImage = [UIImage imageNamed:@"Accords.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(280, 10, 90, 40)];
        cell.textLabel.text = @"ACCORDS";
        cell.detailTextLabel.text = @"http://www.ucdenver.edu/academics/colleges/medicalschool/programs/outcomes/ACCORDS";
        cell.detailTextLabel.numberOfLines=3;
        [cell.contentView addSubview:bgImageView];
    }
    
    if (indexPath.section == 2 && indexPath.row == 3) {
        
        UIImage *bgImage = [UIImage imageNamed:@"mheathllab.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"CU mHealth Lab";
        cell.detailTextLabel.text = @"http://www.mhealthimpact.ucdenver.edu/";
        cell.detailTextLabel.numberOfLines = 2;
        //cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        [cell.contentView addSubview:bgImageView];
        
    }
    
    if (indexPath.section == 3 && indexPath.row == 1) {
        
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    
    return [sectionArray objectAtIndex:section];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 2 && indexPath.row == 0)
    {
     
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutUsDetails"];
        
        uiViewController.title = @"Bright by Three";
        
        [self.navigationController pushViewController:uiViewController animated:YES];
        
        NSString *string1 = @"http://brightbythree.org";
        
        UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
        textViewDetail1.text = string1;
        textViewDetail1.textAlignment=NSTextAlignmentJustified;
        [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
        [textViewDetail1 sizeToFit];
        [textViewDetail1 setScrollEnabled:YES];
        [uiViewController.view addSubview:textViewDetail1];
        CGRect frame = textViewDetail1.frame;
        frame.size.height = textViewDetail1.contentSize.height;
        textViewDetail1.frame = frame;
        
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
        barButton.title=@"About Us";
        self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
        
    }
    else if(indexPath.section == 2 && indexPath.row == 1)
    {
        
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutUsDetails"];
        
        uiViewController.title = @"Children's Hospital Colorado";
        
        [self.navigationController pushViewController:uiViewController animated:YES];
        
        NSString *string1 = @"www.childrenscolorado.org";
        
        UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
        textViewDetail1.text = string1;
        textViewDetail1.textAlignment=NSTextAlignmentJustified;
        [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
        [textViewDetail1 sizeToFit];
        [textViewDetail1 setScrollEnabled:YES];
        [uiViewController.view addSubview:textViewDetail1];
        CGRect frame = textViewDetail1.frame;
        frame.size.height = textViewDetail1.contentSize.height;
        textViewDetail1.frame = frame;
        
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
        barButton.title=@"About Us";
        self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
        
    
    }
    else if(indexPath.section == 2 && indexPath.row == 2)
    {
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutUsDetails"];
        
        uiViewController.title = @"ACCORDS";
        
        [self.navigationController pushViewController:uiViewController animated:YES];
        
        NSString *string1 = @"http://www.ucdenver.edu/academics/colleges/medicalschool/programs/outcomes/ACCORDS";
        
        UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
        textViewDetail1.text = string1;
        textViewDetail1.textAlignment=NSTextAlignmentJustified;
        [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
        [textViewDetail1 sizeToFit];
        [textViewDetail1 setScrollEnabled:YES];
        [uiViewController.view addSubview:textViewDetail1];
        CGRect frame = textViewDetail1.frame;
        frame.size.height = textViewDetail1.contentSize.height;
        textViewDetail1.frame = frame;
        
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
        barButton.title=@"About Us";
        self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    }
    else if(indexPath.section == 2 && indexPath.row == 3)
    {
     
        UIViewController *uiViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutUsDetails"];
        
        uiViewController.title = @"CU mHealth Lab";
        
        [self.navigationController pushViewController:uiViewController animated:YES];
        
        NSString *string1 = @"www.mhealthimpact.ucdenver.edu";
        
        UITextView *textViewDetail1 = [[UITextView alloc] initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
        textViewDetail1.text = string1;
        textViewDetail1.textAlignment=NSTextAlignmentJustified;
        [textViewDetail1 setFont:[UIFont systemFontOfSize:17]];
        [textViewDetail1 sizeToFit];
        [textViewDetail1 setScrollEnabled:YES];
        [uiViewController.view addSubview:textViewDetail1];
        CGRect frame = textViewDetail1.frame;
        frame.size.height = textViewDetail1.contentSize.height;
        textViewDetail1.frame = frame;
        
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
        barButton.title=@"About Us";
        self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
        
    }
}


@end