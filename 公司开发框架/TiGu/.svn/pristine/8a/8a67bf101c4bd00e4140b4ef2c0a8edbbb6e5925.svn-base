//
//  RegionAlertView.m
//  TiGu
//
//  Created by Adam on 13-12-30.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "RegionAlertView.h"

@implementation RegionAlertView
@synthesize regionLabel,btnCancel,btnConfirm,btn;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self != nil) {
        
        self.regionLabel = [self createLabel:nil withFrame:CGRectMake(FRAME.origin.x, 55, 280, 25)];
        self.regionLabel.backgroundColor = [UIColor clearColor];
        self.regionLabel.textAlignment = NSTextAlignmentCenter;
        self.regionLabel.font = [UIFont systemFontOfSize:15];
        self.regionLabel.textColor = [UIColor whiteColor];
        [self addSubview:regionLabel];
        if (FRAME.size.height <= 480) {
            self.btnConfirm = [self createButtonwithFrame:CGRectMake(FRAME.origin.x + 15,FRAME.size.height - 390, 120, 44)];
            self.btnCancel = [self createButtonwithFrame:CGRectMake(FRAME.origin.x + 145,FRAME.size.height - 390, 120, 44)];
        }else{
            self.btnConfirm = [self createButtonwithFrame:CGRectMake(FRAME.origin.x + 15, FRAME.size.height - 480, 120, 44)];
            self.btnCancel = [self createButtonwithFrame:CGRectMake(FRAME.origin.x + 145, FRAME.size.height - 480, 120, 44)];
            
        }
        
        self.btnConfirm.tag  = 107;
        [self.btnConfirm addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnConfirm setTitle:@"确认" forState:UIControlStateNormal];
        
        
        self.btnCancel.tag = 108;
        [self.btnCancel addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnCancel setTitle:@"取消" forState:UIControlStateNormal];
        
        
        
        [self addSubview:btnConfirm];
        [self addSubview:btnCancel];
        
        
        
        
    }
    return self;
}
- (void)BtnClicked:(UIButton *)button
{
    if (button.tag == 107) {
        [self dismissWithClickedButtonIndex:0 animated:YES];
    }else if (button.tag == 108){
        [self dismissWithClickedButtonIndex:0 animated:YES];
    }
}
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
- (void) setFrame:(CGRect)frame
{
    
    [super setFrame:CGRectMake(FRAME.origin.x + 20,FRAME.size.height - 380, 280, 150)];
    //[super setFrame:CGRectMake(2,70, 320, 250)];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
