//
//  HomePageViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "HomePageViewController.h"
#import "MyTiGuViewController.h"
#import "PhotoHistoryViewController.h"
#import "MessageViewController.h"
#import "PhotoSearchViewController.h"
#import "MyTabBarController.h"
#import "Message.h"
#import "AdPage.h"
#import "Evaluation.h"
#import "SearchQuestion.h"
#import "SDImageView+SDWebCache.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController
@synthesize dataArray;
@synthesize twocode;
@synthesize qrcodeArr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dataArray = [[NSMutableArray alloc]init];
        qrcodeArr = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)dealloc
{
    [qrcodeArr release];
    [adImgView release];
    [dataArray release];
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createAdUI];

    self.view.backgroundColor = [UIColor whiteColor];

    self.tabBarController.tabBar.hidden = NO;
    isScan = NO;
    [self createUI];
    
}


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
   
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [UIView animateWithDuration:0.5 animations:^{
        appDelegate.tabbarController.bgView.frame = CGRectMake(0, FRAME.size.height-49, 320, 49);
        
    }];
}

- (void) createUI
{
    
    psearchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    scanBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    myLibBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    msgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    historyBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    
    
    NSArray *btnArr = [NSArray arrayWithObjects:psearchBtn,scanBtn,myLibBtn,msgBtn,historyBtn, nil];
    NSArray *titleArr = [NSArray arrayWithObjects:@"拍照搜索",@"扫一扫",@"我的题库",@"消息",@"拍照搜索历史",nil];
    
    for (int i = 0; i < 5; i++) {
        [[btnArr objectAtIndex:i] setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
        [[btnArr objectAtIndex:i ] setTag:200+i ];
        [[btnArr objectAtIndex:i] addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (SystemVersion >= 7.0) {
        
       
        psearchBtn.frame = CGRectMake(FRAME.origin.x + 7, FRAME.size.height - 280, 186, 173);
        scanBtn.frame = CGRectMake(FRAME.origin.x + 7, FRAME.size.height - 100,186, 44);
        myLibBtn.frame =  CGRectMake(FRAME.origin.x + 201, FRAME.size.height - 280,114, 122);
        msgBtn.frame = CGRectMake(FRAME.origin.x + 201, FRAME.size.height - 151, 114, 44);
        historyBtn.frame = CGRectMake(FRAME.origin.x + 201, FRAME.size.height - 100, 114, 44);
        
    
    }
    else
    {
        
        
        psearchBtn.frame = CGRectMake(FRAME.origin.x + 7, FRAME.size.height - 300, 186, 173);
        scanBtn.frame = CGRectMake(FRAME.origin.x + 7, FRAME.size.height - 120,186, 44);
        myLibBtn.frame =  CGRectMake(FRAME.origin.x + 201, FRAME.size.height - 300,114, 122);
        msgBtn.frame = CGRectMake(FRAME.origin.x + 201, FRAME.size.height - 171, 114, 44);
        historyBtn.frame = CGRectMake(FRAME.origin.x + 201, FRAME.size.height - 120, 114, 44);
        
     
    }
    
    
    [self.view addSubview:historyBtn];
    [self.view addSubview:psearchBtn];
    [self.view addSubview:scanBtn];
    [self.view addSubview:myLibBtn];
    [self.view addSubview:msgBtn];

    
}

-(void)createAdUI
{
    adImgView = [[UIImageView alloc]init];
    if (SystemVersion >= 7.0){
        adImgView.frame = CGRectMake(FRAME.origin.x, FRAME.origin.y + 20 , FRAME.size.width,FRAME.size.height - 307);
        adImgView.image = [self getPhotoFromName:[NSString stringWithFormat:@"%d.png",4]];
        //[adImgView setImageWithURL:[NSURL URLWithString:[dataArray objectAtIndex:4]]];
    }else{
        adImgView.frame = CGRectMake(FRAME.origin.x, FRAME.origin.y , FRAME.size.width,FRAME.size.height - 307);
        adImgView.image = [UIImage imageNamed:@"4.png"];
        NSLog(@"AdImageView = >%@",adImgView.image);
        adImgView.image = [self getPhotoFromName:[NSString stringWithFormat:@"%d.png",4]];
        //[adImgView setImageWithURL:[NSURL URLWithString:[dataArray objectAtIndex:4]]];
    }
    [self.view addSubview:adImgView];
}

-(void)dataObjectChanged:(NSString *)object
{
    if ([self.userData isKindOfClass:[AdPage class]]) {
    AdPage* adObj = (AdPage*)self.userData;
    for (NSDictionary* dic in [adObj getMessages]) {
        [dataArray addObject:[dic objectForKey:@"url"]];
    }
    [self createAdUI];
    }else if([self.userData isKindOfClass:[SearchQuestion class]]){
        SearchQuestion* searchObj = (SearchQuestion*)self.userData;
        qrcodeArr = [searchObj getQuestions];
    }
    
    
}

-(void)btnClicked:(UIButton*)button
{
    
    switch (button.tag) {
        case 200:
        {
            
            isScan = NO;
            //拍照搜索
            PhotoSearchViewController* photosearch = [[PhotoSearchViewController alloc]init];
            photosearch.userData = [[SearchQuestion alloc]init];
            [(SearchQuestion*)photosearch.userData fetchNewestQuestList];
            [self.navigationController pushViewController:photosearch animated:YES];
            [photosearch release];
            //[self pickImageFromCamera];
        
        }
            break;
        case 201:
            //扫一扫
        {
            [self scan];
            isScan = YES;
        }
            break;
        case 202:
        {
            //我的题谷
            MyTiGuViewController* mytigu = [[MyTiGuViewController alloc]init];
            mytigu.userData = [[SearchQuestion alloc]init];
            [(SearchQuestion*)mytigu.userData fetchevaluationhomepage:[NSNumber numberWithInt:20001258]];
            [self.navigationController pushViewController:mytigu animated:YES];
            [mytigu release];
        }
            break;
        case 203:
            //消息
        {
            MessageViewController* messagectl = [[MessageViewController alloc]init];
            messagectl.userData = [[Message alloc]init];
            [(Message*)messagectl.userData fetchmsgList:[NSNumber numberWithInt:1]];
            [self.navigationController pushViewController:messagectl animated:YES];
            [messagectl release];
        }
            break;
        case 204:
        {
            PhotoHistoryViewController* history = [[PhotoHistoryViewController alloc]init];
            
            [self.navigationController pushViewController:history animated:YES];
            [history release];
        }
            break;
        default:
            break;
    }
    
    
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
#pragma mark +++++=====二维码扫描=====+++++

- (void)scan {
    
    ZBarReaderViewController * reader = [ZBarReaderViewController new];
    
    reader.readerDelegate = self;
    
    ZBarImageScanner * scanner = reader.scanner;
    
    [reader setShowsZBarControls:NO];
    
    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
    
    [self setOverlayPickerView:reader];

    [self presentViewController:reader animated:YES completion:nil];
    
}

- (void)setOverlayPickerView:(ZBarReaderViewController *)reader
{
    
    UIView* upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    upView.alpha = 0.3;
    upView.backgroundColor = [UIColor blackColor];
    [reader.view addSubview:upView];
    UILabel* tips = [[UILabel alloc]init];
    tips.frame = CGRectMake(30, 50, 280, 30);
    tips.textColor = [UIColor whiteColor];
    tips.text = @"把二维码放入框中，即可自动扫描";
    [upView addSubview:tips];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, 20, 280)];
    leftView.alpha = 0.3;
    leftView.backgroundColor = [UIColor blackColor];
    [reader.view addSubview:leftView];
    [leftView release];
    //右侧的view
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(300, 80, 20, 280)];
    rightView.alpha = 0.3;
    rightView.backgroundColor = [UIColor blackColor];
    [reader.view addSubview:rightView];
    [rightView release];
    //底部view
    UIView * downView = [[UIView alloc] initWithFrame:CGRectMake(0, 360, 320, 120)];
    downView.alpha = 0.3;
    downView.backgroundColor = [UIColor blackColor];
    [reader.view addSubview:downView];
    [downView release];
    
    cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame = CGRectMake(130, FRAME.size.height-80, 60, 40);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelClicked) forControlEvents:UIControlEventTouchUpInside];
    [reader.view addSubview:cancelBtn];
}


#pragma mark ++++++++++++++++++++++++++++

- (void)pickImageFromCamera
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    
    imagePickerController.allowsEditing = YES;
    
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerController animated:YES completion:^{}];
    
    [imagePickerController release];

}

-(void)cancelClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (isScan == NO) {
        
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    /* 此处info 有六个值
     
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     
     * UIImagePickerControllerMediaURL;       // an NSURL
     
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     
     */
    // 保存图片至本地，方法见下文
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    NSLog(@"saveim %@",savedImage);
    
    //[self.imageView setImage:savedImage];
    }else{
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    
    ZBarSymbol * symbol;
    
    for(symbol in results)
        break;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    twocode = symbol.data;
    
    self.userData = [[SearchQuestion alloc]init];
    [(SearchQuestion*)self.userData commitTwoDimensionalCode:twocode];
    NSLog(@"twocode :%@",twocode);
    
    NSLog(@"result : %@",symbol.data);
    }
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);

    // 获取沙盒目录
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
