//
//  commModule.m
//  RNTest
//
//  Created by MrChen on 2018/6/11.
//  Copyright © 2018年 MrChen. All rights reserved.
//

#import "commModule.h"
#import "NewPageViewController.h"

@implementation commModule

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static commModule *singleTon;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleTon = [super allocWithZone:zone];
    });
    
    return singleTon;
}

+ (instancetype)share
{
    return [[self alloc]init];
}

RCT_EXPORT_MODULE();
// RN调用原生方法，传值给原生
RCT_EXPORT_METHOD(toNewPage:(NSString *)params)
{
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//        NewPageViewController *ctr = [[NewPageViewController alloc]init];
//        ctr.params = params;
//        [nav pushViewController:ctr animated:YES];
//    });
    
    // 实现了methodQueue方法就不需要指定线程了
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    NewPageViewController *ctr = [[NewPageViewController alloc]init];
    ctr.params = params;
    [nav pushViewController:ctr animated:YES];
}

// RN调用原生方法，并回调，原生传值给RN
RCT_EXPORT_METHOD(rnToIOS:(NSString *)params callBack:(RCTResponseSenderBlock)callBack){
    if (callBack) {
        // callback方法中传入一个参数数组，其实该数组的第一个参数为一个NSError对象，如果没有错误返回null，其余的数据作为该方法的返回值回调给JavaScritp
        callBack(@[[NSNull null],@"我是原生传过来的"]);
    }
}

// RN调用原生方法，原生发送通知给RN
RCT_EXPORT_METHOD(sendMsg:(NSString *)notificationMsg){
    //iOS发送通知给js
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    NewPageViewController *ctr = [[NewPageViewController alloc]init];
    [nav pushViewController:ctr animated:YES];
}

// 原生页面回退一级
RCT_EXPORT_METHOD(pop){
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav popViewControllerAnimated:YES];
}

// 获取页面名字
RCT_EXPORT_METHOD(getPageName:(NSString *)name callBack:(RCTResponseSenderBlock)callBack){
    if (callBack) {
        callBack(@[[NSNull null],@"MyHome"]);
    }
}


//为js提供静态数据,这函数只会在桥接的过程中执行一次，所以不太适合变量的传递
- (NSDictionary<NSString *,id> *)constantsToExport {
    return @{@"name":@"张三",@"age":@"22"};
}

//告诉程序这个模块的代码在哪个线程执行
- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue(); //返回一个指定的线程
}

// 必须实现，用来指定这模块将会发送哪些消息给js
- (NSArray<NSString *> *)supportedEvents
{
    //这里返回的将是你要发送的消息名的数组
    return @[@"notificationName"];
}

- (void)sendNotificaiton
{
    //iOS发送通知给js
    [self sendEventWithName:@"notificationName" body:@"原生通知内容"];
}

@end
