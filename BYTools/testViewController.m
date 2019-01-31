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
{
    NSMutableArray *tabinfo;
}
@property (nonatomic,strong) UITableView *tableView;

@end




@implementation testViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    tabinfo = [NSMutableArray arrayWithObjects:@"相机",@"2",@"3",@"4",@"5",@"6",@"7",@"8",nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:39/255.0 green:46/255.0 blue:51/255.0 alpha:1];
    // 去透明效果
    [self.navigationController.navigationBar setTranslucent:NO];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
/**
 *  设置行高
 */
- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"formCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"formCell"];
    }
    
    if (indexPath.row%2==0) {
        cell.backgroundColor = [UIColor colorWithRed:64/255.0 green:72/255.0 blue:80/255.0 alpha:1];
    }else{
        cell.backgroundColor = [UIColor colorWithRed:39/255.0 green:46/255.0 blue:51/255.0 alpha:1];
    }
    cell.textLabel.text = tabinfo[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:40];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tabinfo.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        tempViewController *tempVC = [[tempViewController alloc] init];
        tempVC.navigationController.navigationBarHidden = YES;
        [self.navigationController pushViewController:tempVC animated:YES];
        
    }else{
        NSString *path1=[NSBundle mainBundle].bundlePath;
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *docDir = [paths objectAtIndex:0];
        NSString *path = [NSString stringWithFormat:@"file://%@/www/index.html",path1];
        NSLog(@"%@",path);
    }
}


// 删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (tableView == self.tableView) {
            [tabinfo removeObjectAtIndex:0];
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView endUpdates];
        }
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
