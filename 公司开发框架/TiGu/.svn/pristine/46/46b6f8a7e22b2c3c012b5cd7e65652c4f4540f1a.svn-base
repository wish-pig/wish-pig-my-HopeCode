//
//  Pay.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-2.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "Pay.h"
#import "GlobalSetting.h"
@implementation Pay
{
    NSMutableArray* _payArr;
}
-(id)init
{
    if( self = [super init])
    {
        _payArr = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray*)getPayMessages
{
    return _payArr;
}

//获取需提交到支付宝的数据包
-(void)fetchpayapplyInfo
{
    NSString* getAliPayURl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETPAYINFO_URL];
    
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getAliPayURl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//提交支付宝回调信息
-(void)commitpaycallback:(NSString*)callbackinfo
{
    NSString* comAliCBStr = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMIT_CALLBACK_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:comAliCBStr] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取需提交到银联的数据包
-(void)fetchpayunionpayapplyInfo
{
    NSString* getPayUnionInfo = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GET_UNIONPAYINFO_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getPayUnionInfo] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//提交银联回调信息
-(void)commitpayunionpaycallback:(NSString*)callbackinfo
{
    NSString* commitUnionCallInfo = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMIT_UNIONPAY_CALLBACK_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:commitUnionCallInfo] forceRefresh:YES withParam:temdic completionOp:op];
    
}
@end
