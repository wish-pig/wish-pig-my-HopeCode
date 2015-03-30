//
//  MyNavigationController.m
//  还有电影项目
//
//  Created by 咖啡可乐 on 13-10-17.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "MyNavigationController.h"
#import "HomePageViewController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController


-(void)popself{
    [self popViewControllerAnimated:YES];
}

-(UIBarButtonItem*)createBackButton{
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title"] forBarMetrics:UIBarMetricsDefault];
    UIButton * btnLeft = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    btnLeft.frame = CGRectMake(10, 0, 22, 22);
    [btnLeft addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
    return [[[UIBarButtonItem alloc]initWithCustomView:btnLeft]autorelease];
    
}
//重载UINavigationController类的pushViewController:animated方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 1) {
        viewController.navigationItem.leftBarButtonItem = [self createBackButton];
    }
}


@end
