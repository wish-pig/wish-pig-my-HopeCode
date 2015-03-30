//
//  VideoPlayCtrl.m
//  TiGu
//
//  Created by Adam on 14-1-8.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "VideoPlayCtrl.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface VideoPlayCtrl ()

@end

@implementation VideoPlayCtrl
static bool p = YES;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"12345");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    playerViewController =[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:@"http://www.jxvdy.com/file/upload/201309/18/18-10-03-19-3.mp4"]];
    [self presentMoviePlayerViewControllerAnimated:playerViewController];
    
    a = [[UIView alloc]initWithFrame:CGRectMake(playerViewController.view.frame.origin.x, playerViewController.view.frame.origin.y + 60, playerViewController.view.frame.size.width, playerViewController.view.frame.size.height - 60)];
    a.backgroundColor = [UIColor clearColor];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 100);
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [a addSubview:button];
    [playerViewController.view addSubview:a];
    [self createUI];
    MPMoviePlayerController *player = [playerViewController moviePlayer];
    player.movieSourceType = MPMediaTypeAnyVideo;
    [player play];
    
//

    
}

-(void)createUI
{
    b = [[UIView alloc]initWithFrame:CGRectMake(playerViewController.view.frame.origin.x  - 100, playerViewController.view.frame.origin.y,100, playerViewController.view.frame.size.height)];
    b.backgroundColor = [UIColor clearColor];
    leftBtn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [leftBtn1 setTitle:@"Button1" forState:UIControlStateNormal];
    leftBtn1.frame = CGRectMake(0, 50, 50, 50);
    [b addSubview:leftBtn1];
    leftBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftBtn2.frame = CGRectMake(0,125, 50, 50);
    [leftBtn2 setTitle:@"Button2" forState:UIControlStateNormal];
    [b addSubview:leftBtn2];
    leftBtn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftBtn3.frame = CGRectMake(0,200, 50, 50);
    [leftBtn3 setTitle:@"Button2" forState:UIControlStateNormal];
    [b addSubview:leftBtn3];
    leftBtn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftBtn4.frame = CGRectMake(0, 275, 50, 50);
    [leftBtn4 setTitle:@"Button2" forState:UIControlStateNormal];
    [b addSubview:leftBtn4];
    leftBtn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    leftBtn5.frame = CGRectMake(0, 350, 50, 50);
    [leftBtn5 setTitle:@"Button2" forState:UIControlStateNormal];
    [b addSubview:leftBtn5];
    
    [playerViewController.view addSubview:b];
}
-(void)BtnClick
{
    NSLog(@"1234567");
   
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        if (p) {
            
             b.frame = CGRectMake(playerViewController.view.frame.origin.x, playerViewController.view.frame.origin.y,100, playerViewController.view.frame.size.height);
            
        }else if (!p){
            b.frame = CGRectMake(playerViewController.view.frame.origin.x - 100, playerViewController.view.frame.origin.y,100, playerViewController.view.frame.size.height);
            
            
        }
        p = !p;
       
        
        
    }];
    
}
- (void) movieFinishedCallback:(NSNotification*) aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    [player stop];
    
    [player autorelease];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_backBtn release];
    [_titleImgView release];
    [_playerView release];
    [_txtWebView release];
    [_playAndpauseBtn release];
    [_slowBtn release];
    [_fastBtn release];
    
    [super dealloc];
}
- (IBAction)GetBack:(id)sender {
}

- (IBAction)SlowDown:(id)sender {
}

- (IBAction)PlayorPause:(id)sender {
}

- (IBAction)SpeedUp:(id)sender {
}
@end
