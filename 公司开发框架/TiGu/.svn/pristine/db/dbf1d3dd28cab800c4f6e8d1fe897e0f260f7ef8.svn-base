//
//  SearchQuestion.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-2.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "BaseObject.h"

@interface SearchQuestion : BaseObject


//上传图片搜题
-(void)uploadpictoquestionwithpic:(UIImage*)photo;
                     //completionOp:(ReceiveDataOperation *)op;
//收藏题目
-(void)collectionquestioncreatewithqid:(NSNumber*)qid;
//取消收藏题目
-(void)collectionquestiondeletewithqid:(NSNumber*)qid;
//获取收藏列表
-(void)fetchfavoriteList:(NSNumber*)pageno deadline:(NSDate*)date;
//打分评价
-(void)scoreevaluation:(NSNumber*)score withqid:(NSNumber*)qid withevaluation:(NSString*)evaluation;
//获取题目打分首页
-(void)fetchevaluationhomepage:(NSNumber*)qid;
//获取题目评价列表
-(void)fetchevaluationList:(NSNumber*)qid withpageno:(NSNumber*)pageno;
//获取打分评价详细信息
-(void)fetchquestionevaluation:(NSNumber*)evald withpageno:(NSNumber*)pageno ;
//对打分评价进行评论
-(void)fetchquestioncomment:(NSNumber*)evald withcontent:(NSString*)content ;
//给打分赞同、反对
-(void)fetchcommentstanding:(NSNumber*)evaid withvalue:(NSNumber*)value ;
//获取分享地址
-(void)fetchquestionshareUrl:(NSNumber*)qid ;
//纠错
-(void)questionerror:(NSNumber*)qid withcontent:(NSString*)content ;
//改进
-(void)questionimprovement:(NSNumber*)qid withpic:(UIImage*)pic ;
//获取最新搜索结果消息
-(void)fetchNewestQuestList;
//提交二维码
-(void)commitTwoDimensionalCode:(NSString*)twodimensionalcode ;

-(NSMutableArray*)getQuestions;

@end
