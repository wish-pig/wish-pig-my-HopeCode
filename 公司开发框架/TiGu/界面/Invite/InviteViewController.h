//
//  InviteViewController.h
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InviteViewController : UIViewController<UITextFieldDelegate>
{
    UIView* imgviewbg;
    UITextField* fieldnum;
    UILabel* labelcode;
    UILabel* labeltip;
    UILabel* labelinvite;
    UILabel* labeltip2;
    UIButton* btninvite;
    UIButton* okBtn;
}
@end
