//
//  LoginViewController.h
//  TiGu
//
//  Created by Adam on 13-12-20.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "EFViewController.h"
#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "BaseObject.h"
@interface LoginViewController : EFViewController <UITextFieldDelegate>
{
    NSMutableArray* dataArray;
}
@property (retain, nonatomic) NSMutableArray* dataArray;
@property (retain, nonatomic) UITextField *lNickTextField;
@property (retain, nonatomic) UITextField *lPwdTextField;
@property (retain, nonatomic) UIButton    *loginBtn;


@end
