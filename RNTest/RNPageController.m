//
//  RNPageController.m
//  RNTest
//
//  Created by MrChen on 2018/7/4.
//  Copyright © 2018年 MrChen. All rights reserved.
//

#import "RNPageController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface RNPageController ()

@end

@implementation RNPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 方法1
//    NSURL *url = [NSURL URLWithString:@"http://10.226.104.145:8081/Entrance/index.bundle?platform=ios"];
//    self.view = [[RCTRootView alloc]initWithBundleURL:url moduleName:@"HelloWord" initialProperties:nil launchOptions:nil];

    // 方法2
    NSDictionary *initialParams = @{@"key":@"初始化参数",@"page":@"main",@"data":@"20181008"};
    NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"./Entrance/index" fallbackResource:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"HelloWord"
                                                 initialProperties:initialParams
                                                     launchOptions:nil];

    self.view = rootView;
}


@end
