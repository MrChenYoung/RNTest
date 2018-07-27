//
//  commModule.h
//  RNTest
//
//  Created by MrChen on 2018/6/11.
//  Copyright © 2018年 MrChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

//继承自RCTEventEmitter的OC类将有资格给js发送消息,因为RCTEventEmitter这个类也会实现RCTBridgeModule协议的,所以不需要实现RCTBridgeModule协议
@interface commModule : RCTEventEmitter

+ (instancetype)share;

- (void)sendNotificaiton;
@end
