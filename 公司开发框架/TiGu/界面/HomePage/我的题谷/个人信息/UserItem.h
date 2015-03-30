//
//  UserItem.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-14.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserItem : NSObject
@property (copy,nonatomic) NSString*  name;
@property (copy,nonatomic) NSString*  gender;
@property (assign,nonatomic) int  provinceid;
@property (assign,nonatomic) int  cityid;
@property (copy,nonatomic) NSString*  cityname;
@property (assign,nonatomic) int    countyid;
@property (copy,nonatomic) NSString*  countyname;
@property (assign,nonatomic) int  schoolid;
@property (copy,nonatomic) NSString*  schoolname;
@property (assign,nonatomic) int  gradeid;
@property (copy,nonatomic) NSString*  classname;
@property (copy,nonatomic) NSString*  signature;

@end
