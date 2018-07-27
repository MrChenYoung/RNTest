//
//  ViewController.m
//  RNTest
//
//  Created by MrChen on 2018/6/10.
//  Copyright © 2018年 MrChen. All rights reserved.
//

#import "ViewController.h"
#import "RNPageController.h"
#import "RNInteractController.h"
#import "RNNavigationController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
// 列表
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *data;

@end

@implementation ViewController
#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    
    return _tableView;
}

#pragma mark - 系统
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.title = @"iOS与RN交互";
    self.data = @[@"iOS集成RN页面",@"RN调用iOS方法",@"RN导航页"];
}

#pragma mark - UITableViewDataSource
// section number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// row number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

// cell define code
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuserId = @"reuserId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserId];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
// click row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = @"";
    
    switch (indexPath.row) {
        case 0:
            className = @"RNPageController";
            break;
        case 1:
            className = @"RNInteractController";
            break;
        case 2:
            className = @"RNNavigationController";
            break;
            
        default:
            break;
    }
    
    UIViewController *ctr = [[NSClassFromString(className) alloc]init];
    [self.navigationController pushViewController:ctr animated:YES];
}

@end
