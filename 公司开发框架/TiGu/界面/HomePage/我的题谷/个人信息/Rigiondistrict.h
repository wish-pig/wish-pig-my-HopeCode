//
//  Rigiondistrict.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-10.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFViewController.h"
@interface Rigiondistrict : EFViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* mTableView;
    NSMutableArray* regionDistrict;
}

@property (retain, nonatomic) NSString *cityid;
@property (retain, nonatomic) NSMutableArray* coutryid;
@end
