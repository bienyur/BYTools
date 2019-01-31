//
//  AppDelegate.m
//  BYTools
//
//  Created by 毕恩宇 on 16/7/29.
//  Copyright © 2016年 bieny. All rights reserved.
//

#import "AppDelegate.h"
#import "testViewController.h"
#import "MXIntroPageViewController.h"
#define First_Start  @"firstStartMXApp"
@interface AppDelegate ()
{
    NSUserDefaults *userDefaults;
    BOOL firstStart;
}


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    testViewController *test = [[testViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor lightGrayColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
//    nav.navigationItem.title = @"BYTools";
    nav.title = @"test";
    nav.navigationBar.tintColor = [UIColor blackColor];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    // 延时一秒 看启动图
    [NSThread sleepForTimeInterval:1];
    // 第一次启动
    userDefaults= [NSUserDefaults standardUserDefaults];
    firstStart = [[userDefaults objectForKey:First_Start] boolValue];
    if (!firstStart) {
        [self showIntroView];
        [userDefaults setBool:1 forKey:First_Start];
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    
}




- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showIntroView{
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >=7.0)
    {
        MXIntroPageViewController *introPageVC = [[MXIntroPageViewController alloc] init];
        [self.window setRootViewController:introPageVC];
        [self.window makeKeyAndVisible];
    }
    else
    {
        BOOL isIphone4 = [[UIScreen mainScreen] bounds].size.height > 480 ? NO : YES;
        EAIntroPage *page1 = [EAIntroPage page];
        EAIntroPage *page2 = [EAIntroPage page];
        EAIntroPage *page3 = [EAIntroPage page];
        EAIntroPage *page4 = [EAIntroPage page];
        if(isIphone4)
        {
            page1.titleImage = [UIImage imageNamed:@"mx_1_iphone4_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_iphone4_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_iphone4_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_iphone4_phone"];
        }
        else if([[UIScreen mainScreen] bounds].size.height <=568 )
        {
            page1.titleImage = [UIImage imageNamed:@"mx_1_iphone5_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_iphone5_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_iphone5_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_iphone5_phone"];
        }else if ([[UIScreen mainScreen] bounds].size.height <=667  )
        {
            page1.titleImage = [UIImage imageNamed:@"mx_1_iphone6_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_iphone6_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_iphone6_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_iphone6_phone"];
        }else if([[UIScreen mainScreen] bounds].size.height ==812){
            page1.titleImage = [UIImage imageNamed:@"mx_1_iphonex_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_iphonex_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_iphonex_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_iphonex_phone"];
        }else
        {
            page1.titleImage = [UIImage imageNamed:@"mx_1_iphone6+_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_iphone6+_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_iphone6+_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_iphone6+_phone"];
        }
        EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.window.bounds andPages:@[page1,page2,page3,page4]];
        if(isIphone4)
        {
            intro.bgImage = [UIImage imageNamed:@"Default"];
        }
        else
        {
            intro.bgImage = [UIImage imageNamed:@"Default-568h"];
        }
        
        [intro setDelegate:self];
        [intro showInView:self.window animateDuration:0.0];
        [self.window makeKeyAndVisible];
    }
    
}

@end
