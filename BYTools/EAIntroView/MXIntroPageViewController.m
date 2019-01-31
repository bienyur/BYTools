//
//  WBIntroPageViewController.m
//  EnterpriseMicroBlog
//
//  Created by liyang on 14-3-26.
//  Copyright (c) 2014年 Enterprise. All rights reserved.
//

#import "MXIntroPageViewController.h"
#import "AppDelegate.h"
#import "MXConst.h"

@interface MXIntroPageViewController ()
{
    EAIntroView *intro;
    EAIntroPage *page1;
    EAIntroPage *page2;
    EAIntroPage *page3;
    EAIntroPage *page4;
}

@end

@implementation MXIntroPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    BOOL isIphone4 = [[UIScreen mainScreen] bounds].size.height > 480 ? NO : YES;
    page1 = [EAIntroPage page];
    page2 = [EAIntroPage page];
    page3 = [EAIntroPage page];
    page4 = [EAIntroPage page];

    if (isIpad) {
        [self layoutIPadImageWithSize:[UIScreen mainScreen].bounds.size];
    }else{
        if(isIphone4)
        {
            page1.titleImage = [UIImage imageNamed:@"mx_1_iphone4_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_iphone4_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_iphone4_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_iphone4_phone"];
        } else if([[UIScreen mainScreen] bounds].size.height <=568 )
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
    }
    
    intro = [[EAIntroView alloc] initWithFrame:[[UIScreen mainScreen] bounds] andPages:@[page1,page2,page3, page4]];
    if (isIpad) {
        CGSize size=self.view.bounds.size;
        if (size.width<size.height) {//竖屏
            intro.bgImage = [UIImage imageNamed:@"Default-Portrait"];
        }else{//横屏
            intro.bgImage = [UIImage imageNamed:@"Default-Landscape"];
        }
    }else{
        if(isIphone4){
            intro.bgImage = [UIImage imageNamed:@"Default"];
        }else{
            intro.bgImage = [UIImage imageNamed:@"Default-568h"];
        }
        
        if(isIphoneX) {
            intro.bgImage = [UIImage imageNamed:@"Default-375w-812h"];
        }
    }
    
    
    [intro showInView:self.view animateDuration:0.0];

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    intro.delegate = appDelegate;
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [intro setCurrentPage:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        if (isIpad) {
            [self layoutIPadImageWithSize:size];
        }
    } completion:nil];
}

- (void)layoutIPadImageWithSize:(CGSize)size{
    if (size.width<size.height) {//竖屏
        if ([[UIScreen mainScreen] bounds].size.height <=1048) {
            page1.titleImage = [UIImage imageNamed:@"mx_1_ipad1024_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_ipad1024_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_ipad1024_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_ipad1024_phone"];
        }else{
            page1.titleImage = [UIImage imageNamed:@"mx_1_ipad2048_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_ipad2048_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_ipad2048_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_ipad2048_phone"];
        }
    }else{//横屏
        if ([[UIScreen mainScreen] bounds].size.height <=768) {
            page1.titleImage = [UIImage imageNamed:@"mx_1_ipad768_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_ipad768_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_ipad768_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_ipad768_phone"];
        }else{
            page1.titleImage = [UIImage imageNamed:@"mx_1_ipad1536_phone"];
            page2.titleImage = [UIImage imageNamed:@"mx_2_ipad1536_phone"];
            page3.titleImage = [UIImage imageNamed:@"mx_3_ipad1536_phone"];
            page4.titleImage = [UIImage imageNamed:@"mx_4_ipad1536_phone"];
        }
    }
    [intro relayoutSubviews:size];
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if (isIpad) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskPortrait;
}
@end
