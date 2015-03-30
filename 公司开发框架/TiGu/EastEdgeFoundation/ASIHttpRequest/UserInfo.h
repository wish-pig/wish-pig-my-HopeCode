//
//  UserInfo.h
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-9-3.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObject.h"

@class  UserInfo;

@protocol UserInfoDelegate
@optional
-(void)registered:(UserInfo*)userinfo;
-(void)loggedIn:(UserInfo*)userinfo;
-(void)loggedOut:(UserInfo *)userinfo;
-(void)fillUserInfo:(UserInfo*)userinfo;
@end

@interface UserInfo : BaseObject


-(void)fetchUserInfo;
-(void)submitUserInfo:(NSDictionary*)userInfo;
-(void)updatebindmobilenum:(NSString*)mobileno withmobilepassword:(NSString*)mobilepassword;
-(void)changePassword:(NSString*)newpwd oldPassword:(NSString*)oldpwd;
-(void)changePhoneNumber:(NSString *)number;
-(void)login;

-(NSMutableArray*)getUserInfo;

-(BOOL)getPrivilege;
@property (assign,nonatomic) BOOL haveprivilege;
@property (retain,nonatomic) NSString* usrid;
-(void)startuseloginwithdeviceid:(NSString*)deviceid;
-(void)fetchprovinceList;
-(void)fetchcityList:(NSString*)provinceid;
-(void)fetchcountyList:(NSString*)cityid;
-(void)fetchschoolList:(NSString*)countyid;
@end
