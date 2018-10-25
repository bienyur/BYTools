//
//  ViewController.m
//  BYTools
//
//  Created by 毕恩宇 on 16/7/29.
//  Copyright © 2016年 bieny. All rights reserved.
//

#import "ViewController.h"
#import "testViewController.h"

#define appWidth  [UIScreen mainScreen].bounds.size.width
#define appHeight  [UIScreen mainScreen].bounds.size.height
#define appFrame    [UIScreen mainScreen].bounds

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

testViewController *testVC;

@implementation ViewController

- (void)viewDidLoad {
    
    // view
    testVC = [[testViewController alloc] init];
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, appWidth, appHeight)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
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
    if(indexPath.row == 1){
        NSLog(@"%ld",indexPath.row);
        [self.navigationController pushViewController:testVC animated:YES];
    }
    

 
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
