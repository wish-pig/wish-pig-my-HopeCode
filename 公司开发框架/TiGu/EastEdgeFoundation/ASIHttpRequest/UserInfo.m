//
//  UserInfo.m
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-9-3.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import "UserInfo.h"
#import "HttpLayer.h"
#import "LocalLayer.h"
#import "NSString+Hashing.h"
#import "Globaldevicetype.h"
#import "GlobalSetting.h"

@implementation UserInfo
{
    NSMutableArray* _info;
}
@synthesize haveprivilege;
@synthesize usrid;
-(id)init
{
    if( self = [super init])
    {
        _info = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray*)getUserInfo;
{
    return _info;
}

-(BOOL)getPrivilege
{
    return haveprivilege;
}

- (void)dealloc
{
    [usrid release];
    [_info release];
    [super dealloc];
}

//开始使用
-(void)login
{
    NSString* startuseurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_STARTLOGIN_URL,nil];
    
    NSDictionary* temdic = [NSDictionary dictionaryWithObjectsAndKeys:@"deviceid",@"deviceid",@"iPhone",@"devicetype", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        NSDictionary *dic = [result[Json] objectForKey:@"data"];
        [_info addObject:dic];
        
        UserInfo* globalusrid = [GlobalSetting getusrid];
        UserInfo* globalprivilege = [GlobalSetting getprivilege];
        
        globalusrid.usrid = [dic objectForKey:@"usrid"];
        
        if ([dic objectForKey:@"havesearchprivilege"] != 0) {
            globalprivilege.haveprivilege = YES;
        }else{
            globalprivilege.haveprivilege = NO;
        }
        NSLog(@"_info %@",_info);
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:startuseurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//获取用户信息
-(void)fetchUserInfo
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETPERSONAL_INFO_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//提交用户信息
-(void)submitUserInfo:(NSDictionary*)userInfo
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMITPERSONAL_INFO_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}



//更新密码
-(void)changePassword:(NSString*)newpwd oldPassword:(NSString*)oldpwd
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_UPDATE_PASSWORD_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",oldpwd,@"oldpwd",newpwd,@"newpwd",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

#pragma mark +++++一会改+++++
//提交头像
-(void)commitheadlogo:(UIImage*)piclogo
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMIT_HEADLOGO_URL,nil];
    
    NSData* data = UIImagePNGRepresentation(piclogo);
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",data,@"pic",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取省份列表
-(void)fetchprovinceList
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETPROVINCE_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        for (NSMutableArray* provinceArray in [[result[Json] objectForKey:@"data"]objectForKey:@"provincelist"]) {
            NSLog(@"proArray %@",provinceArray);
            [_info addObject:provinceArray];
        }
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取城市列表
-(void)fetchcityList:(NSString*)provinceid
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETCITY_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",provinceid,@"provinceid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        for (NSMutableArray* cityArray in [[result[Json] objectForKey:@"data"]objectForKey:@"citylist"])
        {
            [_info addObject:cityArray];
        }
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取县区列表
-(void)fetchcountyList:(NSString*)cityid
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETCOUNTRY_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",cityid,@"cityid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        for (NSMutableArray* countryArray in [[result[Json] objectForKey:@"data"]objectForKey:@"countylist"])
        {
            [_info addObject:countryArray];
        }
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取学校列表
-(void)fetchschoolList:(NSString*)countyid
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETSCHOOL_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",countyid,@"countyid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        for (NSMutableArray* schArr in [[result[Json]objectForKey:@"data"]objectForKey:@"schoollist"]) {
            [_info addObject:schArr];
            
        }
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//提交绑定手机号码
-(void)commitbindmobilenum:(NSString*)mobileno
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMIT_MOBILENUMBIND_URL,nil];
    //NSDictionary* dictsch =
    
    //NSLog(@"fet usrid %@",)
    
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",mobileno,@"mobileno",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
      
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//提交绑定手机密码
-(void)commitbindmobilepwd:(NSString*)mobilepassword
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMIT_MOBILEPWDBINE_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",[mobilepassword MD5Hash],@"password",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//更新绑定设备
-(void)updatebindmobilenum:(NSString*)mobileno withmobilepassword:(NSString*)mobilepassword
{
    NSString* userinfourl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_UPDATE_DEVICE_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",mobileno,@"mobileno",[mobilepassword MD5Hash],@"password",nil];
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:userinfourl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

@end
