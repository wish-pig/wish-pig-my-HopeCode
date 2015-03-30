//
//  Message.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-2.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "Message.h"
#import "GlobalSetting.h"
@implementation Message
{
    NSMutableArray* _foo;
}
-(id)init
{
    if( self = [super init])
    {
        _foo = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray*)getMessages
{
    return _foo;
    NSLog(@"_foo%@",_foo);
}

//获取消息
-(void)fetchmsgList:(NSNumber*)pageno
{
    
    NSString* commitUnionCallInfo = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETMSG_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",pageno,@"pageno", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {

        for (NSDictionary* cont in [[result[Json] objectForKey:@"data"]objectForKey:@"msglist"]) {
            
            [_foo addObject:cont];
            //NSLog(@"_foo%@",_foo);
        }
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:commitUnionCallInfo] forceRefresh:YES withParam:temdic completionOp:op];
    
    
    
}
//消息被读取
-(void)msgareread:(NSNumber*)msgId
{
    NSString* commitUnionCallInfo = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_READMSG_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",msgId,@"msgid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:commitUnionCallInfo] forceRefresh:YES withParam:temdic completionOp:op];
    
    
}
//删除消息
-(void)msgdelete:(NSNumber*)msgId
{
    NSString* commitUnionCallInfo = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_DELETEMSG_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",msgId,@"msgid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:commitUnionCallInfo] forceRefresh:YES withParam:temdic completionOp:op];

    

}

- (void)dealloc
{
    [_foo release];
    [super dealloc];
}

@end
