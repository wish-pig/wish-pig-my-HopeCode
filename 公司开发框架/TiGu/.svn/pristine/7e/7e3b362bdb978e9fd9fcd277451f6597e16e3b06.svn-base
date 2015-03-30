//
//  SearchQuestion.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-2.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "SearchQuestion.h"
#import "GlobalSetting.h"
@implementation SearchQuestion
{
    NSMutableArray* _questArr;
}
-(id)init
{
    if( self = [super init])
    {
        _questArr = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray*)getQuestions
{
    return _questArr;
}

- (void)dealloc
{
    [_questArr release];
    [super dealloc];
}

//上传图片搜题
-(void)uploadpictoquestionwithpic:(UIImage*)photo
              //completionOp:(ReceiveDataOperation *)op
{
    
    NSString* uppicurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_UPLOADPHOTOTOQUESTION_URL];
    NSLog(@"uppic%@",uppicurl);

    NSData* datapic = UIImagePNGRepresentation(photo);

    NSDictionary *temdicImg = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",datapic,@"pic", nil];

    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc]initWithBlock:block];
    
     [self sendRequest:[NSURL URLWithString:uppicurl] forceRefresh:YES withParam:temdicImg completionOp:op];
    
}
//收藏题目
-(void)collectionquestioncreatewithqid:(NSNumber*)qid
{
    NSString* collecturl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COLLECTION_CREATE_URL];

    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",qid,@"qid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:collecturl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//取消收藏题目
-(void)collectionquestiondeletewithqid:(NSNumber*)qid
{
    NSString* delcollecturl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COLLECTION_DELETE_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",qid,@"qid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:delcollecturl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取收藏列表
-(void)fetchfavoriteList:(NSNumber*)pageno deadline:(NSDate*)date
{
    NSString* getfavurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETFAVORITELIST_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",pageno,@"pageno",date,@"", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getfavurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//打分评价
-(void)scoreevaluation:(NSNumber*)score withqid:(NSNumber*)qid withevaluation:(NSString*)evaluation
{
    NSString* scoreurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_SCORE_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",score,@"score",evaluation,@"evaluation",qid,@"qid", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:scoreurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取题目打分首页
-(void)fetchevaluationhomepage:(NSNumber*)qid
{
    NSString* getscorehomeurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_SCORE_HOMEPAGE_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",qid,@"qid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getscorehomeurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取题目评价列表
-(void)fetchevaluationList:(NSNumber*)qid withpageno:(NSNumber*)pageno
{
    NSString* getscorelisturl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_EVALUATIONLIST_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",qid,@"qid",pageno,@"pageno",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getscorelisturl] forceRefresh:YES withParam:temdic completionOp:op];
     
}
//获取打分评价详细信息
-(void)fetchquestionevaluation:(NSNumber*)evaid withpageno:(NSNumber*)pageno
{
    NSString* getevaluationurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_EVALUATION_INFO_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",evaid,@"evaId",pageno,@"pageno",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getevaluationurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//对打分评价进行评论
-(void)fetchquestioncomment:(NSNumber*)evaid withcontent:(NSString*)content
{
    NSString* commenturl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMENT_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",evaid,@"evaId",content,@"content",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:commenturl] forceRefresh:YES withParam:temdic completionOp:op];
     
}
//给打分赞同、反对
-(void)fetchcommentstanding:(NSNumber*)evaid withvalue:(NSNumber*)value
{
    
    NSString* standingurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_COMMENT_STANDING_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",evaid,@"evaId",value,@"value",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:standingurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取分享地址
-(void)fetchquestionshareUrl:(NSNumber*)qid
{
    NSString* getshareurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETSHARE_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",qid,@"qid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getshareurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//纠错
-(void)questionerror:(NSNumber*)qid withcontent:(NSString*)content
{
    NSString* errorurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_QUESTION_ERROR_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",qid,@"qid",content,@"content",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:errorurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//改进
-(void)questionimprovement:(NSNumber*)qid withpic:(UIImage*)pic
{
    NSString* improveurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_IMPROVEMENT_URL];
    
    NSData* datapic = UIImagePNGRepresentation(pic);
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",datapic,@"pic", qid,@"qid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        
        [self notifyDelegates:nil];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:improveurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//获取最新搜索结果消息
-(void)fetchNewestQuestList
{
    NSString* getquestlisturl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETSEARCHRESULT_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        for (NSMutableArray* contArr in [[result[Json]objectForKey:@"data"]objectForKey:@"qidlist"]){
            NSLog(@"contArr %@",contArr);
            [_questArr addObject:contArr];
        }
    
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:getquestlisturl] forceRefresh:YES withParam:temdic completionOp:op];
    
}
//提交二维码
-(void)commitTwoDimensionalCode:(NSString*)twodimensionalcode
{
    NSString* uptwocodeurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_UPTWODIMEN_URL];
    
    NSDictionary *temdic = [NSDictionary dictionaryWithObjectsAndKeys:[GlobalSetting getusrid].usrid,@"usrid",twodimensionalcode,@"twodimensionalcode",nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
      
        [self notifyDelegates:nil];
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:uptwocodeurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}


@end
