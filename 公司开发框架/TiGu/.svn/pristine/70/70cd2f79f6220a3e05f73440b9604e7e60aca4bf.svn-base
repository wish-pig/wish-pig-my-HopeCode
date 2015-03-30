//
//  AlterAccountCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "AlterAccountCtrl.h"
#import "MyAccountCtrl.h"
@interface AlterAccountCtrl ()

@end

@implementation AlterAccountCtrl

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
    self.navigationItem.title = @"修改题谷账号";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarbuttonClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    if (SystemVersion >= 7.0) {
        self.fieldChangeAccount.frame = CGRectMake(FRAME.origin.x + 40, FRAME.origin.y + 94, 240, 30);
        self.labelaccount1.frame = CGRectMake(FRAME.origin.x + 44, FRAME.origin.y+68, 225, 20);
        self.labrelaccount2.frame = CGRectMake(FRAME.origin.x + 44, FRAME.origin.y+126, 225, 20);
    }
    
    
}
- (void)BarbuttonClick{
    [self.navigationController popViewControllerAnimated:YES];


}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSString *str = self.fieldChangeAccount.text;
    NSLog(@"Str = >%@",str);
    [self.fieldChangeAccount resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_fieldChangeAccount release];
    [_labelaccount1 release];
    [_labrelaccount2 release];
    [super dealloc];
}
@end
