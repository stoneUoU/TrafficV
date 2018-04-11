//
//  TrafficVC.h
//  TrafficV
//
//  Created by test on 2018/4/9.
//  Copyright © 2018年 com.youlu. All rights reserved.
//
//  交通监控视频VC

#import <UIKit/UIKit.h>

#import "TrafficV.h"

#import "MissNetV.h"

//#import "WebSocketNetwork.h"



@interface TrafficVC : UIViewController<NSURLSessionDataDelegate,TrafficVDel,MissNetVDel>

@property (nonatomic, strong)TrafficV *trafficV;

@property (nonatomic, strong)MissNetV *missNetV;

@property (nonatomic, strong)NSMutableData *data;

@property (nonatomic ,strong)UIImage *img;

//@property (nonatomic ,strong)WebSocketNetwork *socketNet;

@property (strong, nonatomic) UICKeyChainStore *keychainStore;
//是否有网络
@property(nonatomic, copy) NSString *netUseVals;
@end

