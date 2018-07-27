//
//  RNNavigationController.m
//  RNTest
//
//  Created by MrChen on 2018/7/5.
//  Copyright © 2018年 MrChen. All rights reserved.
//

#import "RNNavigationController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface RNNavigationController ()

@end

@implementation RNNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *initialDic = @{@"pageName":@"MyHome"};
    NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings]jsBundleURLForBundleRoot:@"NavigationMain" fallbackResource:nil];
    RCTRootView *rootView = [[RCTRootView alloc]initWithBundleURL:jsCodeLocation moduleName:@"NavMain" initialProperties:initialDic launchOptions:nil];
    self.view = rootView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

@end
