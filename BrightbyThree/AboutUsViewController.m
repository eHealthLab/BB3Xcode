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

-(void)viewDidLoad
{
    [super viewDidLoad];
    aboutUsTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [aboutUsTable setSeparatorColor:[UIColor lightGrayColor]];
    self.sectionArray = [[NSMutableArray alloc] initWithCapacity:2];
    self.numberOfRows = [[NSMutableArray alloc] initWithCapacity:2];
    [sectionArray addObject:@"Partners"];
    [sectionArray addObject:@"Funders"];
    
    [numberOfRows addObject:@"4"];
    [numberOfRows addObject:@"4"];
    
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
    
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
    [aboutUsTable reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [sectionArray objectAtIndex:section];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCell"];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1)
    {
        
        UIImage *bgImage = [UIImage imageNamed:@"Piton.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"The Piton Foundation";
        cell.detailTextLabel.text = @"http://www.piton.org/piton-foundation";
        [cell.contentView addSubview:bgImageView];
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 2)
    {
        UIImage *bgImage = [UIImage imageNamed:@"walton.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"The Walton Family Foundation";
        cell.detailTextLabel.text = @"http://www.waltonfamilyfoundation.org";
        [cell.contentView addSubview:bgImageView];
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 3)
    {
        UIImage *bgImage = [UIImage imageNamed:@"daniels.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"The Daniels Fund";
        cell.detailTextLabel.text = @"http://www.danielsfund.org/home.asp";
        [cell.contentView addSubview:bgImageView];
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 3)
    {
        UIImage *bgImage = [UIImage imageNamed:@"steve.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"Steve and Elaine Berman";
        cell.detailTextLabel.text = @"";
        [cell.contentView addSubview:bgImageView];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0)
    {
        UIImage *bgImage = [UIImage imageNamed:@"BB3_Aboutus.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"Bright By Three";
        cell.detailTextLabel.text = @"http://brightbythree.org";
        [cell.contentView addSubview:bgImageView];
    }
    
    if (indexPath.section == 1 && indexPath.row == 1)
    {
        UIImage *bgImage = [UIImage imageNamed:@"childrens.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(280, 10, 80, 50)];
        cell.textLabel.text = @"Children’s Hospital Colorado";
        cell.detailTextLabel.text = @"http://www.childrenscolorado.org";
        [cell.contentView addSubview:bgImageView];
    }
    
    if (indexPath.section == 1 && indexPath.row == 2)
    {
        UIImage *bgImage = [UIImage imageNamed:@"Accords.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(240, 10, 100, 50)];
        cell.textLabel.text = @"ACCORDS";
        cell.detailTextLabel.text = @"http://www.ucdenver.edu/academics/colleges/medicalschool/programs/outcomes/ACCORDS";
        [cell.contentView addSubview:bgImageView];
    }
    
    if (indexPath.section == 1 && indexPath.row == 3)
    {
        UIImage *bgImage = [UIImage imageNamed:@"mheathllab.png"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [bgImageView setFrame:CGRectMake(260, 10, 100, 50)];
        cell.textLabel.text = @"CU mHealth Lab";
        cell.detailTextLabel.text = @"http://www.mhealthimpact.ucdenver.edu/";
        cell.detailTextLabel.numberOfLines = 2;
        //cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        [cell.contentView addSubview:bgImageView];
    }
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    //[self.view addSubview:aboutUsTable];
    
    [self.aboutUsTable reloadData];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 1 && indexPath.row == 0)
    {
        
    }
}

@end