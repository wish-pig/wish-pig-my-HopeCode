//
//  MessageViewController.h
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-25.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFViewController.h"
@interface MessageViewController : EFViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* tableviewmsg;
    NSMutableArray* dataArray;
    NSMutableArray* msgidArr;
}
@property (nonatomic,retain) NSMutableArray* dataArray;
@property (nonatomic,retain) NSMutableArray* msgidArr;
@end
