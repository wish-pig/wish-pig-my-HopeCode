//
//  MyAccountCtrl.m
//  TiGu
//
//  Created by Adam on 13-12-27.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#import "MyAccountCtrl.h"
#import "TelCtrl.h"
#import "ChangePwdCtrl.h"
#import "SignatureCtrl.h"
#import "AlterAccountCtrl.h"
@interface MyAccountCtrl ()

@end

@implementation MyAccountCtrl

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的账号";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(BarbuttonClick:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}
- (void)BarbuttonClick:(UIButton *)button
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Str = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Str];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Str]autorelease];

        
    }
    NSArray *arr = [NSArray arrayWithObjects:@"题谷账号",@"手机号",@"个性签名",@"更改密码", nil];
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:CELL_FONTSIZE]];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row <= 2) {
        cell.detailTextLabel.text = @"未设置";
    }
    
    
    return cell;
}
// 从我的账号界面推进到下一界面
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            // 题谷账号界面
            AlterAccountCtrl *changeAccount = [[AlterAccountCtrl alloc]init];
            [self.navigationController pushViewController:changeAccount animated:YES];
            [changeAccount release];
            
            
        }
            
            break;
        case 1:{
            // 手机号界面
            TelCtrl *telView = [[TelCtrl alloc]init];
            [self.navigationController pushViewController:telView animated:YES];
            [telView release];
            
        
            
        }
            
            break;
        case 2:{
            // 个性签名
            SignatureCtrl *signatureView = [[SignatureCtrl alloc]init];
            [self.navigationController pushViewController:signatureView animated:YES];
            [signatureView release];
            
            
        }
            
            break;
        case 3:{
            // 更改密码
            ChangePwdCtrl *changePwdView = [[ChangePwdCtrl alloc]init];
            [self.navigationController pushViewController:changePwdView animated:YES];
            [changePwdView release];
            
        }
            break;
            
        default:
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
