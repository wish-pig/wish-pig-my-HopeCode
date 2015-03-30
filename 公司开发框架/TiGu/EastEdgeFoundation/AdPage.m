//
//  AdPage.m
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-8.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "AdPage.h"

@implementation AdPage
{
    NSMutableArray* _adArray;
}
-(id)init
{
    if( self = [super init])
    {
        _adArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray*)getMessages
{
    return _adArray;
}

- (void)dealloc
{
    [_adArray release];
    [super dealloc];
}

//获取广告页
-(void)fetchadurlwithtoken:(NSString*)devicetoken andMode:(NSString *)mode
{
    NSString* adurl = [NSString stringWithFormat:@"%@/%@",TIGU_URL,TIGU_GETAD_URL];
    
    NSDictionary* temdic = [NSDictionary dictionaryWithObjectsAndKeys:devicetoken,@"mac", nil];
    
    EFBlock block = ^(NSDictionary* result )
    {
        NSLog(@"result : %@",result[Json]);
        for (NSMutableArray* cont in [result[Json] objectForKey:@"data"])
        {
//            XXObject *obj = [result[Json] toObject];
//            [_adArray addObject:obj];
        }
        [self notifyDelegates:mode];
        
    };
    
    ReceiveDataOperation* op = [[ReceiveDataOperation alloc] initWithBlock:block];
    
    [self sendRequest:[NSURL URLWithString:adurl] forceRefresh:YES withParam:temdic completionOp:op];
    
}

@end
