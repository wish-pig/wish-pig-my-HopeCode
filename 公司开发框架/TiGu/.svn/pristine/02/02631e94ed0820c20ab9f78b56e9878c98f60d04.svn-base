//
//  RegionCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "RegionCtrl.h"
#import "RegionDetailCtrl.h"
#import "UserInfo.h"
@interface RegionCtrl ()

@end

@implementation RegionCtrl
@synthesize proid;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        proid = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)dealloc
{
    [regionArr release];
    [mTableView release];
    [proid release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title  = @"地区";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarbuttonClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    // 初始化地区数据
    regionArr = [[NSMutableArray alloc]init];
    mTableView = [[UITableView alloc]initWithFrame:CGRectMake(FRAME.origin.x, FRAME.origin.y, FRAME.size.width, FRAME.size.height) style:UITableViewStylePlain];
    mTableView.delegate = self;
    mTableView.dataSource = self;
    if (SystemVersion >= 7.0) {
        if ([mTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [mTableView setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    [self.view addSubview:mTableView];
    
    
}


-(void)dataObjectChanged:(NSString *)object
{
    NSLog(@"456");
    UserInfo* userinfoObj = (UserInfo*)self.userData;
    regionArr = [userinfoObj getUserInfo];
    NSLog(@"da %@",regionArr);
    [mTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [regionArr count];
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    static NSString *str = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str]autorelease];
    }
    
    NSMutableArray* proname = [NSMutableArray array];
    for (NSDictionary* dic in regionArr) {
        [proname addObject:[dic objectForKey:@"provincename"]];
        [proid addObject:[dic objectForKey:@"provinceid"]];
    }
    cell.textLabel.text = [proname objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RegionDetailCtrl *regionDetailView = [[RegionDetailCtrl alloc]init];
    
    regionDetailView.provid = [proid objectAtIndex:indexPath.row];
    
    regionDetailView.userData = [[UserInfo alloc]init];
    NSLog(@"proid %@",[proid objectAtIndex:indexPath.row]);
    [(UserInfo*)regionDetailView.userData fetchcityList:[proid objectAtIndex:indexPath.row]];
    
    [self.navigationController pushViewController:regionDetailView  animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [regionDetailView release];
    
}
- (void)BarbuttonClick:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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


@end
