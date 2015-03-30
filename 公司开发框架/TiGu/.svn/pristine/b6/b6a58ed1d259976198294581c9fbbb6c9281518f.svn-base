//
//  RegionDetailCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-30.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "RegionDetailCtrl.h"
#import "RegionAlertView.h"
#import "Rigiondistrict.h"
#import "UserInfo.h"
@interface RegionDetailCtrl ()

@end

@implementation RegionDetailCtrl
@synthesize regionDetailArr;
@synthesize provid;
@synthesize cityid;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        regionDetailArr = [[NSMutableArray alloc]init];
        cityid = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)dealloc
{
    [regionDetailArr release];
    [cityid release];
    __RELEASE_ALL__(regionDetailArr);
    __RELEASE_ALL__(provid);
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"地区";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarbuttonClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    mTableview = [[UITableView alloc]initWithFrame:CGRectMake(FRAME.origin.x, FRAME.origin.y, FRAME.size.width, FRAME.size.height) style:UITableViewStylePlain];
    mTableview.delegate = self;
    mTableview.dataSource = self;
    if (SystemVersion >= 7.0) {
        if ([mTableview respondsToSelector:@selector(setSeparatorInset:)]) {
            [mTableview setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    [self.view addSubview:mTableview];
    
}

-(void)dataObjectChanged:(NSString *)object
{
    NSLog(@"456");
    UserInfo* userinfoObj = (UserInfo*)self.userData;
    regionDetailArr = [userinfoObj getUserInfo];
    NSLog(@"da %@",regionDetailArr);
    [mTableview reloadData];
}


- (void)BarbuttonClick:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [regionDetailArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier]autorelease];
        
    }
    
    NSMutableArray* cityname = [NSMutableArray array];
    for (NSDictionary* dic in regionDetailArr) {
        [cityname addObject:[dic objectForKey:@"cityname"]];
        [cityid addObject:[dic objectForKey:@"cityid"]];
    }
    
    cell.textLabel.text = [cityname objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"＋";
    cell.selectionStyle = UITableViewCellSelectionStyleGray;

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
//    NSString *tempStr = [NSString stringWithFormat:@"你将地区更改为'%@%@'",str,[regionDetailArr objectAtIndex:indexPath.row]];
    /*
    if (SystemVersion >= 7.0) {
        UIAlertView *regionAlert = [[UIAlertView alloc]initWithTitle:@"更改地区" message:tempStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [regionAlert show];
    }
    else{
            RegionAlertView *regionAlert = [[RegionAlertView alloc]initWithTitle:@"更改地区" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            regionAlert.regionLabel.text = [NSString stringWithFormat:@"%@",tempStr];
            [regionAlert show];
    }
    */
    Rigiondistrict* regiondis = [[Rigiondistrict alloc]init];
    
    regiondis.cityid = [cityid objectAtIndex:indexPath.row];
    
    regiondis.userData = [[UserInfo alloc]init];
    
    [(UserInfo*)regiondis.userData fetchcountyList:[cityid objectAtIndex:indexPath.row]];
    NSLog(@"select %@",[cityid objectAtIndex:indexPath.row]);
    NSLog(@" %d",indexPath.row);
    [self.navigationController pushViewController:regiondis  animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [regiondis release];
}

@end
