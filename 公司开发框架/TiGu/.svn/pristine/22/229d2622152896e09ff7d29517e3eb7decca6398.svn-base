//
//  ChangePwdCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "ChangePwdCtrl.h"

@interface ChangePwdCtrl ()

@end

@implementation ChangePwdCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fieldConfirm.delegate = self;
    self.fieldPwd.delegate = self;
    self.navigationItem.title = @"更改密码";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarbuttonClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    if (SystemVersion >= 7.0) {
        self.labelpwdchange.frame = CGRectMake(FRAME.origin.x+20, FRAME.origin.y+100, 275, 20);
        self.fieldPwd.frame = CGRectMake(FRAME.origin.x+20, FRAME.origin.y+128, 275, 30);
        self.fieldConfirm.frame = CGRectMake(FRAME.origin.x+20, FRAME.origin.y+174, 275, 30);
    }
    
}
- (void) BarbuttonClick
{
    
    if (![self.fieldConfirm.text isEqualToString:self.fieldPwd.text]) {
        UIAlertView *confirmAlert = [[UIAlertView alloc]initWithTitle:nil message:@"两次输入密码不一致，请重新输入" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [confirmAlert show];
        [confirmAlert release];
        
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(ConfirmPwd) userInfo:nil repeats:NO];
        confirmAlertView = [[UIAlertView alloc]initWithTitle:@"修改成功" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [confirmAlertView show];
        
    }
}
- (void)ConfirmPwd
{
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(PushView) userInfo:nil repeats:NO];
    [confirmAlertView dismissWithClickedButtonIndex:0 animated:0];
    
    
}
- (void)PushView
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.fieldPwd resignFirstResponder];
    [self.fieldConfirm resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_fieldPwd release];
    [_fieldConfirm release];
    [_labelpwdchange release];
    [super dealloc];
}
@end
