//
//  PhotoSearchViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "PhotoSearchViewController.h"
#import "SearchQuestion.h"
#import "AppDelegate.h"
@interface PhotoSearchViewController ()

@end

@implementation PhotoSearchViewController
@synthesize dataArray;
@synthesize jsonArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [NSThread detachNewThreadSelector:@selector(startTimer) toTarget:self withObject:nil];
    }
    return self;
}
- (void)dealloc
{
    [dataArray release];
    [jsonArray release];
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
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    //
    self.navigationItem.title = @"拍照搜索";
    
    jsonArray = [[NSMutableArray alloc]init];
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"上传" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 140, 100, 100);
    [self.view addSubview:btn];
    
    
    
}

-(void)dataObjectChanged:(NSString *)object
{
    NSLog(@"456");
    SearchQuestion* searchObj = (SearchQuestion*)self.userData;
    dataArray = [searchObj getQuestions];
    NSLog(@"da %@",dataArray);
    
    jsonArray = [searchObj getQuestions];
    NSString* jsonhtml = nil;
    for (NSDictionary* dic in jsonArray) {
        NSDictionary* dict = [dic objectForKey:@"videoAnswer"];
        jsonhtml = [dict objectForKey:@"content"];
        NSLog(@"jsonhtml %@",jsonhtml);
    }
    UIWebView* mwebview = [[UIWebView alloc]init];
    mwebview.frame = CGRectMake(0, 180, 320, 260);
    [mwebview loadHTMLString:jsonhtml baseURL:nil];
    [self.view addSubview:mwebview];
}

-(void)btnClicked
{
    NSLog(@"上传");
    UIImage* img = [UIImage imageNamed:@"shuxueti.png"];
    self.userData = [[SearchQuestion alloc]init];
    [(SearchQuestion*)self.userData uploadpictoquestionwithpic:img];
    
    //收藏题目
    //[(SearchQuestion*)self.userData collectionquestioncreatewithqid:[NSNumber numberWithInt:20001258]];
    //打分评价
//    [(SearchQuestion*)self.userData scoreevaluation:[NSNumber numberWithInt:50] withqid:[NSNumber numberWithInt:20001258] withevaluation:@"这题讲的很明白"];
    //获取题目评价首页
    //[(SearchQuestion*)self.userData fetchevaluationhomepage:[NSNumber numberWithInt:20001258]];
    //获取题目评价列表
    //[(SearchQuestion*)self.userData fetchevaluationList:[NSNumber numberWithInt:20001258] withpageno:[NSNumber numberWithInt:1]];
    
}


-(void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(Tohomebtn) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] run];
}

-(void)Tohomebtn
{
    UIButton* btnhome = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnhome setTitle:@"返回首页" forState:UIControlStateNormal];
    [btnhome setFrame:CGRectMake(120, 230, 90, 30)];
    [btnhome addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnhome];
    
    
    
}

-(void)toback
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
