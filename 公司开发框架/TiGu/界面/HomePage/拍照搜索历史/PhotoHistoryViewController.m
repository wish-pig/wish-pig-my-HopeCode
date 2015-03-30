//
//  PhotoHistoryViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-25.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "PhotoHistoryViewController.h"
#import "PhotoHistoryCell.h"
#import "PhotoHistoryTimeCell.h"
#import "PhotoHistoryQuestionCell.h"
#import "AppDelegate.h"
@interface PhotoHistoryViewController ()

@end

@implementation PhotoHistoryViewController
@synthesize dataArrayhistory;
@synthesize dbName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
- (void)dealloc
{
    [tableviewhistory release];
    [dbName release];
    
    [super dealloc];
}
- (void)viewWillAppear:(BOOL)animated
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [UIView animateWithDuration:0 animations:^{
        appDelegate.tabbarController.bgView.frame = CGRectMake(0, FRAME.size.height, 320, 49);
        appDelegate.tabbarController.tabBar.hidden = YES;
        
    }];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"拍照搜索历史";
    
    
    
    
    
    CGRect rect = CGRectMake(FRAME.origin.x, FRAME.origin.y, FRAME.size.width, FRAME.size.height-49);
    tableviewhistory = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    tableviewhistory.backgroundColor = [UIColor clearColor];
    tableviewhistory.delegate = self;
    tableviewhistory.dataSource = self;
    //tableviewhistory.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self setExtraCellLineHidden:tableviewhistory];
    [self.view addSubview:tableviewhistory];
    
    if (SystemVersion >= 7.0) {
        if ([tableviewhistory respondsToSelector:@selector(setSeparatorInset:)]) {
            [tableviewhistory setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    
}

-(NSString *)getDate
{
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init]autorelease];
    
    [formatter setTimeStyle:NSDateFormatterMediumStyle];

    [formatter setDateFormat:@"MM月dd日 HH:mm"];

    
    return [formatter stringFromDate:[NSDate date]];
  
    
    
}

-(NSString*)isToday
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init]autorelease];
    
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [formatter setDateFormat:@"MM月dd日"];
    return [formatter stringFromDate:[NSDate date]];
}


-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;//dataArrayhistory.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 30;
    }else if (indexPath.row == 1){
        return 60;
    }
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        static NSString* cellname = @"historytime";
        PhotoHistoryTimeCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"PhotoHistoryTime" owner:self options:nil]lastObject];
        if (cell == nil) {
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //判断时间----------要改从数据库读取时间比对
        if ([[[self getDate]substringToIndex:6] isEqualToString:[self isToday]]) {
            cell.labeltime.text = [[[self getDate]componentsSeparatedByString:@" "]objectAtIndex:1];
        }else{
            cell.labeltime.text = [self getDate];
        }
        
        return cell;
    }else if (indexPath.row == 1){
    static NSString* cellname = @"history";
    PhotoHistoryCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"PhotoHistory" owner:self options:nil]lastObject];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 2){
        static NSString* cellname = @"question";
        PhotoHistoryQuestionCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"PhotoHistoryQuestionCell" owner:self options:nil]lastObject];
        if (cell == nil) {
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
