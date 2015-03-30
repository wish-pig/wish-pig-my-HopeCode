//
//  AdPage.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-8.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "BaseObject.h"

@interface AdPage : BaseObject

-(void)fetchadurlwithtoken:(NSString*)devicetoken andMode:(NSString *)mode;

-(NSArray*)getImages;

@end
