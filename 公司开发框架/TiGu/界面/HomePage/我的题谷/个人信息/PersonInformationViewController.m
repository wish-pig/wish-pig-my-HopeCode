//
//  PersonInformationViewController.m
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-23.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "PersonInformationViewController.h"
#import "PersonInformationCell.h"
#import "PersonInfoCell.h"
#import "NameViewController.h"
#import "MyAccountCtrl.h"
#import "RegionCtrl.h"
#import "SchoolListCtrl.h"
#import "ClassCtrl.h"
#import "SexAlertView.h"
#import "ExternalDataLayer.h"
#import "LocalLayer.h"
#import "UserInfo.h"

#import "UserItem.h"
#import "MyDatabase.h"
#import "UserItem.h"

#import "AppDelegate.h"

@interface PersonInformationViewController ()
{
    
}

@end

@implementation PersonInformationViewController
@synthesize dataArrayperson;
@synthesize dataArray;
@synthesize personArray;
@synthesize dbName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarController.hidesBottomBarWhenPushed = YES;
        self.tabBarController.tabBar.hidden = YES;
    }
    return self;
}

- (void)dealloc
{
    [dataArrayperson release];
    [super dealloc];
}

-(void) viewWillAppear:(BOOL)animated
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [UIView animateWithDuration:0 animations:^{
        appDelegate.tabbarController.bgView.frame = CGRectMake(0, FRAME.size.height, 320, 49);
        appDelegate.tabbarController.tabBar.hidden = YES;
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"个人信息";
    self.dataArrayperson = [[NSMutableArray alloc]init];
    personArray = [[NSMutableArray alloc]init];
    photoimage = [[UIImage alloc]init];
    tableviewperson = [[UITableView alloc]init];
    tableviewperson.frame = CGRectMake(FRAME.origin.x, FRAME.origin.y, FRAME.size.width, FRAME.size.height);
    
    tableviewperson.delegate = self;
    tableviewperson.dataSource = self;
    
    [self.view addSubview:tableviewperson];
    
    personArray = [[MyDatabase shareDatabase]queryALLItemsInTable:self.dbName];

    self.dataArrayperson = [NSMutableArray arrayWithObjects:@"名字",@"我的账号",@"性别",@"地区",@"学校",@"班级", nil];
    
    //self.dataArrayperson = dataperson;
    
    if (SystemVersion >= 7.0) {
        if ([tableviewperson respondsToSelector:@selector(setSeparatorInset:)]) {
            [tableviewperson setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarbuttonClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}
- (void)BarbuttonClick:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        static NSString* cellname = @"person";
        PersonInformationCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"PersonInformation" owner:self options:nil]lastObject];
        if (cell == nil) {
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
        }
        
        img = [self getPhotoFromName:@"currentImage.png"];
        cell.headimageview.image = img;
        UIImage *image = [PersonInformationViewController imageWithImageSimple:img scaledToSize:CGSizeMake(120, 120)];
        NSLog(@"OriginalImage.Height%f- OriginalImage.Width%f",img.size.height,img.size.height);
        NSLog(@"Image.Height%f- Image.Width%f",image.size.height,image.size.height);
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString* cellname = @"personinfo";
        PersonInfoCell* cell = [[[NSBundle mainBundle]loadNibNamed:@"PersonInfoCell" owner:self options:nil]lastObject];
    if (cell == nil) {
            cell = [tableView dequeueReusableCellWithIdentifier:cellname];
        }
        
        //cell.detailTextLabel.text = @"未设置";
        UserItem* infoitem = [dataArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = infoitem.name;
        NSLog(@" info %@",infoitem.name);
        NSLog(@" person %@",personArray);
        //[cell.detailTextLabel setFont:[UIFont systemFontOfSize:CELL_FONTSIZE]];
        
        cell.titlabel.text = [self.dataArrayperson objectAtIndex:indexPath.row-1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.detlabel.text = [self.dataArrayperson objectAtIndex:indexPath.row];
        
        return cell;
    
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // 头像
        UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"取消"
                                             destructiveButtonTitle:@"拍照"
                                                  otherButtonTitles:@"从相册中选择图片", nil];
        [action showInView:self.view];
        [action release];
        
    }else if (indexPath.row == 1){
        // 姓名
        NameViewController* nameedit = [[NameViewController alloc]init];
        nameedit.hidesBottomBarWhenPushed = YES;
        nameedit.delegate = self;
        [self.navigationController pushViewController:nameedit animated:YES];
        [nameedit release];
    }else if (indexPath.row == 2){
        // 我的账号
        MyAccountCtrl *myAccount = [[MyAccountCtrl alloc]init];
        [self.navigationController pushViewController:myAccount animated:YES];
        [myAccount release];
        
    
    }else if (indexPath.row == 3){
        // 性别
        SexAlertView *sexAlert = [[SexAlertView alloc]initWithTitle:@"性别" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [sexAlert show];
        [sexAlert release];
        
    
    }else if (indexPath.row == 4){
        // 地区
        RegionCtrl *regionView = [[RegionCtrl alloc]init];
        //获取省份列表
#pragma mark +++++获取省份请求++++++
        regionView.userData = [[UserInfo alloc]init];
        [(UserInfo*)regionView.userData fetchprovinceList];
        [self.navigationController pushViewController:regionView animated:YES];
        [regionView release];
        
        
    
    }else if (indexPath.row == 5){
        // 学校
        SchoolListCtrl *schoolView = [[SchoolListCtrl alloc]init];
        schoolView.userData = [[UserInfo alloc]init];
        [(UserInfo*)schoolView.userData fetchschoolList:@"150102"];
        [self.navigationController pushViewController:schoolView animated:YES];
        [schoolView release];
    
    }else{
        // 班级
        ClassCtrl *classView = [[ClassCtrl alloc]init];
        [self.navigationController pushViewController:classView animated:YES];
        [classView release];
        
    
    }
    
}
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // 拍照
        UIImagePickerController *imgPickerController = [UIImagePickerController new];
        
        imgPickerController.delegate = self;
        imgPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:imgPickerController animated:YES completion:nil];
        
    }
    else if (buttonIndex == 1){
        // 从相册中选择
        UIImagePickerController *imgPickerController = [UIImagePickerController new ];
        imgPickerController.delegate = self;
        imgPickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        [self presentViewController:imgPickerController animated:YES completion:nil];
        
    }
    else
    {
        
    }
}

-(void)Sendfieldname:(NSString *)name
{
    personArray = [[MyDatabase shareDatabase]queryALLItemsInTable:DBNAME];
    NSLog(@"per %@",[personArray objectAtIndex:0]);
    UserItem* item = [personArray objectAtIndex:0];
    NSLog(@"na %@",item.name);
    [tableviewperson reloadData];
}
    

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *Image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage:Image withName:@"currentImage.png"];
    
    //NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    //UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    [tableviewperson reloadData];
    //UIImage *compressedImage = [UIImage imageWithData:imageData];
    
    //[HttpRequestManager uploadImage:compressedImage httpClient:self.httpClient delegate:self];
    
    //[self.view viewWithTag:999] = image;
    
    
}
- (NSString *)documentFolderPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}
#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.01);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}
#pragma mark - 从沙盒中读照片
- (UIImage *)getPhotoFromName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *uniquePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:name];
    BOOL blHave = [[NSFileManager defaultManager]fileExistsAtPath:uniquePath];
    if (!blHave) {
        return nil;
        
    }
    else
    {
        NSData *data = [NSData dataWithContentsOfFile:uniquePath];
        UIImage *image = [UIImage imageWithData:data];
        return image;
    }
    
}
#pragma mark - 压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
