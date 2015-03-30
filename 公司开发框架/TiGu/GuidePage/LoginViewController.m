//
//  LoginViewController.m
//  TiGu
//
//  Created by Adam on 13-12-20.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+Hashing.h"
#import "MyTabBarController.h"
#import "Message.h"
#import "UserInfo.h"
#import "AdPage.h"
#import "HomePageViewController.h"
#import "SettingViewController.h"
#import "InviteViewController.h"
#import "SuggestionViewController.h"
#import "MyNavigationController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize dataArray;
@synthesize lNickTextField;
@synthesize lPwdTextField;
@synthesize loginBtn;

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
    
    [dataArray release];
    __RELEASE_ALL__(lNickTextField);
    __RELEASE_ALL__(lPwdTextField);
    __RELEASE_ALL__(loginBtn);
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userData = [[BaseObject alloc]init];
    dataArray = [[NSMutableArray alloc]init];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(120, 220, 60, 30)];
    [btn setTitle:@"开始使用" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)dataObjectChanged:(NSString *)object
{
    UserInfo* userObj = (UserInfo*)self.userData;
    dataArray = [userObj getUserInfo];
    NSLog(@"arr %@",dataArray);
}

#pragma mark -----登录按钮-----
- (void) loginBtnClick
{
    
    self.userData = [[UserInfo alloc]init];
    [(UserInfo*)self.userData login];
    
//    self.userData = [[UserInfo alloc]init];
//    [(UserInfo*)self.userData updatebindmobilenum:@"13812312312" withmobilepassword:[@"123456" MD5Hash]];
    
#pragma mark -----能连通的接口-----
    //获取广告页
    //[self.userinfo getadurlwithtoken:@"devicetokentest1" completionOp:self.op];
    //开始使用
    //[self.userinfo startuseloginwithdeviceid:@"devecitokentest2" withdevicetype:@"iphone4" completionOp:self.op];
    //获取最新搜索结果
    //[self.search getNewestQuestList:self.op];
    //获取省份列表
    //[self.userinfo getprovinceList:self.op];
    //获取城市列表
    //[self.userinfo getcityList:@"140000" completionOp:self.op];
    //获取县区列表
    //[self.userinfo getcountyList:@"140200" completionOp:self.op];
    //获取学校列表
    //[self.userinfo getschoolList:@"140223" completionOp:self.op];
    //获取我的评价首页
    //[self.userObject getmyevaluationhomepage:self.op];
//    GuideViewController* controller = [GuideViewController new];
//    controller.userData = [[Message alloc]init];
//    [controller.userData getmsglist];
//    [self.navigationController pushViewController:controller animated:yes];
//    self.userData = [[Message alloc]init];
//    [(Message*)self.userData getmsgList:[NSNumber numberWithInt:1]];
    //[(UserInfo*)self.userData startuseloginwithdeviceid:@"devicetokentest2"];
    
    //获取我的评价列表
    //[self.userObject getmyEvaluationList:[NSNumber numberWithInt:1] completionOp:self.op];
    //获取我参与的评价列表
    //[self.userObject getmyReferredList:[NSNumber numberWithInt:1] completionOp:self.op];
    //获取个人信息
    //[self.userinfo getuserinformation:self.op];
    //提交绑定手机号码
    //[self.userinfo commitbindmobilenum:@"13812345678" completionOp:self.op];
    //获取邀请信息
    //[self.userObject getinviteeList:self.op];
    //获取消息
    //[self.message getmsgList:[NSNumber numberWithInt:1] completionOp:self.op];
    //消息被读取
    //[self.message msgareread:[NSNumber numberWithInt:3] completionOp:self.op];
    //删除消息
    //[self.message msgdelete:[NSNumber numberWithInt:3] completionOp:self.op];
    //获取需提交到支付宝的数据包
    //[self.pay getpayapplyInfo:self.op];
    //获取需提交到银联的数据包
    //[self.pay getpayunionpayapplyInfo:self.op];
    
    
#pragma mark ===+++ 接口连不通 +++===
    //提交绑定手机密码
    //[self.userinfo commitbindmobilepwd:@"123456" completionOp:self.op];
    //提交建议
    //[self.userObject commitAdvice:textviewsuggestion.text completionOp:self.op];
    //提交邀请人ID
    //[self.userObject commitInviterid:@"A0000045" completionOp:self.op];
#pragma mark ===+++连不通有问题 +++===
    
#pragma mark ++++++++++++++++++++++++
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.tabbarController.tabBar.hidden = YES;
    
    [self presentViewController:appdelegate.tabbarController animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
