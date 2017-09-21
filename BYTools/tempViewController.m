//
//  tempViewController.m
//  BYTools
//
//  Created by 毕恩宇 on 2017/8/8.
//  Copyright © 2017年 bieny. All rights reserved.
//

#import "tempViewController.h"
#import "config.h"
@interface tempViewController ()
@property (nonatomic,strong) UIImageView *bgview;
@end

@implementation tempViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"lauren_lester_2"];
    
  
    
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
