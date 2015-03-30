//
//  MessageViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-25.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageDetailViewController.h"
#import "MessageCell.h"
#import "Message.h"
#import "AppDelegate.h"
@interface MessageViewController ()

@end

@implementation MessageViewController
@synthesize dataArray;
@synthesize msgidArr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dataArray = [[NSMutableArray alloc]init];
        msgidArr = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)dealloc
{
    [msgidArr release];
    [tableviewmsg release];
    [dataArray release];
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
	// Do any additional setup after loading the view.
    NSLog(@"123");
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"消息";
    CGRect rect = CGRectMake(FRAME.origin.x, FRAME.origin.y, FRAME.size.width, FRAME.size.height);
    tableviewmsg = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    tableviewmsg.delegate = self;
    tableviewmsg.dataSource = self;
    
    [self.view addSubview:tableviewmsg];
    [self setExtraCellLineHidden:tableviewmsg];
    
    
    if (SystemVersion >= 7.0) {
        if ([tableviewmsg respondsToSelector:@selector(setSeparatorInset:)]) {
            [tableviewmsg setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    
}


-(void)dataObjectChanged:(NSString *)object
{
    NSLog(@"456");
    Message* messagesObj = (Message*)self.userData;
    dataArray = [messagesObj getMessages];
    NSLog(@"da %@",dataArray);
    [tableviewmsg reloadData];
}


-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [view release];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellname = @"message";
    MessageCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"MessageCell" owner:self options:nil]lastObject];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    }
    NSMutableArray* contentArr = [NSMutableArray array];
    NSMutableArray* pubtimeArr = [NSMutableArray array];
    for ( NSDictionary* dict in dataArray) {
        [contentArr addObject:[dict objectForKey:@"content"]];
        [pubtimeArr addObject:[dict objectForKey:@"pubtime"]];
        [msgidArr addObject:[dict objectForKey:@"msgid"]];
    }
    cell.labelmsg.text = [NSString stringWithFormat:@"%@",contentArr[indexPath.row]];
    cell.labelpubtime.text = [NSString stringWithFormat:@"%@",pubtimeArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"%d", indexPath.row);
        [dataArray removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationLeft];
        self.userData = [[Message alloc]init];
        [(Message*)self.userData msgdelete:[msgidArr objectAtIndex:indexPath.row]];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"msgidarr %@",msgidArr[indexPath.row]);
    
    MessageDetailViewController* msgdetailCtl = [[MessageDetailViewController alloc]init];
    //消息被读取
    self.userData = [[Message alloc]init];
    //[(Message*)self.userData msgareread:msgidArr[indexPath.row]];
    
    [self.navigationController pushViewController:msgdetailCtl animated:YES];
}

- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
