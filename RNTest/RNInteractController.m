//
//  RNInteractController.m
//  RNTest
//
//  Created by MrChen on 2018/7/4.
//  Copyright © 2018年 MrChen. All rights reserved.
//

#import "RNInteractController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>
#import "commModule.h"

@interface RNInteractController ()

@end

@implementation RNInteractController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 方法2
    NSDictionary *initialParams = @{@"key":@"初始化参数",@"page":@"ocview"};
    NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"./Entrance/index" fallbackResource:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"HelloWord"
                                                 initialProperties:initialParams
                                                     launchOptions:nil];
    self.view = rootView;
}

@end
