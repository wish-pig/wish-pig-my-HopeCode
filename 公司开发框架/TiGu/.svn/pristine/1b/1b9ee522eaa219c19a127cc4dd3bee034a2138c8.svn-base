//
//  User.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "User.h"
#import "UserInfo.h"
@implementation User

+(UserInfo*)getCurrentUserInfo
{
    static UserInfo *currentUser;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currentUser = [[UserInfo alloc] init];
    });
    return currentUser;
}

@end
