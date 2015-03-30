//
//  MyDatabase.h
//  YingShiDaQuan
//
//  Created by qianfeng on 13-10-23.
//  Copyright (c) 2013年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@class UserItem;
@interface MyDatabase : NSObject

{
    //声明fmdb对象
    FMDatabase *fmdb;
    //数据库文件保存路径
    NSString *fullPath;
}
+(NSString *)filePath:(NSString *)fileName;
+(MyDatabase *)shareDatabase;
-(BOOL)isExistsItem:(UserItem *)item InTable:(NSString *)tableName;
//插入一条数据
-(void)insertItem:(UserItem*)item InTable:(NSString *)tableName;
//删除一条数据
-(void)deleteItem:(UserItem *)item Intable:(NSString *)tableName;
//查找某表中所有数据
-(NSArray *)queryALLItemsInTable:(NSString *)tableName;
//删除某表中所有数据
-(void)deleteAllItemsInTable:(NSString *)tableName;


@property(nonatomic,retain) FMResultSet *fmrs;
@end
