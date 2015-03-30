//
//  InviteViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "InviteViewController.h"
#import "InviteFriendViewController.h"
@interface InviteViewController ()

@end

@implementation InviteViewController

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
    __RELEASE_ALL__(labelcode);
    __RELEASE_ALL__(fieldnum);
    __RELEASE_ALL__(labeltip);
    __RELEASE_ALL__(imgviewbg);
    __RELEASE_ALL__(labeltip2);
    __RELEASE_ALL__(labelinvite);
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"邀请";

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    
    [self createUI];
    
    
    
}

-(void)createUI
{
    imgviewbg = [[UIView alloc]init];
    fieldnum = [[UITextField alloc]init];
    labelcode = [[UILabel alloc]init];
    labeltip = [[UILabel alloc]init];
    labelinvite = [[UILabel alloc]init];
    labeltip2 = [[UILabel alloc]init];
    okBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if (SystemVersion >= 7.0) {
        
        imgviewbg.frame = CGRectMake(10, FRAME.origin.y+68, 300, 70);
        labelcode.frame = CGRectMake(5, FRAME.origin.y+10, 80, 20);
        fieldnum.frame = CGRectMake(90, FRAME.origin.y+5, 150, 30);
        labeltip.frame = CGRectMake(20, FRAME.origin.y+38, 260, 30);
        labelinvite.frame = CGRectMake(55, FRAME.origin.y+80+58, 220, 30);
        labeltip2.frame = CGRectMake(15, FRAME.origin.y+110+58, 290, 40);
        okBtn.frame = CGRectMake(235, FRAME.origin.y+5, 60, 30);
    }else{
        imgviewbg.frame = CGRectMake(10, 10, 300, 70);
        labelcode.frame = CGRectMake(5, 10, 80, 20);
        fieldnum.frame = CGRectMake(90, 5, 150, 30);
        labeltip.frame = CGRectMake(20, 38, 260, 30);
        labelinvite.frame = CGRectMake(55, 80, 220, 30);
        labeltip2.frame = CGRectMake(15, 110, 290, 40);
        okBtn.frame = CGRectMake(235, 250, 60, 30);
    }
    
    
    
    labelcode.text = @"填写邀请码:";
    labelcode.font = [UIFont systemFontOfSize:14];

    fieldnum.placeholder = @"请输入邀请人的题谷号";

    fieldnum.font = [UIFont systemFontOfSize:12];
    fieldnum.keyboardType = UIKeyboardTypeNamePhonePad;
    fieldnum.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    fieldnum.layer.borderColor = [UIColor blackColor].CGColor;
    fieldnum.layer.borderWidth =1.0;
    fieldnum.delegate = self;
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];

    labeltip.text = @"填写邀请码可以使你题谷的免费使用时间增加3天!";
    labeltip.font = [UIFont systemFontOfSize:11];

    labelinvite.text = @"邀请5个好友，免费一个月!";
    labelinvite.textColor = [UIColor redColor];

    labeltip2.text = @"只要有5位题谷用户将你填为邀请人，你将获得免费使用题谷App一个月的奖励，还等什么呢？赶快行动吧!";
    labeltip2.font = [UIFont systemFontOfSize:11];
    

    labeltip2.numberOfLines = 0;
    
    
    btninvite = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (SystemVersion >= 7.0) {
        btninvite.frame = CGRectMake(110,FRAME.origin.y+160+58, 90, 30);
    }else{
        btninvite.frame = CGRectMake(110, 160, 90, 30);
    }
    [btninvite setTitle:@"我要邀请好友" forState:UIControlStateNormal];
    btninvite.titleLabel.font = [UIFont systemFontOfSize:12];
    [btninvite addTarget:self action:@selector(btninviteClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:imgviewbg];
    [self.view addSubview:labelinvite];
    [self.view addSubview:labeltip2];
    [self.view addSubview:btninvite];
    [imgviewbg addSubview:okBtn];
    [imgviewbg addSubview:labelcode];
    [imgviewbg addSubview:fieldnum];
    [imgviewbg addSubview:labeltip];
}


-(void)btninviteClicked
{
    InviteFriendViewController* invitefriend = [[InviteFriendViewController alloc]init];
    [self.navigationController pushViewController:invitefriend animated:YES];
    [invitefriend release];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
