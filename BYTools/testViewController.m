//
//  testViewController.m
//  BYTools
//
//  Created by 毕恩宇 on 2017/8/8.
//  Copyright © 2017年 bieny. All rights reserved.
//

#import "testViewController.h"
#import "tempViewController.h"
#define appWidth  [UIScreen mainScreen].bounds.size.width
#define appHeight  [UIScreen mainScreen].bounds.size.height
#define appFrame    [UIScreen mainScreen].bounds

@interface testViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end




@implementation testViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    
    cell.textLabel.text = @"1";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        tempViewController *tempVC = [[tempViewController alloc] init];
        tempVC.navigationController.navigationBarHidden = YES;
        [self.navigationController pushViewController:tempVC animated:YES];
        
    }
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
