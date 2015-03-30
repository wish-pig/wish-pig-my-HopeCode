//
//  MyDatabase.m
//  YingShiDaQuan
//
//  Created by qianfeng on 13-10-23.
//  Copyright (c) 2013年 qianfeng. All rights reserved.
//

#import "MyDatabase.h"
#import "UserItem.h"
@implementation MyDatabase
@synthesize fmrs;
static MyDatabase* database = nil;
+(MyDatabase *)shareDatabase
{
    
    if(!database)
    {
        database = [[[self class]alloc]init];
    }
    return database;
}
+(NSString*)filePath:(NSString *)fileName
{
    NSString *path = NSHomeDirectory();
    path = [path stringByAppendingPathComponent:@"Library/Caches"];
    NSFileManager *fm = [NSFileManager defaultManager];
    if([fm fileExistsAtPath:path])
    {
        if(fileName && [fileName length]!=0)
        {
            path = [path stringByAppendingPathComponent:fileName];
        }
    }
    else{
        NSLog(@"指定目录不存在");
    }
    return path;
}
-(id)init
{
    if(self=[super init])
    {
        //实例化第三方数据库对象,用类方法创建,记得retain
        //如果指定的文件不存在就创建,存在不操作
        fmdb = [[FMDatabase databaseWithPath:[MyDatabase filePath:@"PersonalInfo.sqlite"]]retain];
        //打开数据库
        if([fmdb open])
        {
            //创建表
            [self createTable];
        }
    }
    return self;
}
-(void)createTable
{
    NSArray *tableNameArray = [NSArray arrayWithObjects:@"CREATE TABLE if not exists PersonalInfo (serial integer  Primary Key Autoincrement,name Varchar(64) DEFAULT NULL,gender Varchar(64) DEFAULT NULL,provinceid interger DEFAULT 0,cityid  interger DEFAULT 0,cityname Varchar(1024) DEFAULT NULL,countyid interger DEFAULT 0,countyname Varchar(1024) DEFAULT NULL,schoolid interger DEFAULT 0,schoolname Varchar(1024) DEFAULT NULL,gradeid interger DEFAULT 0,classname Varchar(1024) DEFAULT NULL,signature text)", nil];
    for(NSString *sql in tableNameArray)
    {
        if(sql.length != 0)
        {
            //执行sql语句
            //增删改,建表都用这个方法 executeUpdate
            BOOL success = [fmdb executeUpdate:sql];
            if(!success)
            {
                NSLog(@"创建表失败:%@",[fmdb lastErrorMessage]);
            }
        }
    }
}
-(BOOL)isExistsItem:(UserItem *)item InTable:(NSString *)tableName
{
    
    NSString *sql = [NSString stringWithFormat:@"select name from %@ where name=?",tableName];
    FMResultSet *rs = [fmdb executeQuery:sql,item.name];
    while([rs next])
    {
        return YES;
    }
    
    return NO;
}
-(void)insertItem:(UserItem*)item InTable:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"insert into %@ (name,gender,provinceid,cityid,cityname,countyid,countyname,schoolid,schoolname,gradeid,classname,signature) values (?,?,?,?,?,?,?,?,?,?,?,?)",tableName];
    
    if([fmdb executeUpdate:sql,item.name,item.gender,item.provinceid,item.cityid,item.cityname,item.countyname,item.schoolid,item.schoolname,item.gradeid,item.classname,item.signature])
    {
        NSLog(@"插入成功!");
    }
    else{
        NSLog(@"插入失败:%@",[fmdb lastErrorMessage]);
    }
}
-(void)deleteItem:(UserItem *)item Intable:(NSString *)tableName
{
    /*
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where albumID = ?",tableName];
    if([fmdb executeUpdate:sql,item.albumID])
    {
        NSLog(@"删除成功!");
    }
    else
    {
        NSLog(@"删除失败:%@",[fmdb lastErrorMessage]);
    }
     */
}
-(void)deleteAllItemsInTable:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"delete from %@",tableName];
    if([fmdb executeUpdate:sql])
    {
        NSLog(@"删除全部,成功");
    }
    else
    {
        NSLog(@"删除全部,失败!%@",[fmdb lastErrorMessage]);
    }
}
-(NSArray *)queryALLItemsInTable:(NSString *)tableName
{
    NSString *sql = [NSString stringWithFormat:@"select * from %@",tableName];
    FMResultSet *rs = [fmdb executeQuery:sql];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    while ([rs next]) {
        UserItem *item = [[UserItem alloc]init];
        item.name = [rs stringForColumn:@"name"];
        item.gender = [rs stringForColumn:@"gender"];
        item.provinceid = [rs intForColumn:@"provinceid"];
        item.cityid = [rs intForColumn:@"cityid"];
        item.cityname = [rs stringForColumn:@"cityname"];
        item.countyid = [rs intForColumn:@"countyid"];
        item.countyname = [rs stringForColumn:@"countyname"];
        item.schoolid = [rs intForColumn:@"schoolid"];
        item.schoolname = [rs stringForColumn:@"schoolname"];
        item.gradeid = [rs intForColumn:@"gradeid"];
        item.classname = [rs stringForColumn:@"classname"];
        item.signature = [rs stringForColumn:@"signature"];
        [array addObject:item];
        [item release];
    }
    return array;
}


@end
