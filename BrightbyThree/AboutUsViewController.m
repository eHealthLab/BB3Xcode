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
    self.sectionArray = [[NSMutableArray alloc] initWithCapacity:2];
    self.numberOfRows = [[NSMutableArray alloc] initWithCapacity:2];
    [sectionArray addObject:@"Partners"];
    [sectionArray addObject:@"Funders"];
    
    [numberOfRows addObject:@"4"];
    [numberOfRows addObject:@"4"];
    
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationTop];
    
    [aboutUsTable insertSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationTop];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"inside the sections method");
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

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"inside the cell setter method");
    
    
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCell"];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1)
    {
        
        UIImage *bgImage = [UIImage imageNamed:@"goals.jpg"];
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        
        [bgImageView setFrame:CGRectMake(230, 10, 100, 60)];
        
        //Finally give this imageView to the cell
        
        cell.textLabel.text = @"Piton";
        cell.detailTextLabel.text = @"Foundation";
        
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
    
    if(indexPath.row == 0)
    {
        
    }
}

@end