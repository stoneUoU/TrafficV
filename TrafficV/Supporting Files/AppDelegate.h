//
//  AppDelegate.h
//  TrafficV
//
//  Created by test on 2018/4/9.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import <UIKit/UIKit.h>
// iOS实现Ping命令
#import "STPingTester.h"

typedef void(^DictB)(NSDictionary *, BOOL);

@protocol AppDel <NSObject>
- (void)toWakeUp:(NSDictionary *)dict;
@end

@interface AppDelegate : UIResponder <UIApplicationDelegate,STPingDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic, strong) STPingTester* pingTester;

@property (weak, nonatomic) id<AppDel> delegate;

@property (nonatomic, strong) DictB dictB;

+(instancetype) shareIns;

@end

