//
//  AppDelegate.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "LoginViewController.h"
#import "MyTabBarController.h"
#import "Reachability.h"
#import "SDDataCache.h"

#import "ExternalDataLayer.h"
#import "LocalLayer.h"
#import "AdPage.h"
#import "EFViewController.h"

@implementation AppDelegate




@synthesize tabbarController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.tabbarController = [[[MyTabBarController alloc]init]autorelease];
    self.tabbarController.tabBar.hidden = YES;
    
    
    // *****************每次加载图片都是从本地加载,加载的同时发送请求*****************
    //1.第一次启动一定加载本地图片 Y 同时发送请求，并将网络图片下载存在本地
    //2.第二次启动在展示广告页的同时发送请求，将返回值和本地数组中存放的地址进行比较，一致则不进行下载，不一致则下载
    //2.1 将iShowed置为No
    // *************************************************************************
    
    /*
    // 进行是否是第一次启动判断
#pragma mark +++++++++第一次启动+++++++++++
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"] )
        {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];

            self.adpage = [[AdPage alloc]init];
            [(AdPage *)self.adpage fetchadurlwithtoken:@"devicetoken" andMode:@"Local"];
            
            GuideViewController* controller = [GuideViewController new];
            controller.userData = self.adpage;
            for (int i = 0; i < 4; i++) {
                [controller saveImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]] withName:[NSString stringWithFormat:@"%d.png",i]];
                
            }
            
            NSLog(@"Self.Adpage = >%@",self.adpage);
            
            self.window.rootViewController = controller;

        }
#pragma mark +++++++++++第二次以后的启动+++++++++++
    else
    {
        // 第二次启动之后
        
        if (![[NSUserDefaults standardUserDefaults]boolForKey:@"iShowed"]) {
            self.adpage = [[AdPage alloc]init];
            
            
//            if( [self GetCurrntNet] ) // 判断网络
//            {
            
                [(AdPage *)self.adpage fetchadurlwithtoken:@"devicetoken" andMode:@"Net"];
                
                GuideViewController* controller = [GuideViewController new];
                controller.userData = self.adpage;
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setBool:YES forKey:@"iShowed"];
            [defaults synchronize];
                self.window.rootViewController = controller;
                
                
//            }
//            else{
//                NSLog(@"网络故障");
//                
//                
//            }
            
        }
        
        else{
            LoginViewController *loginView = [[LoginViewController alloc] init];
            
            self.window.rootViewController = loginView;
            [loginView release];
        }
    }
    */
    LoginViewController *loginView = [[LoginViewController alloc] init];
    
    self.window.rootViewController = loginView;
    [loginView release];
    
    NSLog(@"当前网络为:%@",[self GetCurrntNet]);

    

    
    
    //[_adpage release];
    
    
  
    
    
    

    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}



-(NSString*)GetCurrntNet

{
    
    NSString* result = nil;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    switch ([r currentReachabilityStatus]) {
            
        case NotReachable:// 没有网络连接
            
            result=nil;
            
            break;
            
        case ReachableViaWWAN:// 使用3G网络
            
            result=@"3G";
            
            break;
            
        case ReachableViaWiFi:// 使用WiFi网络
            
            result=@"wifi";
            
            break;
            
    }
    
    return result;
    
}


-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *deviceTokenStr = [NSString stringWithFormat:@"%@",deviceToken];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
