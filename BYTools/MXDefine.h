//
//  MXDefine.h
//  MXClient
//
//  Created by Tianyanqiu on 2017/10/18.
//  Copyright © 2017年 MXClient. All rights reserved.
//

#ifndef MXDefine_h
#define MXDefine_h

#define fitIOS11 (__IPHONE_OS_VERSION_MAX_ALLOWED >= 110000)&&([[UIDevice currentDevice].systemVersion floatValue] >= 11)

#define isIphoneX [[UIScreen mainScreen] bounds].size.height == 812? YES: NO

#define NavigationBarTitleViewMargin (fitIOS11? ([UIScreen mainScreen].bounds.size.width > 375 ? 20 : 16) :([UIScreen mainScreen].bounds.size.width > 375 ? 12 : 8))

#define MX_ENABLE_SHOW_IP 1

//状态栏的高度
#define appStatusBarHeight  [UIApplication sharedApplication].statusBarFrame.size.height
#endif /* MXDefine_h */
