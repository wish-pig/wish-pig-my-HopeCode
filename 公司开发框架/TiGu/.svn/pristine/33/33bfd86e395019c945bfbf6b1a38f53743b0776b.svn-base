//
//  SexAlertView.m
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "SexAlertView.h"

@implementation SexAlertView
@synthesize btnFemale,btnMale,labelFemale,labelMale,btn,btnConfirm;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    __RELEASE_ALL__(btnFemale);
    __RELEASE_ALL__(btnMale);
    __RELEASE_ALL__(labelFemale);
    __RELEASE_ALL__(labelMale);
    __RELEASE_ALL__(btn);
    __RELEASE_ALL__(btnConfirm);
    [super dealloc];
}

- (id) initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self != nil) { // 初始化自定义控件，
        self.labelFemale = [self createLabel:@"男" withFrame:CGRectMake(50, 55,25,25)];
        self.labelFemale.backgroundColor = [UIColor clearColor];
        self.labelFemale.font = [UIFont systemFontOfSize:15];
        self.labelFemale.textColor = [UIColor whiteColor];
        
        [self addSubview:labelFemale];
        self.labelMale = [self createLabel:@"女" withFrame:CGRectMake(50, 100, 25, 25)];
        self.labelMale.backgroundColor = [UIColor clearColor];
        self.labelMale.font = [UIFont systemFontOfSize:15];
        self.labelMale.textColor = [UIColor whiteColor];
        
        [self addSubview:self.labelMale];
   
        
        
        self.btnFemale = [self createButtonwithFrame:CGRectMake(220, 55,25,25)];
        self.btnFemale.tag = 7;
        [self.btnFemale addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnFemale];
        self.btnMale = [self createButtonwithFrame:CGRectMake(220, 100, 25, 25)];
        self.btnMale.tag = 8;
        [self.btnMale addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnMale];
        
        self.btnConfirm = [self createButtonwithFrame:CGRectMake(70,140, 150, 40)];
        [self.btnConfirm setTitle:@"确定" forState:UIControlStateNormal];
        [self addSubview:btnConfirm];
        
        
        
        
    }
    return self;
    
}
- (void) BtnClicked:(UIButton *)button
{
    if (button.tag == 7)      {
        //[self dismissWithClickedButtonIndex:0 animated:YES];
    }else if (button.tag == 8){
        //[self dismissWithClickedButtonIndex:0 animated:YES];
    }
}
- (void) setFrame:(CGRect)frame
{
    
    [super setFrame:CGRectMake(FRAME.origin.x + 20,FRAME.size.height - 280, 280, 200)];
    //[super setFrame:CGRectMake(2,70, 320, 250)];
    
}
//- (void) layoutSubviews
//{
//    [super layoutSubviews];// 当override父类的方法时，要注意一下是否需要调用父类的该方法
//    for (UIView *view in self.subviews) { // 搜索Alertview底部的按钮，然后将其位置下移
//        
//        if ([view isKindOfClass:NSClassFromString(@"UIThreePartButton")]) {
//            CGRect btnBounds = view.frame;
//            btnBounds.origin.y  = self.labelMale.frame.origin.y +self.labelMale.frame.size.height + 7;
//            view.frame = btnBounds;
//            
//        }
//    }
//    CGRect bounds = self.frame;
//    bounds.size.height = 260;
//    self.frame = bounds;
//    
//}
- (UIButton *) createButtonwithFrame:(CGRect) frame{
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = frame;
    
    return btn;
    
}
- (UILabel *) createLabel:(NSString *)content withFrame:(CGRect )frame {
    UILabel *label = [[[UILabel alloc]initWithFrame:frame]autorelease];
    label.text = content;
    
    
    
    
    return label;
    
    
}
@end
