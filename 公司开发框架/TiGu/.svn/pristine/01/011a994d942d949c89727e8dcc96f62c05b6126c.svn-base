//
//  BaseObject.m
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-9-3.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import "BaseObject.h"
#import "NSString+Hashing.h"
#import "Globaldevicetype.h"

#import "NSObject+SBJSON.h"


@implementation BaseObject(private)

-(NSMutableDictionary*) getPendingOperation
{
    return _pendingOperation;
}

@end


@implementation BaseObjectCompletionOp

-(void)operationCompleted:(int)reqid withUserData:(NSObject *)userdata andResults:(NSDictionary *)result
{
    BaseObject* baseobj = (BaseObject*)userdata;
    NSString* strid = [NSString stringWithFormat:@"%x", reqid];
    
    ReceiveDataOperation* op = [[baseobj getPendingOperation] objectForKey:strid];
    
    [[baseobj getPendingOperation] removeObjectForKey:strid];
    
    //TODO:add code to process cache
    
    if( op )
        [op receiveData:result];
}

-(void)operationFailed:(int)reqid withUserData:(NSObject *)userdata
{
    NSLog(@"Network operation failed.");
}

@end
@implementation ReceiveDataOperation
{
    EFBlock _block;
}

-(void) receiveData:(NSDictionary*)data
{
    NSLog(@"接收数据");
    _block(data);
}


-(id)initWithBlock:(EFBlock)block
{ 
    if (self = [super init]) {
        _block = [block copy];
    }
    return self;
}
@end

@implementation BaseObject
{
    BaseObjectCompletionOp* baseOperation;
    enum CachePolicy cachePolicy;
}

-(id)init
{
    if( self = [super init])
    {
        baseOperation = [[BaseObjectCompletionOp alloc]init];
        _pendingOperation = [[NSMutableDictionary alloc]init];
        _dataLayer = [[HttpLayer alloc]init];
        _delegates = [[NSMutableArray alloc]init];
    }
    
    return self;
}

-(void)notifyDelegates:(NSString*)which
{
    for ( id<BaseObjectDelegate> del in _delegates)
    {
        [del dataObjectChanged:which];
    }
}
-(void)addDelegate:(id<BaseObjectDelegate>)delegate
{
    [_delegates addObject:delegate];
}
-(void)removeDelegate:(id<BaseObjectDelegate>)delegate
{
    [_delegates removeObject:delegate];
}

-(void)sendRequest:(NSURL *)addr forceRefresh:(BOOL)yorn withParam:(NSDictionary *)param completionOp:(ReceiveDataOperation *)op
{
    if( yorn )
    {
        //FIX:pendingOperation entry may not have been set by the time request completes
        int ret = [_dataLayer asyncSendPostRequest:addr withParam:param userData:self completionOp:baseOperation];
        NSString* reqid = [NSString stringWithFormat:@"%x", ret];
        _pendingOperation[reqid] = op;
    }
    else
    {
        switch( cachePolicy )
        {
            case CacheNone:
                break;
            case CacheInMemory:
                break;
            case CacheToEastedge:
                break;
            case CacheToFile:
                break;
                
            default:
                break;
        }
    }
}

-(void)cancelPendingOperation
{
    for( NSString* reqid in _pendingOperation )
    {
        int intid = -1;
        scanf( [reqid UTF8String], "%x", &intid );
        [_dataLayer cancelPendOperation:intid];
        [_pendingOperation removeObjectForKey:reqid];
    }
}

- (void)dealloc
{
    [_dataLayer release];
    [_pendingOperation release];
    [baseOperation release];
    [_delegates release];
    [super dealloc];
}

@end
