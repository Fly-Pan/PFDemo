//
//  AppConstants.h
//  CardMaster
//
//  Created by Lyner on 13-7-9.
//  Copyright (c) 2013年 GL. All rights reserved.
//
 
#import <Foundation/Foundation.h>

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)(BOOL netConnect);
typedef void (^NetWorkBlock)(BOOL netConnect);
typedef void (^ProgressBlock)(CGFloat returnProgress);


#define k_MapId @"pqpGoG66vsK2DkTBbeTOBfoot709Imp2"
/**
 *   支付宝
 */
#define k_Key @"lew3slubsbhvf09cpngs0n42fk1suyes"
#define k_Ali_AppId @"2016042801344043"
/**
 *   颜色定义
 */
// tableview  cell 的底色
#define kCellBgColor  0xE6E0D4
// tableview cell 文字颜色
#define kCellTextColor 0x7D7A69

// 数据库文件名称
#define kDefaultDBName  @"Telesing'sParking.db"

// 检索历史的 检索来源类型,  CODE  , KEYWORD
#define kSearchType_Scan @"SCAN"
#define kSearchType_Keyword @"KEYWORD"



#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 常用的宏定义
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
    CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0 ? YES : NO)

#define WIN_SIZE [UIScreen mainScreen].bounds.size
#define WIN_WIDTH [UIScreen mainScreen].bounds.size.width
#define WIN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define IS_IPHONE6_LATER ((WIN_WIDTH >= 375 && WIN_HEIGHT >= 667) == YES ? YES:NO)
#define IS_IPHONE5_LATER ((WIN_WIDTH <=320 && WIN_HEIGHT < 568) == YES ? YES:NO)
#define NAV_BAR_BACK_IMG @"banner"

// 把16进制的颜色转成UIColor对象 
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - HTTP请求定义区


// 与服务器连接超时设定
#define WSURL_TIMEOUT 60

// Frame的快捷操作
static inline CGFloat GG_X(UIView *view){ return view.frame.origin.x;}
static inline CGFloat GG_Y(UIView *view){ return view.frame.origin.y;}
static inline CGFloat GG_W(UIView *view){ return view.frame.size.width;}
static inline CGFloat GG_H(UIView *view){ return view.frame.size.height;}
static inline CGFloat GG_BOTTOM_Y(UIView *view){ return GG_Y(view) + GG_H(view);};
static inline CGFloat GG_RIGHT_X(UIView *view){ return GG_X(view) + GG_W(view);};


//图片加载打开还是关闭
#define ISDFNetReachableViaClose @"ISDFNetReachableViaClose"


// 快捷方式
#define ccp(x,y) CGPointMake(x, y)
#define ccs(x,y) CGSizeMake(x, y)
#define ccr(x,y,w,h) CGRectMake(x,y,w,h)

#define BASE_WIDTH  750.0
#define BASE_HEIGHT 1334.0

#define RELATIVE_WIDTH(w) WIN_WIDTH/BASE_WIDTH * w

#define SSKeyChain_Login @"SSKeyChain_com.jsyuci.HaoLan"
#define SSKeyChain_Account @"SSKeyChain_username"
#define SSKeyChain_Password @"SSKeyChain_password"
// 密码加密password
#define SSKeyChain_Password_Key @"Passw0rd"

//通知更改app背景图片
#define Notification_App_Amend_Background @"Notification_App_Amend_Background"

#define IconButton_Corner 50
#define IconImageView_Corner 40
#define UserImageView_Corner 30
#define ParkInfoIconImageView_Corner 22

#define TITLE_MONTHCARD @"我的包月卡"

#define Counting @"计算中..."
#define Nomal_PriceState @"正常"

#define Parking_Seat_Normal @"预留"
#define Parking_Seat_Occupy @"此车位已被占用"
#define Parking_Seat_Resevel @"此车位已被预留"
#define Parking_Seat_NoUse @"此车位故障，无法使用！"

#define Parking_Seat_NoTime @"此时间段无法预留"

#define Parking_AliPay_Resevel @"TYPARK车位预留收费"
#define Parking_AliPay_Parking @"TYPARK车位停车收费"

#define Parking_Resevel_Limt_Time @"该订单已超时，请重新预留"
#define Parking_OpenCar_Limt_Time @"该订单已超时，请重新输入取车号"

#define UnZip_Filed @"图纸打开失败，程序猿正在努力中..."
#define UnZip_NoFind @"没有上传停车场图纸,请稍后"


#define Parking_NoRecive_MQTT @"请到个人中心查看结果，如需帮助，请联系客服."
#define Parking_NoRecive_OpenCar @"请到个人中心查看结果，如需帮助，请联系客服"

#define Parking_Order_NoPay @"用户取消操作"
#define Parking_Order_PayFailure @"用户支付失败"

