//
//  GlobalSetting.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "GlobalSetting.h"
#import "SettingViewController.h"
@interface GlobalSetting ()

@end

@implementation GlobalSetting


+(SettingViewController*)getglobalset
{
    static SettingViewController* getglobalset;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        getglobalset = [[SettingViewController alloc] init];
    });
    
    return getglobalset;
}

+(UserInfo*)getusrid
{
    static UserInfo* getusrid;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        getusrid = [[UserInfo alloc]init];
    });
    return getusrid;
}

+(UserInfo*)getprivilege
{
    static UserInfo* getprivilege;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        getprivilege = [[UserInfo alloc]init];
    });
    return getprivilege;
}

@end
