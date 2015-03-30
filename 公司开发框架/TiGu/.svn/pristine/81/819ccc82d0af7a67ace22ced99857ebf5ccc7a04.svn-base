//
//  InviteViewController.m
//  CustomTabController
//
//  Created by 咖啡可乐 on 13-12-18.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "InviteFriendViewController.h"
#import "InviteCell.h"
@interface InviteFriendViewController ()

@end

@implementation InviteFriendViewController

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
    [tableviewinvite release];
    [dataArrayinvite release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"邀请好友";
    
    CGRect frame = [[UIScreen mainScreen]bounds];
    
    tableviewinvite = [[UITableView alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y,frame.size.width, frame.size.height) style:UITableViewStylePlain];
    dataArrayinvite = [[NSMutableArray alloc]initWithObjects:@"短信",@"新浪微博",@"腾讯",@"微信", nil];
  
    
    tableviewinvite.delegate = self;
    tableviewinvite.dataSource = self;
    
    if (SystemVersion >= 7.0) {
        if ([tableviewinvite respondsToSelector:@selector(setSeparatorInset:)]) {
            [tableviewinvite setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    [self.view addSubview:tableviewinvite];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArrayinvite.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* invitecell = @"inviteCell";
    InviteCell* cell = [tableView dequeueReusableCellWithIdentifier:invitecell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"InviteCell" owner:self options:nil]lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    cell.labelshare.text = [dataArrayinvite objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
