//
//  PersonInformationViewController.h
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-23.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFViewController.h"
#import "NameViewController.h"
#import "ExternalDataLayer.h"
#import "LocalLayer.h"
@interface PersonInformationViewController :EFViewController <UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,SendValue>
{
    UITableView* tableviewperson;
    NSMutableArray* dataArrayperson;
    UIImage* photoimage;
    UIImage *img;
    NSMutableArray* dataArray;
    NSArray* personArray;
}
@property (retain, nonatomic) NSMutableArray* dataArray;
@property (retain, nonatomic) NSMutableArray* dataArrayperson;
@property (retain, nonatomic) NSArray* personArray;
@property (nonatomic,copy)    NSString *dbName;
@end
