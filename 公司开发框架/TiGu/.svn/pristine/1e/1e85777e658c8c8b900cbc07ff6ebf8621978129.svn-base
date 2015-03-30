//
//  Rigiondistrict.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-10.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "Rigiondistrict.h"
#import "UserInfo.h"
@interface Rigiondistrict ()

@end

@implementation Rigiondistrict
@synthesize cityid;
@synthesize coutryid;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        regionDistrict = [[NSMutableArray alloc]init];
        coutryid = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)dealloc
{
    [coutryid release];
    [regionDistrict release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"地区";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarbuttonClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
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
    regionDistrict = [userinfoObj getUserInfo];
    NSLog(@"district %@",regionDistrict);
    [mTableView reloadData];
}

- (void)BarbuttonClick:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [regionDistrict count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier]autorelease];
        
    }
    
    NSMutableArray* countryname = [NSMutableArray array];
    
    for (NSDictionary* dic in regionDistrict) {
        [countryname addObject:[dic objectForKey:@"countyname"]];
        [coutryid addObject:[dic objectForKey:@"countyid"]];
        
    }
    
    cell.textLabel.text = [countryname objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = @"＋";
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    }
    NSLog(@"countryid %@",coutryid[indexPath.row]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
