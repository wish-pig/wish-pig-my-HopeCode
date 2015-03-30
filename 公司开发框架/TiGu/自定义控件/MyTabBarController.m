//
//  MyTabBarController.m
//  CustomTabController
//
//  Created by 咖啡可乐 on 13-11-7.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomePageViewController.h"
#import "SettingViewController.h"
#import "InviteViewController.h"
#import "SuggestionViewController.h"
#import "MyNavigationController.h"
@interface MyTabBarController ()

-(void)createControllers;

-(void)createCustomTabBar;

@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self createControllers];
    [self createCustomTabBar];
    self.tabBar.hidden = YES;
    
}

-(void)createCustomTabBar{
    //创建一个uiimageviw做为底图

    
    
    self.bgView = [[UIImageView alloc]initWithFrame:CGRectMake(FRAME.origin.x ,FRAME.size.height-49, FRAME.size.width, 49)];
    self.bgView.image = [UIImage imageNamed:@"tabbar.png"];
    self.bgView.tag = 999;
    self.bgView.userInteractionEnabled = YES;
    [self.view addSubview:self.bgView];
    [self.bgView release];
   
    
    //创建tabbar实例 模拟tabbaritem
    //每个button的间隔
    CGFloat space = (320-4*38)/(4+1);
    
    
    for (int i = 0; i < 4; i++) {
        
        NSArray* imagearray = [NSArray arrayWithObjects:@"cinema_1",@"film_1",@"member_1",@"set_1", nil];
        NSArray* selectedimagearray = [NSArray arrayWithObjects:@"cinema_0",@"film_0",@"member_0",@"set_0", nil];
        
        //未选中状态的button
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:[imagearray objectAtIndex:i]] forState:UIControlStateNormal];
        //选中状态的button
        [btn setBackgroundImage:[UIImage imageNamed:[selectedimagearray objectAtIndex:i]] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = i;
        
        if (i == 0) {
            btn.selected = YES;
        }
        
        [btn setFrame:CGRectMake(30 + i * (space + 38), (49-38)/2, 38, 38)];
        [self.bgView addSubview:btn];
    }
    

}

-(void)btnClicked:(UIButton*)btn{
    //点击不同按钮，切换不同视图控制器
    self.selectedIndex = btn.tag;
    //切换不同button的显示状态
    UIImageView* bgView = (UIImageView*)[self.view viewWithTag:999];
    
    for (UIView* subView in  bgView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton* btn1 = (UIButton*)subView;
            if (btn1.tag == btn.tag) {
                btn1.selected = YES;
            }else{
                btn1.selected = NO;
            }
        }
    }
    
}


//将视图控制器的实例添加到标签栏控制器上
-(void)createControllers{
    
    HomePageViewController* homepage = [[HomePageViewController alloc]init];
    MyNavigationController* navhome = [[MyNavigationController alloc]initWithRootViewController:homepage];
    
    
    SettingViewController* setpage = [[SettingViewController alloc]init];
    MyNavigationController* navset = [[MyNavigationController alloc]initWithRootViewController:setpage];
    
    InviteViewController* invitepage = [[InviteViewController alloc]init];
    MyNavigationController* navinvite = [[MyNavigationController alloc]initWithRootViewController:invitepage];
    
    SuggestionViewController* suggestpage = [[SuggestionViewController alloc]init];
    MyNavigationController* navsuggest = [[MyNavigationController alloc]initWithRootViewController:suggestpage];
    

    NSArray* controllers = [NSArray arrayWithObjects:navhome,navset,navinvite,navsuggest, nil];
    
    self.viewControllers = controllers;
    
    [homepage release];
    [navhome release];
    [setpage release];
    [navset release];
    [invitepage release];
    [navinvite release];
    [suggestpage release];
    [navsuggest release];
    

}


@end
