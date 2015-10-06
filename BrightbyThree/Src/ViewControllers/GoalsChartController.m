//
//  GoalsChartController.m
//  BrightbyThree
//
//  Created by Aarti Munjal on 9/8/15.
//  Copyright (c) 2015 University of Colorado Denver. All rights reserved.
//

#import "GoalsChartController.h"
#import "PieChartView.h"
#import "AppDelegate.h"

static inline UIColor *GetRandomUIColor()
{
    CGFloat r = arc4random() % 255;
    CGFloat g = arc4random() % 255;
    CGFloat b = arc4random() % 255;
    UIColor * color = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1.0f];
    return color;
}

static const CGFloat dia = 100.0f;

static const CGRect kPieChartViewFrame = {{35.0f, 20.0f},{dia, dia}};
static const CGRect kPieChartViewFrame2 = {{235.0f, 20.0f},{dia, dia}};
static const CGRect kHoleSliderFrame = {{35.0f, 300.0f},{dia, 20.0}};
static const CGRect kSlicesSliderFrame = {{35.0f, 330.0f},{dia, 20.0}};

static const CGRect kHoleLabelFrame = {{0.0f, 300.0f},{35.0, 20.0}};
static const CGRect kValueLabelFrame = {{0.0f, 330.0f},{35.0, 20.0}};

static const NSInteger tHoleLabelTag = 7;
static const NSInteger tValueLabelTag = 2;

@interface GoalsChartController ()
<
PieChartViewDelegate,
PieChartViewDataSource
>
{
    PieChartView *pieChartView;
    PieChartView *pieChartView2;
    UISlider *holeSlider;
    UISlider *slicesSlider;
    UILabel *holeLabel;
    UILabel *valueLabel;
}
@end

@implementation GoalsChartController
{
    AppDelegate *delegate;
    int indexOfSegment;
}

-(void)loadView
{
    
    
    
    self.modifyGoals.cornerRadius = 10.0;
    self.modifyGoals.shadowHeight = self.modifyGoals.frame.size.height * 0.17;
    [self.modifyGoals setTitle:@"MODIFY GOALS" forState:UIControlStateNormal];
    self.modifyGoals.buttonColor = [UIColor ht_mintColor];
    self.modifyGoals.shadowColor = [UIColor ht_mintDarkColor];
    //[self.modifyGoals addTarget:self action:@selector(LoginPressed) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat h =  [UIApplication sharedApplication].statusBarHidden ? 0 :
    [UIApplication sharedApplication].statusBarFrame.size.height;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                            [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - h)];
    view.backgroundColor = [UIColor lightGrayColor];
    
    pieChartView = [[PieChartView alloc] initWithFrame:kPieChartViewFrame];
    pieChartView2 = [[PieChartView alloc] initWithFrame:kPieChartViewFrame2
                     ];
    pieChartView.delegate = self;
    pieChartView.datasource = self;
    
    pieChartView2.delegate = self;
    pieChartView2.datasource = self;
    
    [view addSubview:pieChartView];
    [view addSubview:pieChartView2];
    //[pieChartView release];
    
    holeLabel = [self labelWithFrame:kHoleLabelFrame];
    [view addSubview:holeLabel];
    
    valueLabel = [self labelWithFrame:kValueLabelFrame];
    [view addSubview:valueLabel];
    
    holeSlider = [[UISlider alloc] initWithFrame:kHoleSliderFrame];
    holeSlider.tag = tHoleLabelTag;
    [holeSlider addTarget:self action:@selector(didChangeValueForSlider:)
         forControlEvents:UIControlEventValueChanged];
    holeSlider.minimumValue = 0.0f;
    holeSlider.maximumValue = dia/2 - 1;
    //int max = holeSlider.maximumValue;
    holeSlider.value = 30.0; // arc4random() % max;
    [view addSubview:holeSlider];
    //[holeSlider release];
    
    slicesSlider = [[UISlider alloc] initWithFrame:kSlicesSliderFrame];
    slicesSlider.tag = tValueLabelTag;
    [slicesSlider addTarget:self action:@selector(didChangeValueForSlider:)
           forControlEvents:UIControlEventValueChanged];
    slicesSlider.minimumValue = 0.0f;
    slicesSlider.maximumValue = 100.0f;
    slicesSlider.value = 2.0; //arc4random() % 100;
    [view addSubview:slicesSlider];
    //[slicesSlider release];
    
    
    //UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 435)];
    //scroll.contentSize = CGSizeMake(320, 700);
    //scroll.showsHorizontalScrollIndicator = YES;
    
    //NSArray *itemArray = [NSArray arrayWithObjects: @"DAILY", @"WEEKLY", @"MONTHLY", nil];
    
    
    
    self.view = view;
    //[view release];
}

