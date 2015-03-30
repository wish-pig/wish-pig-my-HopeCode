//
//  Evaluation.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-8.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "BaseObject.h"

@interface Evaluation : BaseObject

//获取我的评价首页
-(void)fetchmyevaluationhomepage;
//获取我的评价列表
-(void)fetchmyEvaluationList:(NSNumber*)pageno;
//获取我参与的评价列表
-(void)fetchmyReferredList:(NSNumber*)pageno;
//提交建议
-(void)commitAdvice:(NSString*)advice withcontact:(NSString*)contact;
//获取邀请信息
-(void)fetchinviteeList;
//提交邀请人ID
-(void)commitInviterid:(NSString*)inviterId;

-(NSMutableArray*)getMessages;

@end
