//
//  MyFavoriteCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-30.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "MyFavoriteCtrl.h"
#import "AppDelegate.h"
@interface MyFavoriteCtrl ()

@end

@implementation MyFavoriteCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    self.navigationItem.title = @"我的收藏";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
