//
//  SignatureCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "SignatureCtrl.h"

@interface SignatureCtrl ()

@end

@implementation SignatureCtrl

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
    // Do any additional setup after loading the view from its nib.
    if (SystemVersion >= 7.0) {
        self.textviewSignature.frame = CGRectMake(FRAME.origin.x+10, FRAME.origin.y+74, FRAME.size.width-20, 130);
    }
    self.navigationItem.title = @"个性签名";
    self.textviewSignature.layer.borderColor = [UIColor blackColor].CGColor;
    self.textviewSignature.layer.borderWidth =1.0;
    self.textviewSignature.layer.cornerRadius =5.0;
    self.textviewSignature.returnKeyType =UIReturnKeyDone;
    
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"GGGG");
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"SIGN");
    NSLog(@"signature %@",self.textviewSignature.text);
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.textviewSignature becomeFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textviewSignature resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textviewSignature release];
    [super dealloc];
}
@end
