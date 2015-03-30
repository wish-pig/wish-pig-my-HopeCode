//
//  Message.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-2.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "BaseObject.h"
  
struct MessageInfo{ NSString* time; NSString* content; };

@interface Message : BaseObject

//获取消息
-(void)fetchmsgList:(NSNumber*)pageno;
//消息被读取
-(void)msgareread:(NSNumber*)msgId ;
//删除消息
-(void)msgdelete:(NSNumber*)msgId;

-(NSMutableArray*)getMessages;

@end
