//
//  HttpLayer.m
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-8-22.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import "HttpLayer.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "NSString+SBJSON.h"
#import "NSObject+SBJSON.h"
#import "Reachability.h"

@interface RequestInfo : NSObject

@property (assign,atomic)    ASIHTTPRequest*            request;
@property (assign,atomic)     NSObject*                 userData;
@property (assign,atomic)     AsyncOperationCompleted*  operation;

@end

@implementation RequestInfo
@synthesize request,userData,operation;
@end

@implementation HttpLayer
{
    NSMutableDictionary* requests;
}

-(id)init
{
    if( self = [super init])
    {
        requests = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(NSDictionary*) sendGetRequest:(NSURL*)addr withParam:(NSDictionary*)param
{
    ASIHTTPRequest* request = [[[ASIHTTPRequest alloc] initWithURL:addr]autorelease];
    
    for( NSString* key in param )
    {
        [request addRequestHeader:key value:param[key]];
    }
    [request startSynchronous];
    
    NSString* response = [request responseString];
    
    return [response JSONValue];
}

-(NSDictionary*) sendPostRequest:(NSURL*)addr withParam:(NSDictionary*)param
{
    ASIHTTPRequest* request = [[[ASIHTTPRequest alloc] initWithURL:addr]autorelease];
    NSString* jsonstr = [param JSONRepresentation];
    NSData* data = [jsonstr dataUsingEncoding:NSUTF8StringEncoding];
    
    [request appendPostData:data];
    
    [request startSynchronous];
    
    NSString* response = [request responseString];
    
    NSLog(@"111 %@",[response JSONValue]);
    return [response JSONValue];
}


-(NSDictionary*) downloadFile:(NSURL*)addr
{
    ASIHTTPRequest* request = [[[ASIHTTPRequest alloc] initWithURL:addr]autorelease];
    
    [request startSynchronous];
    
    NSDictionary* result = [NSDictionary dictionaryWithObject:request.responseData forKey:Data];
    
    return result;
}

-(BOOL) uploadFile:(NSURL*)addr withParam:(NSDictionary*)param andData:(NSData *)datas
{
    ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:addr];
    
    for( NSString* key in param)
    {
        [request addPostValue:param[key] forKey:key];
    }
    
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"enctype" value:@"multipart/form-data"];
    [request addData:datas withFileName:@".png" andContentType:@"image/png" forKey:@"pic"];
    
    [request startSynchronous];
    
    NSString* response = [request responseString];
    NSLog(@"%@",response);
    
    NSDictionary* dict = [response JSONValue];
    
    NSString* code = dict[@"code"];
    
    return [code isEqualToString:@"200"];
}


-(int) asyncSendGetRequest:(NSURL*)addr
              withParam:(NSDictionary*)param
               userData:(NSObject*)userdata
           completionOp:(AsyncOperationCompleted*)op
{
    RequestInfo* info = [[[RequestInfo alloc]init]autorelease];
    info.request = [ASIHTTPRequest requestWithURL:addr];
    info.userData = userdata;
    info.operation = op;
    
    for( NSString* key in param )
    {
        [info.request addRequestHeader:key value:param[key]];
    }
    
    [info.request startAsynchronous];
    [info.request setDelegate:self];
    
    NSString* reqid = [NSString stringWithFormat:@"%p", info.request];
    
    [requests setValue:info forKey:reqid];
    
    return (int)info.request;
}

-(int) asyncSendPostRequest:(NSURL*)addr
              withParam:(NSDictionary*)param
               userData:(NSObject*)userdata
           completionOp:(AsyncOperationCompleted*)op
{
    
    //if ([self GetReachability] == nil) {
        //return 0;
    //}else{
    ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:addr];
    //NSLog(@"request %@",request);
    NSLog(@"param :%@",param);
    
    RequestInfo* info = [[[RequestInfo alloc]init]autorelease];
    info.request = request;
    info.userData = userdata;
    info.operation = op;
    [request setRequestMethod:@"POST"];
    
//    NSString* jsonstr = [param JSONRepresentation];
//
//    NSData* data = [jsonstr dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"jsonstr %@",jsonstr);
    for (NSString *keys in [param allKeys]) {
        id object = [param objectForKey:keys];
        if ([object isKindOfClass:[NSData class]]) {

            [request addData:object withFileName:@"shuxueti.png" andContentType:@"image/png" forKey:keys];
            [request setUploadProgressDelegate:self];
            request.showAccurateProgress = YES;
            
        }else{
            [request setPostValue:[param objectForKey:keys] forKey:keys];
        }
    }
    
    //[info.request appendPostData:data];
    [request setDelegate:self];
    
    [info.request setDelegate:self];
    
    [info.request setDidFinishSelector:@selector(requestFinished:)];
    [info.request startAsynchronous];
    
    NSString* reqid = [NSString stringWithFormat:@"%p", info.request];
    [requests setValue:info forKey:reqid];
    NSError *error = [request error];
    if (!error) {
        NSString *respose = [request responseString];
        NSLog(@"respose  %@",respose);
    }
    else
    {
        NSLog(@"error  %@",error);
    }

    return (int)info.request;
    //}
}

