//
//  AppDelegate.h
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTabBarController.h"
#import "EFViewController.h"
#import "AdPage.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSArray *localUrlArr;
    NSArray *serverUrlArr;
    NSMutableArray *localImgArr;
    
    
}
@property (nonatomic,strong) UIWindow *window;
@property (nonatomic,retain) MyTabBarController *tabbarController;
@property (nonatomic,retain) AdPage* adpage;
@property (nonatomic,retain) NSMutableArray *localUrlArr;


@end
