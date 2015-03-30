//
//  ExternalDataLayer.h
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-8-22.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"
#import "NSString+SBJSON.h"

static NSString* const Data = @"data";
static NSString* const Type = @"type";
static NSString* const Json = @"json";
static NSString* const Xml = @"xml";


@protocol AsyncOperationCompletedProto
-(void)operationCompleted:(int)reqid withUserData:(NSObject*)userdata andResults:(NSDictionary*)result;
@end

@interface AsyncOperationCompleted : NSObject 
-(void)operationCompleted:(int)reqid withUserData:(NSObject *)userdata andResults:(NSDictionary *)result;
-(void)operationFailed:(int)reqid withUserData:(NSObject*)userdata;
@end

//this class should never be instantialised
@interface ExternalDataLayer : NSObject

+(ExternalDataLayer*)createHttpLayer;
+(ExternalDataLayer*)createLocalLayerFromFile:(NSString*)file checkParam:(BOOL)yn;
+(ExternalDataLayer*)createDataLayer;

//synchronised data operations
-(NSDictionary*) sendGetRequest:(NSURL*)addr withParam:(NSDictionary*)param;
-(NSDictionary*) sendPostRequest:(NSURL*)addr withParam:(NSDictionary*)param;
-(NSDictionary*) downloadFile:(NSURL*)addr;
-(BOOL) uploadFile:(NSURL*)addr withParam:(NSDictionary*)param;

//asynchronised data operations
-(int) asyncSendGetRequest:(NSURL*)addr
              withParam:(NSDictionary*)param
               userData:(NSObject*)userdata
           completionOp:(AsyncOperationCompleted*)op;
-(int) asyncSendPostRequest:(NSURL*)addr
              withParam:(NSDictionary*)param
               userData:(NSObject*)userdata
           completionOp:(AsyncOperationCompleted*)op;

-(int) asyncDownloadFile:(NSURL*)addr withUserData:(NSObject*)userdata completionOp:(AsyncOperationCompleted*)op;

-(int) asyncUploadFile:(NSURL*)addr
             withParam:(NSDictionary*)param
              userData:(NSObject*)userdata
          completionOp:(AsyncOperationCompleted*)op;

-(void) cancelPendOperation:(int)opid;

@end
