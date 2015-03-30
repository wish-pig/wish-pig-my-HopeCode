//
//  ClassCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "ClassCtrl.h"

@interface ClassCtrl ()

@end

@implementation ClassCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
