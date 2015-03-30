//
//  ChangePwdCtrl.h
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePwdCtrl : UIViewController <UITextFieldDelegate>
{
    UIAlertView *confirmAlertView;
    
}
@property (retain, nonatomic) IBOutlet UILabel *labelpwdchange;
@property (retain, nonatomic) IBOutlet UITextField *fieldPwd;
@property (retain, nonatomic) IBOutlet UITextField *fieldConfirm;

@end
