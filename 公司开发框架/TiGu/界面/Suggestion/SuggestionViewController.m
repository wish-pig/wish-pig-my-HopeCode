//
//  SuggestionViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "SuggestionViewController.h"
#import "GlobalSetting.h"
#import "Evaluation.h"
#import "CBTextView.h"
@interface SuggestionViewController ()

@end

@implementation SuggestionViewController
@synthesize adviceArr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    adviceArr = [NSMutableArray array];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"title.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"建议";
    [self creatUI];
    [self setTextViewPlaceHolder];
    
    
}
- (void)creatUI
{
    if (SystemVersion >= 7.0) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.modalPresentationCapturesStatusBarAppearance = NO;
//        self.navigationController.navigationBar.translucent = NO;
        
        bgview = [[UIView alloc]init];
        bgview.frame = FRAME;
        bgview.backgroundColor = [UIColor clearColor];
        
        labelsuggest = [[UILabel alloc]init];
        labelsuggest.frame = CGRectMake(FRAME.origin.x + 5, FRAME.size.height - 500,55, 28);
        labelsuggest.text = @"建议内容:";
        labelsuggest.backgroundColor = [UIColor clearColor];
        labelsuggest.font = [UIFont systemFontOfSize:LABELSUGGESTION_FONTSIZE];
        
        labelcontact = [[UILabel alloc]init];
        labelcontact.frame = CGRectMake(FRAME.origin.x + 5, FRAME.size.height - 325, 55, 28);
        labelcontact.backgroundColor = [UIColor clearColor];
        labelcontact.font = [UIFont systemFontOfSize:LABELSUGGESTION_FONTSIZE];
        labelcontact.text = @"联系方式:";
        
        
        textviewsuggestion = [[UITextView alloc] initWithFrame:CGRectMake(FRAME.origin.x + 10, FRAME.size.height - 470, 300, 140)];
        
        textviewsuggestion.layer.borderColor = [UIColor grayColor].CGColor;
        textviewsuggestion.layer.borderWidth =1.0;
        textviewsuggestion.layer.cornerRadius =5.0;
     
        textviewsuggestion.contentInset = UIEdgeInsetsZero;
        [bgview addSubview:textviewsuggestion];
        
        
        fieldcontact = [[UITextField alloc]init];
        fieldcontact.frame = CGRectMake(FRAME.origin.x + 10, FRAME.size.height - 300,300, 25);
        fieldcontact.placeholder = @"你的姓名，手机号，邮箱等";
        fieldcontact.layer.borderColor = [UIColor grayColor].CGColor;
        fieldcontact.layer.borderWidth =1.0;
        fieldcontact.layer.cornerRadius =5.0;
        fieldcontact.font = [UIFont systemFontOfSize:LABELSUGGESTION_FONTSIZE];
        fieldcontact.delegate = self;
        fieldcontact.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        
        btnsubmit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnsubmit.frame = CGRectMake(FRAME.origin.x + 140, FRAME.size.height - 250, 60, 30);
        [btnsubmit setTitle:@"提交" forState:UIControlStateNormal];
        [btnsubmit addTarget:self action:@selector(btnsubmitClicked) forControlEvents:UIControlEventTouchUpInside];
        
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
        [nc addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
        
        
        [self.view addSubview:bgview];
        [bgview addSubview:fieldcontact];
        [bgview addSubview:labelsuggest];
        [bgview addSubview:labelcontact];
        [bgview addSubview:btnsubmit];
        
        [fieldcontact release];
        [labelcontact release];
        [labelsuggest release];
        [bgview release];

    }else{
        bgview = [[UIView alloc]init];
        bgview.frame = FRAME;
        bgview.backgroundColor = [UIColor clearColor];
        
        labelsuggest = [[UILabel alloc]init];
        labelsuggest.frame = CGRectMake(5, 10, 55, 28);
        labelsuggest.text = @"建议内容:";
        labelsuggest.backgroundColor = [UIColor clearColor];
        labelsuggest.font = [UIFont systemFontOfSize:LABELSUGGESTION_FONTSIZE];
        
        labelcontact = [[UILabel alloc]init];
        labelcontact.frame = CGRectMake(5, 175, 55, 28);
        labelcontact.backgroundColor = [UIColor clearColor];
        labelcontact.font = [UIFont systemFontOfSize:LABELSUGGESTION_FONTSIZE];
        labelcontact.text = @"联系方式:";
        
        
        textviewsuggestion = [[UITextView alloc]init];
        //textviewsuggestion.text = @"请留下您的宝贵意见";
        textviewsuggestion.frame = CGRectMake(10, 40, 300, 140);
        textviewsuggestion.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textviewsuggestion.layer.borderWidth =1.0;
        textviewsuggestion.layer.cornerRadius =5.0;

        
//        textViewsuggestion = [[CBTextView alloc]init];
//        textViewsuggestion.placeHolder = @"请留下您的宝贵意见";
//        textViewsuggestion.frame = CGRectMake(10, 40, 300, 140);
//        textViewsuggestion.layer.borderColor = [UIColor lightGrayColor].CGColor;
//        textViewsuggestion.layer.borderWidth =1.0;
//        textViewsuggestion.layer.cornerRadius =5.0;
        
        fieldcontact = [[UITextField alloc]init];
        fieldcontact.frame = CGRectMake(10, 200, 300, 25);
        fieldcontact.placeholder = @"你的姓名，手机号，邮箱等";
        fieldcontact.layer.borderColor = [UIColor lightGrayColor].CGColor;
        fieldcontact.layer.borderWidth =1.0;
        fieldcontact.layer.cornerRadius =5.0;
        fieldcontact.font = [UIFont systemFontOfSize:LABELSUGGESTION_FONTSIZE];
        fieldcontact.delegate = self;
        fieldcontact.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        
        btnsubmit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnsubmit.frame = CGRectMake(140, 230, 60, 30);
        [btnsubmit setTitle:@"提交" forState:UIControlStateNormal];
        [btnsubmit addTarget:self action:@selector(btnsubmitClicked) forControlEvents:UIControlEventTouchUpInside];
        
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
        [nc addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
        
        
        [self.view addSubview:bgview];
        [bgview addSubview:textviewsuggestion];
        [bgview addSubview:fieldcontact];
        [bgview addSubview:labelsuggest];
        [bgview addSubview:labelcontact];
        [bgview addSubview:btnsubmit];
        
        [fieldcontact release];
        [labelcontact release];
        [labelsuggest release];
        [bgview release];

    }
}
-(void)setTextViewPlaceHolder
{
    if (textviewsuggestion.text.length == 0 || textviewsuggestion ) {
        textviewsuggestion.text = @"请留下您的宝贵意见";
        textviewsuggestion.textColor = [UIColor lightGrayColor];
    }
}

-(void)dataObjectChanged:(NSString *)object
{
    Evaluation* evaObj = (Evaluation*)self.userData;
    adviceArr = [evaObj getMessages];
}



-(void)btnsubmitClicked
{
    
    NSLog(@"advice  %@",textviewsuggestion.text);
    NSLog(@"contact %@",fieldcontact.text);
#pragma mark ===+++ 接口连不通 +++===
    if (textviewsuggestion.text.length && fieldcontact.text.length != 0)
    {
        self.userData = [[Evaluation alloc]init];
        [(Evaluation*)self.userData commitAdvice:textviewsuggestion.text withcontact:fieldcontact.text];
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提交成功" message:@"感谢您对我们的支持" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else{
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"提交成功" message:@"请您填写完整" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
}



-(void)keyboardHidden:(NSNotification*)notify
{
    CGRect frame = [[UIScreen mainScreen]bounds];
    NSDictionary* dict = [notify userInfo];
    double t = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:t];
    bgview.frame = frame;
    [UIView commitAnimations];
}

-(void)keyboardShow:(NSNotification*)notify
{
    if (SystemVersion >= 7.0) {
        CGRect frame = [[UIScreen mainScreen]bounds];
        NSDictionary* dict = [notify userInfo];
        CGRect bounds = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
        CGFloat h = bounds.size.height;
        double t = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:t];
        bgview.frame = CGRectMake(0, 177-h, frame.size.width, frame.size.height);
        [UIView commitAnimations];
    }
    else{
        CGRect frame = [[UIScreen mainScreen]bounds];
        NSDictionary* dict = [notify userInfo];
        CGRect bounds = [[dict objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
        CGFloat h = bounds.size.height;
        double t = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:t];
        bgview.frame = CGRectMake(0, 177-h, frame.size.width, frame.size.height);
        [UIView commitAnimations];
        
    }
    
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    textviewsuggestion.contentInset = UIEdgeInsetsZero;

    if ([GlobalSetting getglobalset].isGlobal == YES) {
        NSLog(@"IS ALLOW 3G");
    }else{
        NSLog(@"FORBID 3G");
    }
    
    NSLog(@"usrid %@",[GlobalSetting getusrid].usrid);
    
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
