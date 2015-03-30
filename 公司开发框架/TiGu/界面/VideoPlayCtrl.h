//
//  VideoPlayCtrl.h
//  TiGu
//
//  Created by Adam on 14-1-8.
//  Copyright (c) 2014年 咖啡可乐. All rights reserved.
//

#import "EFViewController.h"
#import "CustomPlayerView.h"
#import <MediaPlayer/MediaPlayer.h>
@interface VideoPlayCtrl : EFViewController
{
    NSString *_movieUrl;
    NSString *_movieName;
    NSString *_movieDownUrl;
    UIView *Pause;
    CGFloat  totalMovieDuration;
    CGFloat  currentDuration;
    UISlider *_movieProgressSlider;
    UIProgressView  *_progressView;
    BOOL     isPlaying;
    BOOL     isComment;
    BOOL     frameChange;
    
    UIView *a;
    MPMoviePlayerViewController *playerViewController;
    UIView *b;
    UIButton *leftBtn1;
    UIButton *leftBtn2;
    UIButton *leftBtn3;
    UIButton *leftBtn4;
    UIButton *leftBtn5;
    
    
}
@property (retain, nonatomic) IBOutlet UIButton *backBtn;
@property (retain, nonatomic) IBOutlet UIImageView *titleImgView;
@property (retain, nonatomic) IBOutlet CustomPlayerView *playerView;
@property (retain, nonatomic) IBOutlet UIWebView *txtWebView;
@property (retain, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (retain, nonatomic) IBOutlet UILabel *durationLabel;
@property (retain, nonatomic) IBOutlet UIButton *playAndpauseBtn;
@property (retain, nonatomic) IBOutlet UIButton *slowBtn;
@property (retain, nonatomic) IBOutlet UIButton *fastBtn;
#pragma mark +++++添加事件++++++
- (IBAction)GetBack:(id)sender;
- (IBAction)SlowDown:(id)sender;
- (IBAction)PlayorPause:(id)sender;
- (IBAction)SpeedUp:(id)sender;


@end
