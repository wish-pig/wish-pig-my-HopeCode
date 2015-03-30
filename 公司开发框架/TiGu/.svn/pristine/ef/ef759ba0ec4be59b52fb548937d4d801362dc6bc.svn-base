//
//  MyTiGuViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-23.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "MyTiGuViewController.h"
#import "MyTiGuCell.h"
#import "PersonInformationViewController.h"
#import "MyFavoriteCtrl.h"
#import "MyVideoCtrl.h"
#import "MyCommentCtrl.h"
#import "AppDelegate.h"
#import "SearchQuestion.h"
#import "BindPhoneViewController.h"
@interface MyTiGuViewController ()

@end

@implementation MyTiGuViewController
@synthesize dataArray;
@synthesize dataArr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.wantsFullScreenLayout = YES;
        self.hidesBottomBarWhenPushed = YES;
        dataArray = [[NSMutableArray alloc]init];
        dataArr = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)dealloc
{
    [dataArr release];
    [dataArray release];
    [tableviewmytigu release];
    
    [super dealloc];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
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
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"我的题谷";
    tableviewmytigu = [[UITableView alloc]init];
    tableviewmytigu.frame = CGRectMake(FRAME.origin.x, FRAME.origin.y, FRAME.size.width, FRAME.size.height);
    NSLog(@"This is a Test");
    
    NSMutableArray* datamy = [NSMutableArray arrayWithObjects:@"我的收藏",@"我的观看",@"我的评论",@"绑定安全手机",@"购买VIP", nil];
    
    
    self.dataArray = datamy;
    tableviewmytigu.delegate = self;
    tableviewmytigu.dataSource = self;
    
    if (SystemVersion >= 7.0) {
        if ([tableviewmytigu respondsToSelector:@selector(setSeparatorInset:)]) {
            [tableviewmytigu setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    
    [self.view addSubview:tableviewmytigu];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",self.dataArray.count);
    return self.dataArray.count+1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellname = @"mytigu";
    if (indexPath.row == 0) {
        MyTiGuCell* cell = [tableView dequeueReusableCellWithIdentifier:cellname];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MyTiGuCell" owner:self options:nil]lastObject];
        }
        UIImage *image = [self getPhotoFromName:@"currentImage.png"];
        NSLog(@"Current.Image = >%@",image);
        cell.headimageview.image = image;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellname];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname]autorelease];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row-1];
        return cell;
    }
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // 个人信息
        PersonInformationViewController* person = [[PersonInformationViewController alloc]init];
        
        self.navigationController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:person animated:YES];
        [person release];
        
    }else if (indexPath.row == 1){
        // 我的收藏
        MyFavoriteCtrl *myFavoView = [[MyFavoriteCtrl alloc]init];
//        myFavoView.userData = [[SearchQuestion alloc]init];
//        [(SearchQuestion*)myFavoView.userData fetchfavoriteList:[NSNumber numberWithInt:1] deadline:[self isToday]];
        [self.navigationController pushViewController:myFavoView animated:YES];
        [myFavoView release];
        
        
    }else if (indexPath.row == 2){
        // 我的观看
        MyVideoCtrl *myVideo = [[MyVideoCtrl alloc]init];
        [self.navigationController pushViewController:myVideo animated:YES];
        [myVideo release];
        
    }else if (indexPath.row == 3){
        // 我的评论
        MycommentCtrl *myComment = [[MycommentCtrl alloc]init];
        [self.navigationController pushViewController:myComment animated:YES];
        [myComment release];
        

    }else if (indexPath.row == 4){
        //绑定安全手机
        BindPhoneViewController* bindphone = [[BindPhoneViewController alloc]init];
        [self.navigationController pushViewController:bindphone animated:YES];
        [bindphone release];
        
    }else if (indexPath.row == 5){
        // 购买VIP
    }
}
#pragma mark - 从沙盒中读照片
- (UIImage *)getPhotoFromName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *uniquePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:name];
    BOOL blHave = [[NSFileManager defaultManager]fileExistsAtPath:uniquePath];
    if (!blHave) {
        return nil;
    }
    else
    {
        NSData *data = [NSData dataWithContentsOfFile:uniquePath];
        UIImage *image = [UIImage imageWithData:data];
        return image;
    }
    
}

-(NSString*)isToday
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init]autorelease];
    
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    
    return [formatter stringFromDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
