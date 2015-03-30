//
//  LocalLayer.m
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-8-22.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import "LocalLayer.h"
#import "SBJSON.h"
#import "NSString+SBJSON.h"

NSString* const Parameters  = @"parameters";
NSString* const Results     = @"results";
NSString* const Method      = @"method";

@implementation LocalLayer
{
    NSDictionary* results;
    BOOL checkParam;
    unsigned reqid;
}

-(id)initWithFile:(NSString*)file checkParam:(BOOL)yorn
{
    if( self = [super init])
    {
        checkParam = yorn;
        NSString* str = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:0];
        
        
        if(str)
            results = [str JSONValue];
    }
    return self;
}

-(BOOL)checkParameters:(NSDictionary*)param forAddres:(NSString*)addr
{
    return YES;
}

-(NSDictionary*) sendGetRequest:(NSURL*)addr withParam:(NSDictionary*)param
{
    NSDictionary* entry = results[ [addr absoluteString] ];
    
    //wrong method
    if( [@"GET" isEqualToString:entry[Method]] )
    {
        return nil;
    }
    
    //validate parameter
    if( checkParam && [self checkParameters:param forAddres:[addr absoluteString]])
    {
        return nil;
    }
    NSDictionary* result = entry[Results];
    
    return result;
}

-(NSDictionary*) sendPostRequest:(NSURL*)addr withParam:(NSDictionary*)param
{
    NSDictionary* entry = results[ [addr absoluteString] ];
    
    //wrong method
    if( [@"POST" isEqualToString:entry[Method]] )
    {
        return nil;
    }
    
    //validate parameter
    if( checkParam && [self checkParameters:param forAddres:[addr absoluteString]])
    {
        return nil;
    }
    NSDictionary* result = entry[Results];
    
    return result;
}

-(NSDictionary*) downloadFile:(NSURL*)addr
{
    NSData* data = [NSData dataWithContentsOfFile:[addr absoluteString]];
    NSDictionary* result = [NSDictionary dictionaryWithObject:data forKey:Data];
    return result;
}

-(BOOL) uploadFile:(NSURL*)addr withParam:(NSDictionary*)param
{
    if( checkParam )
    {
        if( [self checkParameters:param forAddres:[addr absoluteString]] )
            return YES;
        else
            return NO;
    }
    else
        return YES;
}


-(int) asyncSendGetRequest:(NSURL*)addr
                 withParam:(NSDictionary*)param
                  userData:(NSObject*)userdata
              completionOp:(AsyncOperationCompleted*)op
{
    NSDictionary* result = [self sendGetRequest:addr withParam:param];
    
    [op operationCompleted:reqid withUserData:userdata andResults:result];
    
    return reqid++;
}

-(int) asyncSendPostRequest:(NSURL*)addr
                  withParam:(NSDictionary*)param
                   userData:(NSObject*)userdata
               completionOp:(AsyncOperationCompleted*)op
{
    NSDictionary* result = [self sendPostRequest:addr withParam:param];
    
    [op operationCompleted:reqid withUserData:userdata andResults:result];
    
    return reqid++;;
}

-(int) asyncDownloadFile:(NSURL*)addr withUserData:(NSObject*)userdata completionOp:(AsyncOperationCompleted*)op
{
    NSDictionary* result = [self downloadFile:addr];
    
    [op operationCompleted:reqid withUserData:userdata andResults:result];
    
    return reqid++;
}

-(int) asyncUploadFile:(NSURL*)addr
             withParam:(NSDictionary*)param
              userData:(NSObject*)userdata
          completionOp:(AsyncOperationCompleted*)op;
{
    if( [self uploadFile:addr withParam:param] )
    {
        return -1;
    }
    
    NSDictionary* entry = results[[addr absoluteString]];
    
    [op operationCompleted:reqid withUserData:userdata andResults:entry[Data]];
    
    return reqid++;
}

-(void)cancelPendOperation:(int)opid
{
}


@end
