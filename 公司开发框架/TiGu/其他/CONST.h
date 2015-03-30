//
//  CONST.h
//  TiGu
//
//  Created by 咖啡可乐 on 13-12-20.
//  Copyright (c) 2013年 咖啡可乐. All rights reserved.
//

#ifndef TiGu_CONST_h
#define TiGu_CONST_h


#pragma mark +++++++++++自定义宏+++++++++++++++
//
#define __RELEASE_ALL__(_ptr_) if((_ptr_) != nil) {[_ptr_ release]; _ptr_ = nil;}
//
#define IS_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

//
#define LABELSUGGESTION_FONTSIZE  12
#define LABELNAMETIP_FONTSIZE 11
#define CELL_FONTSIZE 12
//
#define FRAME [UIScreen mainScreen].bounds
//
#define DBNAME @"PersonalInfo"
//
#pragma mark ++++++++++服务器接口+++++++++++
//服务器地址
#define TIGU_URL @"http://119.253.58.107:8080"

#define TIGU_REGISTER_URL @"tiguAS/user/register"
#define TIGU_LOGIN_URL    @"tiguAS/login"
#define TIGU_UPLOADPHOTOTOQUESTION_URL @"tiguAS/question/query"//上传图片搜题
#define TIGU_GETPASSWORD_URL @"tiguAS/user/password/query" // 获取密码


#define TIGU_GETAD_URL @"tiguAS/adList/query" //获取广告页
#define TIGU_STARTLOGIN_URL @"tiguAS/login/start" //开始使用

#pragma mark +++++++++++++视频播放界面++++++++++++++++++++
#define TIGU_COLLECTION_CREATE_URL @"tiguAS/question/favorite/create" //收藏题目
#define TIGU_COLLECTION_DELETE_URL @"tiguAS/question/favorite/delete" //删除题目
#define TIGU_GETFAVORITELIST_URL   @"tiguAS/favoriteList/query"       //获取收藏列表
#define TIGU_SCORE_URL          @"tiguAS/question/evaluation/save"       //打分评价
#define TIGU_SCORE_HOMEPAGE_URL @"tiguAS/question/evaluation/homepage/query" //获取题目打分首页
#define TIGU_EVALUATIONLIST_URL @"tiguAS/question/evaluationList/query"   //获取题目评价列表
#define TIGU_EVALUATION_INFO_URL @"tiguAS/question/evaluation/query"  //获取打分评价详细信息
#define TIGU_COMMENT_URL        @"tiguAS/comment/save" //对打分评价进行评论，对评论进行再评论
#define TIGU_COMMENT_STANDING_URL @"tiguAS/comment/standing/save" //给打分赞许、反对
#define TIGU_GETSHARE_URL @"tiguAS/question/shareUrl/query" //获取分享地址
#define TIGU_QUESTION_ERROR_URL @"tiguAS/question/error/save" //纠错

#define TIGU_IMPROVEMENT_URL @"tiguAS/question/improvement/save" //改进

#pragma mark +++++++++++更改、提交个人信息++++++++++++++++

#define TIGU_GETPERSONAL_INFO_URL @"tiguAS/user/query" //获取个人信息
#define TIGU_COMMITPERSONAL_INFO_URL @"tiguAS/user/save" //提交个人信息
#define TIGU_UPDATE_PASSWORD_URL @"tiguAS/password/save" //更新密码
#define TIGU_COMMIT_HEADLOGO_URL @"tiguAS/user/logo/save" //提交个人头像
#pragma mark ++++++++++++++++获取各种列表++++++++++++++++++
#define TIGU_GETPROVINCE_URL @"tiguAS/provinceList/query" //获取省份列表
#define TIGU_GETCITY_URL @"tiguAS/cityList/query"         //获取城市列表
#define TIGU_GETCOUNTRY_URL @"tiguAS/countyList/query"      //获取县区列表
#define TIGU_GETSCHOOL_URL @"tiguAS/schoolList/query"       //获取学校列表
#define TIGU_GETFAVORITE_URL @"tiguAS/favoriteList/query"   //获取收藏列表
#pragma mark +++++++++++++++评价+++++++++++++++++++
#define TIGU_GETMYEVALUATION_HOMEPAGE_URL @"tiguAS/myEvaluation/homepage/query"//获取我的评价首页
#define TIGU_GETMYEVALUATION_LIST_URL @"tiguAS/myEvaluationList/query"   //获取我的评价列表
#define TIGU_GETREFERRED_LIST_URL @"tiguAS/myReferredList/query"    //获取我参与的评价列表

#define TIGU_COMMIT_MOBILENUMBIND_URL @"tiguAS/mobilenobind/probind"//提交绑定手机号码
#define TIGU_COMMIT_MOBILEPWDBINE_URL @"tiguAS/mobilenobind/bind" //提交绑定手机密码
#define TIGU_UPDATE_DEVICE_URL @"tiguAS/mobilenobind/rebind" //更新绑定设备


#define TIGU_GETSEARCHRESULT_URL @"tiguAS/question/newestQuestList/query" // 获取最新搜索结果
#pragma mark ++++++++++++消息+++++++++++++++++++++++++++++++
#define TIGU_DELETEMSG_URL @"tiguAS/msg/delete"  // 删除消息
#define TIGU_READMSG_URL @"tiguAS/msg/read/save" // 消息已读
#define TIGU_GETMSG_URL @"tiguAS/msgList/query" // 获取消息
#pragma mark ++++++++++++二维码+++++++++++++++++++++++++++++
#define TIGU_UPTWODIMEN_URL @"tiguAS/twoDimensionalCode/save" // 提交二维码
#pragma mark ++++++++++++邀请+++++++++++++++++++++++++++++++
#define TIGU_UPINVITERID_URL @"tiguAS/inviter/save" // 提交邀请人ID
#define TIGU_GETINVITEEMSG_URL @"tiguAS/inviteeList/query" // 获取邀请信息
#pragma mark ++++++++++++++建议+++++++++++++++++++++++++++
#define TIGU_UPADVICE_URL @"tiguAS/advice/save" // 提交建议
#pragma mark +++++++++++++支付+++++++++++++++++++++++++++++
#define TIGU_GETPAYINFO_URL @"tiguAS/pay/alipay/applyInfo/query" //获取需提交到支付宝的数据包
#define TIGU_COMMIT_CALLBACK_URL @"tiguAS/pay/alipay/callback/save"   //提交支付宝回调信息
#define TIGU_GET_UNIONPAYINFO_URL @"tiguAS/pay/unionpay/applyInfo/query" //获取需提交到银联的数据包
#define TIGU_COMMIT_UNIONPAY_CALLBACK_URL @"tiguAS/pay/unionpay/callback/save" //提交银联回调信息
#pragma mark +++++++++++++++++++++++++++++++++++++++


#endif
