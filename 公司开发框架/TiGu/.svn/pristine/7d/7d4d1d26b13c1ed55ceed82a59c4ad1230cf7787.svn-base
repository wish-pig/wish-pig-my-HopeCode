//
//  Evaluation.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-8.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "Evaluation.h"
#import "GlobalSetting.h"
@implementation Evaluation
{
    NSMutableArray* _evaArray;
}
-(id)init
{
    if( self = [super init])
    {
        _evaArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray*)getMessages
{
    return _evaArray;
}
- (void)dealloc
{
    [_evaArray release];
    [super dealloc];
}

//获取我的评价首页
-(void)fetchmyevaluationhomepage
{
    NSString* uppicurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETMYEVALUATION_HOMEPAGE_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:uppicurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//获取我的评价列表
-(void)fetchmyEvaluationList:(NSNumber*)pageno
{
    NSString* uppicurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETMYEVALUATION_LIST_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",pageno ,@"pageno",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:uppicurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//获取我参与的评价列表
-(void)fetchmyReferredList:(NSNumber*)pageno
{
    NSString* uppicurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETREFERRED_LIST_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",pageno,@"pageno",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:uppicurl] forceRefresh:YES withParam:temdic completionOp:op];
     
}

//提交建议
-(void)commitAdvice:(NSString*)advice withcontact:(NSString*)contact
{
    NSString* uppicurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_UPADVICE_URL,nil];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",advice,@"advice",contact,@"contact",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:uppicurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//获取邀请信息
-(void)fetchinviteeList
{
    NSString* uppicurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETINVITEEMSG_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:uppicurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

//提交邀请人ID
-(void)commitInviterid:(NSString*)inviterId
{
    NSString* uppicurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_UPINVITERID_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:uppicurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

@end