-(void)setProgress:(float)newProgress
{
    NSLog(@"progress  %f",newProgress);
}

-(NSString*)GetReachability
{
    
    NSString* result = nil;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    switch ([r currentReachabilityStatus]) {
            
        case NotReachable:// 没有网络连接
            
            result=nil;
            
            break;
            
        case ReachableViaWWAN:// 使用3G网络
            
            result=@"3G";
            
            break;
            
        case ReachableViaWiFi:// 使用WiFi网络
            
            result=@"wifi";
            
            break;
    }
    return result;
}

-(int) asyncDownloadFile:(NSURL*)addr withUserData:(NSObject*)userdata completionOp:(AsyncOperationCompleted*)op
{
//    RequestInfo* info = [[RequestInfo alloc]init];
//    info.request = [ASIHTTPRequest requestWithURL:addr];
//    info.userData = userdata;
//    info.operation = op;
//    
//    [info.request startAsynchronous];
//    [info.request setDelegate:self];
//    
//    NSString* reqid = [NSString stringWithFormat:@"%p", info.request];
//    
//    [requests setValue:info forKey:reqid];
//    
//    return (int)info.request;
    ASIHTTPRequest* request = [[[ASIHTTPRequest alloc] initWithURL:addr]autorelease];
    
    RequestInfo* info = [[[RequestInfo alloc]init]autorelease];
    info.request = request;
    info.userData = userdata;
    info.operation = op;
    
    [request startAsynchronous];
    
    NSString* reqid = [NSString stringWithFormat:@"%p", info.request];
    
    [requests setValue:info forKey:reqid];
    
    return (int)info.request;
}

-(int) asyncUploadFile:(NSURL*)addr
             withParam:(NSDictionary*)param
              userData:(NSObject*)userdata
          completionOp:(AsyncOperationCompleted*)op;
{
    ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:addr];
    RequestInfo* info = [[[RequestInfo alloc]init]autorelease];
    info.request = request;
    info.userData = userdata;
    info.operation = op;
    
    NSLog(@"param :%@",param);
    
    for( NSString* key in param)
    {
        id data = param[key];
        if( [data isKindOfClass:[NSData class]])
        {
            [request addData:data forKey:key];
        }
        else
        {
            [request addData:[data dataUsingEncoding:NSUTF8StringEncoding] forKey:key];
        }
    }
    
    [info.request startAsynchronous];
    [info.request setDelegate:self];
    
    NSString* reqid = [NSString stringWithFormat:@"%p", info.request];
    
    [requests setValue:info forKey:reqid];
    
    return (int)info.request;
}

-(void)cancelPendOperation:(int)opid
{
    NSString* reqid = [NSString stringWithFormat:@"%x", opid];
    
    RequestInfo* info = requests[reqid];
    
    [info.request cancel];
    
    [requests removeObjectForKey:reqid];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"finished");
    NSLog(@"%@",[request responseString]);
    NSString* reqid = [NSString stringWithFormat:@"%p", request];
    
    RequestInfo* info = [requests objectForKey:reqid];
    
    NSMutableDictionary* result = [[[NSMutableDictionary alloc] init]autorelease];
    result[Data] = request.responseData;
    //response can be represented by a string
    NSString* response = request.responseString;
    
    //NSLog(@"response %@",response);
    
    if( response )
    {
        NSDictionary* json = nil;
        NSError *error;
        //if( (json = [response JSONValue]) != nil )
        if ((json = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:&error]) != nil)
        {
            result[Type] = Json;
            result[Json] = json;
            NSLog(@"res %@",result[Json]);
        }
        else
        {
            result[Type] = Xml;
            result[Xml] = response;
        }
    }


    if( info.operation )
    {
        [info.operation operationCompleted:(int)request withUserData:info.userData andResults:result];
    }
    [requests removeObjectForKey:reqid];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed");
    NSLog(@"failed %@",[request error]);
    NSString* reqid = [NSString stringWithFormat:@"%p", request];
    [requests removeObjectForKey:reqid];
}


@end
