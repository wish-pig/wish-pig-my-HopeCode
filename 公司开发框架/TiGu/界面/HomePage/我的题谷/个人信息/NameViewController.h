//
//  NameViewController.h
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-26.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SendValue <NSObject>

-(void)Sendfieldname:(NSString*)name;

@end
@class UserItem;
@interface NameViewController : UIViewController<UITextFieldDelegate>
{
    UITextField* fieldname;
    UILabel* labelnametip;
    BOOL everchange;
    UserItem* infoItem;
}
@property (nonatomic,assign) id<SendValue>delegate;
@property (nonatomic,retain) NSString* currentname;
@end
