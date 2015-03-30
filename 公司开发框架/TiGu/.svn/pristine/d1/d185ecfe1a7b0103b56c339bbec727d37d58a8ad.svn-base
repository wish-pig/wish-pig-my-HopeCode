//
//  GuideViewController.h
//  TiGu
//
//  Created by Adam on 13-12-20.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "EFViewController.h"
#import "LoginViewController.h"
#import "SDWebDataDownloader.h"
#import "SDImageView+SDWebCache.h"
#import "SDDataCache.h"
@interface GuideViewController : EFViewController <UIScrollViewDelegate,SDWebDataDownloaderDelegate>
{
    SDWebDataDownloader *mdownloader;
    NSMutableArray *localUrlArr;
    LoginViewController *loginView;
    NSMutableArray* addataArr;
    NSMutableArray *localImgArr;
    NSMutableArray *tmpArr;
    SDDataCache *localImgdata;
    
}
@property (nonatomic, retain) UIImageView *gimageView;
@property (nonatomic, retain) UIScrollView *gPageScroll;
@property (nonatomic, retain) UIPageControl *gPageControl;
@property (nonatomic, retain) UIButton *gPassBtn;
@property (retain, nonatomic) NSMutableArray * addataArr;
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName;
- (UIImage *)getPhotoFromName:(NSString *)name;


@end
