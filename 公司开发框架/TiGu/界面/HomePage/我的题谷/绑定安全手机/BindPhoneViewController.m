//
//  BindPhoneViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-16.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "BindPhoneViewController.h"

@interface BindPhoneViewController ()

@end

@implementation BindPhoneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"绑定手机号";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if (SystemVersion >= 7.0) {
        btn.frame = CGRectMake(10, FRAME.size.height-80, 300, 40);
    }else{
        btn.frame = CGRectMake(10, FRAME.size.height-150, 300, 40);
    }
    
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
}

-(void)next
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
