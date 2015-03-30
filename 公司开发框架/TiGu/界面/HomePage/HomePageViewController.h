//
//  HomePageViewController.h
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFViewController.h"
#import "AppDelegate.h"
#import "ZBarSDK.h"

@interface HomePageViewController : EFViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,ZBarReaderDelegate>
{
    UIImageView *adImgView;
    UIButton *psearchBtn;
    UIButton *scanBtn;
    UIButton *myLibBtn;
    UIButton *msgBtn;
    UIButton *historyBtn;
    NSMutableArray* dataArray;
    NSMutableArray* qrcodeArr;
    UIButton* cancelBtn;
    BOOL isScan;
}
- (void)scan;
@property (copy,nonatomic) NSString* twocode;
@property (retain,nonatomic) NSMutableArray* dataArray;
@property (retain, nonatomic ) NSMutableArray* qrcodeArr;

@end
