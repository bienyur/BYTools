//
//  MXConst.h
//  MXClient
//
//  Created by liyang on 14/11/6.
//  Copyright (c) 2014年 MXClient. All rights reserved.
//

#ifndef MXClient_MXConst_h
#define MXClient_MXConst_h
#import "Reachability.h"
//#import <MXKit/MXError.h>

typedef enum {
    MESSAGE_TYPE_TEXT,//文本
    MESSAGE_TYPE_TASK,//待办
    MESSAGE_TYPE_ACTIVITY,//活动
    MESSAGE_TYPE_POLL,//投票
    MESSAGE_TYPE_QUESTION,//问题
    MESSAGE_TYPE_ANNOUNCE,//公告
    MESSAGE_TYPE_THIRDPART//三方应用
} MESSAGE_TYPE;

//设配型号
typedef NS_ENUM(NSInteger, TypeIphone) {
    
    TypeIphone5AndBelow = 0,
    TypeIphone6 =1,//iphone6 普通模式
    TypeIphone6Magnify = 2,
    TypeIphone6Plus = 3,// 6puls
    TypeIphone6PlusMagnify = 4
};

//typedef void(^finishCallback)(id object, MXError *error);
//typedef BOOL(^handleNativeCallback)(id object, MXError *error);
//typedef BOOL(^handleLogoutCallback)(id object, MXError *error);


#define NO_NET_WORK [Reachability reachabilityForInternetConnection].currentReachabilityStatus == NotReachable
#define navBarColor [UIColor colorWithRed:41.0/255.0 green:86.0/255.0 blue:163.0/255.0 alpha:1.0]
//#define networkSelectColor [UIColor colorWithRed:41.0/255.0 green:86.0/255.0 blue:163.0/255.0 alpha:0.1]
//navbar title color
//#define navBarTextColor [UIColor colorWithRed:39.0/255.0 green:39.0/255.0 blue:39.0/255.0 alpha:1.0]
//navBarStatusStyle kit里面默认是1，不设置就是1
//#define navBarStatusStyle 0
//navBarItemTitleColor
//#define navBarItemTitleColor [UIColor colorWithRed:144/255.0 green:58/255.0 blue:205/255.0 alpha:1.0]

#define menuSeperateLineColor [UIColor colorWithRed:35/255.0 green:80/255.0 blue:157/255.0 alpha:1.0]
#define menuSelectColor [UIColor colorWithRed:61.0/255.0 green:152.0/255.0 blue:250.0/255.0 alpha:1.0]
#define deviceVersion  [[[UIDevice currentDevice] systemVersion] floatValue]
#define GetLocalResStr(key) NSLocalizedStringFromTable(key, @"MXStrings", key)
#define ColorWithRGB(R, G, B, Alpha) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:Alpha]


//--------热点状态栏相关-----------
// 标准系统状态栏高度
#define SYS_STATUSBAR_HEIGHT 20
// 热点栏高度
#define HOTSPOT_STATUSBAR_HEIGHT 20
// APP_STATUSBAR_HEIGHT=SYS_STATUSBAR_HEIGHT+[HOTSPOT_STATUSBAR_HEIGHT]
#define APP_STATUSBAR_HEIGHT  (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))
// 根据APP_STATUSBAR_HEIGHT判断是否存在热点栏
#define IS_HOTSPOT_CONNECTED  (APP_STATUSBAR_HEIGHT==(SYS_STATUSBAR_HEIGHT+HOTSPOT_STATUSBAR_HEIGHT)?YES:NO)


#define appWidth  [UIScreen mainScreen].bounds.size.width
//屏幕能显示的区域高度 考虑到了热点状态栏的情况
#define appHeight  (IS_HOTSPOT_CONNECTED?([UIScreen mainScreen].bounds.size.height-HOTSPOT_STATUSBAR_HEIGHT):[UIScreen mainScreen].bounds.size.height)
#define appFrame    (IS_HOTSPOT_CONNECTED?CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-HOTSPOT_STATUSBAR_HEIGHT):[UIScreen mainScreen].bounds)


//#define kIPhoneType  ([UIScreen mainScreen].bounds.size.width < 375 ? 0 : [UIScreen mainScreen].scale < 3 ? 1: ([UIScreen mainScreen].bounds.size.width == 375 ? 4 : 3))
//
//#define kFontRtaio (([UIScreen mainScreen].scale < 3 )? 1 : ([UIScreen mainScreen].bounds.size.width <= 375 ? 1.1 :1.1))
//#define WEAK_SELF(weakSelf)  __weak __typeof(&*self)weakSelf = self

//iphone设备
#define isIphone ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
//ipad设备
#define isIpad ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
//注册流程界面中颜色 xj-purpleColor
//#define registColor [UIColor colorWithRed:26.0/255.0 green:133.0/255.0 blue:255.0/255.0 alpha:1.0]

//#define themeColor [UIColor colorWithRed:41.0/255.0 green:86.0/255.0 blue:163.0/255.0 alpha:1.0]//主题颜色 应用程序的主色调
//个人信息页面，添加联系人
//#define infoBtnAndBarColor  [UIColor colorWithRed:61.0/255.0 green:152.0/255.0 blue:250.0/255.0 alpha:1.0]
// 群聊按日期查找 titlecolor -- 适应原版的日期选择的选中色
//#define dateTitleColor [UIColor colorWithRed:37.0/255.0 green:135.0/255.0 blue:250.0/255.0 alpha:1.0]
//应用中心-编辑页面 pageconroller 颜色配置
//#define currentPageIndicatorColor [UIColor colorWithRed:37.0/255.0 green:135.0/255.0 blue:250.0/255.0 alpha:1.0]
//#define pageIndicatorColor  [UIColor colorWithRed:37.0/255.0 green:135.0/255.0 blue:250.0/255.0 alpha:1.0]


#endif
