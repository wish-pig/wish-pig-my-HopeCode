//
//  ExternalDataLayer.m
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-8-22.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import "ExternalDataLayer.h"
#import "HttpLayer.h"


@implementation AsyncOperationCompleted

-(void)operationCompleted:(int)id withUserData:(NSObject*)userdata andResults:(NSDictionary*)result
{
    
}

@end

@implementation ExternalDataLayer

+(ExternalDataLayer*)createHttpLayer
{
    static HttpLayer* instance = nil;
    if( instance == nil )
        instance = [[HttpLayer alloc] init];
    return instance;
}
//创建一个LocalLayer , file 用于创建本地数据的文件名 , checkparam 是否对访问接口的参数进行检查
+(ExternalDataLayer*)createLocalLayer:(NSString*) file checkParam:(BOOL)yorn
{
    return 0;
}
//创建一个合适的ExternalDataLayer
+(ExternalDataLayer*)createDataLayer
{
#ifdef DEBUG
    //@"interface.txt"
    return [ExternalDataLayer createLocalLayer:@"tiguinterface.json" checkParam:NO];
    NSLog(@"debug");
#else
    return [ExternalDataLayer createHttpLayer];
#endif
}
//addr 数据页面的地址 param 接口所需要的参数  数据访问操作的返回结果。预定的键值对参见
-(NSDictionary*) sendGetRequest:(NSURL*)addr withParam:(NSDictionary*)param
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}

-(NSDictionary*) sendPostRequest:(NSURL*)addr withParam:(NSDictionary*)param
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}
//以同步的方式从服务器下载文件 addr 文件的地址
-(NSDictionary*) downloadFile:(NSURL*)addr
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}
//以同步的方式给服务器上传文件 addr 文件上传的接口地址 param 接口所需要的参数
-(BOOL) uploadFile:(NSURL*)addr withParam:(NSDictionary*)param
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}

// 以异步的方式向服务器提交数据请求 addr 数据页面的地址 param 接口所需要的参数 userdata 用户自定义数据
// op 异步操作完成后所需执行的代码
-(int) asyncSendGetRequest:(NSURL*)addr
              withParam:(NSDictionary*)param
               userData:(NSObject*)userdata
           completionOp:(AsyncOperationCompleted*)op
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}

-(int) asyncSendPostRequest:(NSURL*)addr
              withParam:(NSDictionary*)param
               userData:(NSObject*)userdata
           completionOp:(AsyncOperationCompleted*)op
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
    
}
//以异步的方式从服务器下载文件 addr 文件的地址 userdata 用户自定义数据
//op 异步操作完成后所需执行的代码 返回本次请求的标识符
-(int) asyncDownloadFile:(NSURL*)addr withUserData:(NSObject*)userdata completionOp:(AsyncOperationCompleted*)op
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}
//以异步的方式向服务器上传文件 addr 文件上传的接口地址 param 接口所需要的参数 userdata 用户自定义数据
//op 异步操作完成后所需执行的代码  返回本次请求的标识符
-(int) asyncUploadFile:(NSURL*)addr
             withParam:(NSDictionary*)param
              userData:(NSObject*)userdata
          completionOp:(AsyncOperationCompleted*)op;
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}
//取消正在进行的异步操作 id 请求的标识符 
-(void)cancelPendOperation:(int)opid
{
    @throw [[NSException alloc]initWithName:@"EastedgeFoundationError" reason:@"Function not implemented." userInfo:0];
}
@end
