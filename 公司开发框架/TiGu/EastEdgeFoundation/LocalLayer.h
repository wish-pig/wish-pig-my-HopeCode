//
//  LocalLayer.h
//  EastedgeFoundation
//
//  Created by 严登峰 on 13-8-22.
//  Copyright (c) 2013年 严登峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExternalDataLayer.h"
@interface LocalLayer : ExternalDataLayer
-(id)initWithFile:(NSString*)file checkParam:(BOOL)yorn;
@end
