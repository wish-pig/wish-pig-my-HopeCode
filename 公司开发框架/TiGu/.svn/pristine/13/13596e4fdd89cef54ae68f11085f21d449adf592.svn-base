//
//  Pay.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-2.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "BaseObject.h"
#import "BaseObject.h"
@interface Pay : BaseObject

//获取需提交到支付宝的数据包
-(void)fetchpayapplyInfo;
//提交支付宝回调信息
-(void)commitpaycallback:(NSString*)callbackinfo;
//获取需提交到银联的数据包
-(void)fetchpayunionpayapplyInfo;
//提交银联回调信息
-(void)commitpayunionpaycallback:(NSString*)callbackinfo;

-(NSMutableArray*)getPayMessages;

@end