-(void)segmentedControlValueDidChange:(UISegmentedControl *)segment
{
    switch (segment.selectedSegmentIndex) {
        case 0:{
            //action for the first button (Current)
            indexOfSegment=0;
            break;}
        case 1:{
            //action for the first button (Current)
            indexOfSegment=1;
            break;}
        case 2:{
            //action for the first button (Current)
            indexOfSegment=2;
            break;}
    }
}

-(void)MySegmentControlAction:(id)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    //NSLog(@"daily, weekly, monthly goals are: %d, %d, %d\n", delegate.dailyPointsGoals, delegate.weeklyPointsGoals, delegate.monthlyPointsGoals);
    
    indexOfSegment=0;
    
    [self didChangeValueForSlider:holeSlider];
    [self didChangeValueForSlider:slicesSlider];
    [pieChartView reloadData];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"DAILY", @"WEEKLY", @"MONTHLY"]];
    segmentedControl.frame = CGRectMake(35, 140, 300, 30);
    //segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    //[scroll addSubview:segmentedControl];
    //[segmentedControl release];
    [self.view addSubview:segmentedControl];
    
}

- (UILabel*)labelWithFrame:(CGRect)frame
{
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:frame];
    resultLabel.backgroundColor = [UIColor clearColor];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    resultLabel.textColor = [UIColor blackColor];
    resultLabel.font = [UIFont systemFontOfSize:15.0f];
    resultLabel.shadowOffset = (CGSize){2,1};
    resultLabel.shadowColor = [UIColor lightGrayColor];
    return resultLabel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)didChangeValueForSlider:(UISlider*)slider
{
    if (slider.tag == tValueLabelTag) valueLabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
    if (slider.tag == tHoleLabelTag) holeLabel.text = [NSString stringWithFormat:@"%.0f",slider.value];
    [pieChartView reloadData];
}

#pragma mark -    PieChartViewDelegate
-(CGFloat)centerCircleRadius
{
    return holeSlider.value;
}
#pragma mark - PieChartViewDataSource
-(int)numberOfSlicesInPieChartView:(PieChartView *)pieChartView
{
    return slicesSlider.value;
}
-(UIColor *)pieChartView:(PieChartView *)pieChartView colorForSliceAtIndex:(NSUInteger)index
{
    return GetRandomUIColor();
}
-(double)pieChartView:(PieChartView *)pieChartView valueForSliceAtIndex:(NSUInteger)index
{
    if (index == 0) {
        //return 20.0;
        NSLog(@"segment: %d\n", indexOfSegment);
        if (indexOfSegment== 0){
             if (delegate.dailyPoints == 0 || delegate.dailyPointsGoals == 0)
                 return 0;
             else {
                 NSLog(@"daily: %d, %d", delegate.dailyPoints, delegate.dailyPointsGoals);
                 return delegate.dailyPoints/delegate.dailyPointsGoals;
             }
            
        }
        else if (indexOfSegment == 1) {
            if (delegate.weeklyPoints == 0 || delegate.weeklyPointsGoals == 0)
                return 0;
            else {
                NSLog(@"daily: %d, %d", delegate.weeklyPoints, delegate.weeklyPointsGoals);
                return delegate.weeklyPoints/delegate.weeklyPointsGoals;
            }
        }
        else if (indexOfSegment == 2) {
            if (delegate.monthlyPoints == 0 || delegate.monthlyPointsGoals == 0)
                return 0;
            else {
                NSLog(@"daily: %d, %d", delegate.monthlyPoints, delegate.monthlyPointsGoals);
                return delegate.monthlyPoints/delegate.monthlyPointsGoals;
            }
        }
        else return 10;
    }
    else
        return 70.0;
        //return delegate.dailyPoints/delegate.dailyPointsGoals;
    //return 100/slicesSlider.value;
}
#pragma mark -

@end

