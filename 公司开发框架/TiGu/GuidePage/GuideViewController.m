//
//  GuideViewController.m
//  TiGu
//
//  Created by Adam on 13-12-20.
//  Copyright (c) 2013年 Adam. All rights reserved.
//

#import "GuideViewController.h"
#import "LoginViewController.h"
#import "AdPage.h"
#import "NSString+Hashing.h"
#import "SDImageView+SDWebCache.h"
#import "AppDelegate.h"
#import "SDDataCache.h"
@interface GuideViewController ()

@end

@implementation GuideViewController
@synthesize gPageControl;
@synthesize gPageScroll;
@synthesize gPassBtn;
@synthesize addataArr;
static int num = 0;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        addataArr = [[NSMutableArray alloc]init];
        tmpArr = [[NSMutableArray alloc]init];
        localImgArr = [[NSMutableArray alloc]init];
        loginView = [[LoginViewController alloc]init];
        localUrlArr = [[NSMutableArray alloc]init];
        
        mdownloader = [[SDWebDataDownloader alloc]init];
    }
    return self;
}
- (void)dealloc
{
    [addataArr release];
    
    __RELEASE_ALL__(gPageControl);
    __RELEASE_ALL__(gPageScroll);
    __RELEASE_ALL__(_gimageView);
    __RELEASE_ALL__(gPassBtn);
    [loginView release];
    
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    //self.view.backgroundColor = [UIColor redColor];
	loginView = [[LoginViewController alloc]init];
    self.userData = [[AdPage alloc]init];
    //[(AdPage*)self.userData fetchadurlwithtoken:@"devicetoken"];

    
    

    
    //localImgdata = [[SDDataCache alloc]init];

}
- (void) createUIwithMode:(NSString *)a;
{
    // Scroll
    gPageScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(FRAME.origin.x, FRAME.origin.y,FRAME.size.width, FRAME.size.height)];
    gPageScroll.delegate = self;
    gPageScroll.pagingEnabled = YES;
    gPageScroll.contentSize = CGSizeMake(FRAME.size.width * 4,FRAME.size.height);
    gPageScroll.showsHorizontalScrollIndicator = NO;
    
    
    [self.view addSubview:gPageScroll];

    
    for (int i = 0; i < 5; i++) {
        UIImageView* imgView = [[UIImageView alloc]init];
        if (SystemVersion >= 7.0) {
            imgView.frame = CGRectMake(320*i, 20,FRAME.size.width,FRAME.size.height);
        }else{
            imgView.frame = CGRectMake(320*i, 0,FRAME.size.width,FRAME.size.height);
        }
        
        imgView.tag = 100 + i;
#pragma mark +++++++++++第一次启动+++++++++++
        if ([a isEqualToString:@"Local"]) {
            // 第一次启动
            
            // 加载图片到广告页上
            UIImage *img = [self getPhotoFromName:[NSString stringWithFormat:@"%d.png",i]];
            
            imgView.image = img;
            
            
            // 保存服务器上图片地址 存nsuserdefaults
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            // 在第一次启动时将服务器上的连接地址存于本地
            [localUrlArr addObject:[addataArr objectAtIndex:i]];
            [defaults setObject:localUrlArr forKey:@"localUrlArr"];
            [defaults synchronize];
            
            
            // 开启下载器
            for (int j = 0;j < [addataArr count]; j++) {
                mdownloader = [SDWebDataDownloader downloaderWithURL:[NSURL URLWithString:[addataArr objectAtIndex:j]] delegate:self];
                //[mdownloader start];
            }
            
            
            
            

            
            

            
        }
#pragma mark +++++++++++++++++第二次启动+++++++++++++
        else
        {
            // 第二次启动
            
            NSMutableArray *tempArr = [[NSMutableArray alloc]init];
            
            tempArr = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"localUrlArr"]];
            UIImage *img = [self getPhotoFromName:[NSString stringWithFormat:@"%d.png",i]];
            [imgView setImage:img];

        }
        
        
        [gPageScroll addSubview:imgView];

    }
    // PageControl
    gPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(90, FRAME.origin.x + 20, 140, 36)];
    gPageControl.numberOfPages = 4;
    gPageControl.currentPage = 0;
    [self.view addSubview:gPageControl];
    
    
}
#pragma mark ++++++++++++下载完成++++++++++++
- (void)dataDownloader:(SDWebDataDownloader *)downloader didFinishWithData:(NSData *)aData
{
   
    NSLog(@"下载完成");
    UIImage *images = [UIImage imageWithData:downloader.theData];
    [self saveImage:images withName:[NSString stringWithFormat:@"%d.png",num]];

//    
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"localUrlArr"]];
    

