//
//  SchoolListCtrl.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-16.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "SchoolListCtrl.h"
#import "UserInfo.h"
#import "GlobalSetting.h"
@interface SchoolListCtrl ()

@end

@implementation SchoolListCtrl
@synthesize schArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        schArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)dealloc
{
    [schArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
#pragma mark ====++++++
    //获取usrid
    //[GlobalSetting getusrid].usrid)
    //获取privilege
    //[GlobalSetting getprivilege].haveprivilege)
    
    self.navigationItem.title = @"学校";
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
    UserInfo* userinfoObj = (UserInfo*)self.userData;
    schArray = [userinfoObj getUserInfo];
    NSLog(@"yyy %@",schArray);
    [mTableview reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"ciii %d",schArray.count);
    return [schArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    NSMutableArray* schArr = [NSMutableArray array];
    for (NSDictionary* dic in schArray) {
        [schArr addObject:[dic objectForKey:@"schoolname"]];
    }
    cell.textLabel.text = schArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
