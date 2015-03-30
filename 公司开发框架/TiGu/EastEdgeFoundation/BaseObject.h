//
//  BaseObject.h
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-9-3.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import <Foundation/Foundation.h>


// 缓存方式

#import "HttpLayer.h"
#import "LocalLayer.h"


enum CachePolicy
{
    CacheNone,
    CacheInMemory,
    CacheToFile,
    CacheToEastedge,
};

@class BaseObject;

@interface BaseObjectCompletionOp : AsyncOperationCompleted

@end

#pragma mark - +++++ReceiveDataOperation+++++
typedef void (^EFBlock)( NSDictionary* result);

@interface ReceiveDataOperation : NSObject
-(void) receiveData:(NSDictionary*)data;
-(id) initWithBlock:(EFBlock)block;
@end

@protocol BaseObjectDelegate <NSObject>

@required
-(void)dataObjectChanged:(NSString*)object;

@end

#pragma mark - +++++BaseObject+++++
@interface BaseObject : NSObject
{
    //TODO:add cache data

    //data layer
    HttpLayer*              _dataLayer;
    NSMutableDictionary*    _pendingOperation;
    
    //delegate
    NSMutableArray*         _delegates;
}

-(void)notifyDelegates:(NSString*)which;

-(void)addDelegate:(id<BaseObjectDelegate>)delegates;

-(void)removeDelegate:(id<BaseObjectDelegate>)delegates;

-(void)sendRequest:(NSURL*)addr forceRefresh:(BOOL)yorn withParam:(NSDictionary*)param completionOp:(ReceiveDataOperation*)op;

-(void)cancelPendingOperation;



@end
