//
//  NameViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-26.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "NameViewController.h"
#import "PersonInformationViewController.h"
#import "MyDatabase.h"
#import "UserItem.h"
@interface NameViewController ()

@end

@implementation NameViewController

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
	// Do any additional setup after loading the view.
    everchange = YES;
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"名字";
    
    labelnametip = [[UILabel alloc]init];
    
    if (SystemVersion >= 7.0) {
        fieldname = [[UITextField alloc]initWithFrame:CGRectMake(FRAME.origin.x+20, FRAME.origin.y+74, 280, 30)];
        labelnametip.frame = CGRectMake(FRAME.origin.x+22, FRAME.origin.y+104, 280, 30);
    }else{
    fieldname = [[UITextField alloc]initWithFrame:CGRectMake(FRAME.origin.x+20, FRAME.origin.y+10, 280, 30)];
        labelnametip.frame = CGRectMake(FRAME.origin.x+22, FRAME.origin.y+40, 280, 30);
    }
    fieldname.textAlignment = NSTextAlignmentLeft;
    fieldname.clearButtonMode = UITextFieldViewModeWhileEditing;
    fieldname.borderStyle = UITextBorderStyleRoundedRect;
    fieldname.returnKeyType =UIReturnKeyDone;
    fieldname.delegate = self;
    fieldname.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    fieldname.layer.borderColor = [UIColor blackColor].CGColor;
    fieldname.layer.borderWidth =1.0;
    fieldname.layer.cornerRadius =5.0;
    
    labelnametip.text = @"好的名字让别人更容易记住你";
    labelnametip.font = [UIFont systemFontOfSize:LABELNAMETIP_FONTSIZE];
    [self.view addSubview:fieldname];
    [self.view addSubview:labelnametip];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSString* title = textField.text;
    infoItem.name = title;

    MyDatabase *mDB = [MyDatabase shareDatabase];
    if([mDB isExistsItem:infoItem InTable:DBNAME])
    {
        [mDB deleteItem:infoItem Intable:DBNAME];
    }
    [mDB insertItem:infoItem InTable:DBNAME];
    
    NSLog(@"title %@",title);
    [self.delegate Sendfieldname:title];
    if ([_delegate respondsToSelector:@selector(Sendfieldname:)]) {
        [_delegate Sendfieldname:title];
    }
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
