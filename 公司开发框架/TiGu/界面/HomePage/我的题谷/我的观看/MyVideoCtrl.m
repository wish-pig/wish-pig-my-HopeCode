//
//  MyVideoCtrl.m
//  TiGu
//
//  Created by Adam on 14-1-16.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "MyVideoCtrl.h"
#import "AppDelegate.h"
@interface MyVideoCtrl ()

@end

@implementation MyVideoCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
    }
    return self;
}
- (void)dealloc
{
    
    [videoPlayer release];
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
    
    self.navigationItem.title = @"我的观看";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnClicked:(id)sender {
    
    VideoPlayCtrl *video = [[VideoPlayCtrl alloc]init];
    [self.navigationController pushViewController:video animated:NO];
    [videoPlayer release];
    
    
}
@end
