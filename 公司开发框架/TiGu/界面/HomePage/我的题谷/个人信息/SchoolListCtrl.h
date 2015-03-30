//
//  SchoolListCtrl.h
//  TiGu
//
//  Created by 咖啡可乐 on 14-1-16.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "EFViewController.h"

@interface SchoolListCtrl : EFViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* mTableview;
    NSMutableArray* schArray;
}
@property (retain,nonatomic) NSMutableArray* schArray;
@end
