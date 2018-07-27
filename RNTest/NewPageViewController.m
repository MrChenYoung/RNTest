//
//  NewPageViewController.m
//  RNTest
//
//  Created by MrChen on 2018/7/4.
//  Copyright © 2018年 MrChen. All rights reserved.
//

#import "NewPageViewController.h"
#import "commModule.h"

@interface NewPageViewController ()

@end

@implementation NewPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"从RN跳过来的页面";
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 200, 40)];
    label.center = CGPointMake(self.view.center.x, label.center.y);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    label.text = self.params;
    [self.view addSubview:label];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame) + 10, 200, 40)];
    btn.center = CGPointMake(self.view.center.x, btn.center.y);
    [btn setTitle:@"发送通知" forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)click
{
    [[commModule share] sendNotificaiton];
}

@end