#pragma mark 11111111111
    //if ([tmpArr count] >= [addataArr count]) { // 当全部下载完时一起写入
        for (int i = 0; i < [addataArr count]; i++) {
            NSData *datas = [[SDDataCache sharedDataCache] dataFromKey:[[NSURL URLWithString:[NSString stringWithFormat:@"%@",[tempArr objectAtIndex:i]]] absoluteString]];
            
            UIImage *img = [UIImage imageWithData:datas];
            [self saveImage:img withName:[NSString stringWithFormat:@"%dee.jpg",i]];
            NSLog(@"Img");
            
#pragma mark 1111111111111
            
            
            [tmpArr addObject:downloader];
        }
   // }
    
    
    num++;
    
}


-(void)dataObjectChanged:(NSString *)object
{
    AdPage* adObj = (AdPage*)self.userData;
    for (NSDictionary* dic in [adObj getMessages]) {
        [addataArr addObject:[dic objectForKey:@"url"]];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"ad %@",addataArr);// addataArr 是用来存放服务器端链接地址的
    if( self.view )[self createUIwithMode:object];
    NSMutableArray *tempArr = [[NSUserDefaults standardUserDefaults] objectForKey:@"localUrlArr"]; // 临时数组用来存放本地的链接地址
    
    mdownloader = [SDWebDataDownloader downloaderWithURL:[NSURL URLWithString:@"http://119.253.58.107:8080/tiguAS/notify/url5.png"] delegate:self];
    //[mdownloader start];
     
    for (int i = 0; i < [addataArr count]; i++) {
        //[tempArr objectAtIndex:i]]
#pragma mark +++++++++++++判断本地地址和服务器地址是否一致+++++++
        if ([[addataArr objectAtIndex:i]isEqualToString:@"www.baidu.com"]) {
            NSLog(@"地址一致"); // 地址一致不更新本地图片，不进行下载 加载本地图片
            
        }
        else
        {
            NSLog(@"地址不一致");
            // 下载服务器上的图片
#pragma mark +++++++++下载器++++++++++++++++
            mdownloader = [SDWebDataDownloader downloaderWithURL:[NSURL URLWithString:[addataArr objectAtIndex:i]] delegate:self];
            //[mdownloader start];
            [defaults setBool:NO forKey:@"iShowed"];
#pragma mark ++++++++++++++++++++++++++++++
            NSLog(@"返回值 = >%@",[addataArr objectAtIndex:i]);
            NSLog(@"本地值 = >%@",[[defaults objectForKey:@"localUrlArr"]objectAtIndex:i]);
            localUrlArr = [NSMutableArray arrayWithArray:addataArr];
            [defaults setObject:localUrlArr forKey:@"localUrlArr"];
            
            [defaults synchronize];
            
            
        }
        
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    gPageControl.currentPage = page;
    if (gPageScroll.contentOffset.x >= 1000.0) {
        [self presentViewController:loginView animated:YES completion:nil];
    }
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.01);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    NSError *error = nil;
   // [imageData writeToFile:fullPath options:NSDataWritingAtomic error:&error];
    [imageData writeToFile:fullPath atomically:NO];
    
}
#pragma mark - 从沙盒中读照片
- (UIImage *)getPhotoFromName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *uniquePath = [paths objectAtIndex:0];
    NSString *pathst = [NSString stringWithFormat:@"%@/Caches/%@",uniquePath,name];
    BOOL blHave = [[NSFileManager defaultManager]fileExistsAtPath:uniquePath];
    if (!blHave) {
        return nil;
        
    }
    else
    {
        NSData *data = [NSData dataWithContentsOfFile:pathst];
        UIImage *image = [UIImage imageWithData:data];
        return image;
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end