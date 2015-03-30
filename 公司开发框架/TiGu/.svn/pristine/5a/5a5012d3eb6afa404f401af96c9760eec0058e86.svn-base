//
//  SettingViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "SettingViewController.h"
#import "AboutViewController.h"
#import "GlobalSetting.h"
@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize dataArray;
@synthesize isGlobal;
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
    [tableviewset release];
    [dataArray release];
    [sw release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isGlobal = NO;
    self.navigationItem.title = @"设定";
    self.dataArray = [[[NSMutableArray alloc]initWithCapacity:0]autorelease];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    
    CGRect frame = [[UIScreen mainScreen]bounds];
    
    NSMutableArray* listArray = [NSMutableArray arrayWithObjects:@"3G模式播放视频",@"关于题谷", nil];
    self.dataArray = listArray;
    tableviewset = [[UITableView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height-49) style:UITableViewStylePlain];
    
    //tableviewset.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (SystemVersion >= 7.0) {
        
        if ([tableviewset respondsToSelector:@selector(setSeparatorInset:)]) {
            
            [tableviewset setSeparatorInset:UIEdgeInsetsZero];
            
        }
        
    }
    
    tableviewset.delegate = self;
    tableviewset.dataSource = self;
    
    [self.view addSubview:tableviewset];
    [self setExtraCellLineHidden:tableviewset];
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
    return [dataArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellname = @"set";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname]autorelease];
    }
    if (indexPath.row == 0) {
        sw = [[UISwitch alloc]init];
        if (SystemVersion >= 7.0) {
            sw.frame = CGRectMake(255, 10, 30, 30);
        }else{
            sw.frame = CGRectMake(230, 10, 30, 30);
        }
        [sw setOn:NO];
        [sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        
        [cell addSubview:sw];
    }else if(indexPath.row == 1){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    SettingViewController* globalset = [GlobalSetting getglobalset];
    if (isButtonOn) {
        NSLog(@"On");
        globalset.isGlobal = YES;
    }else {
        NSLog(@"Off");
        globalset.isGlobal = NO;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        AboutViewController* about = [[AboutViewController alloc]init];
        [self.navigationController pushViewController:about animated:YES];
        [about release];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
