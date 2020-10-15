//
//  UIDevice+Model.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Model)

/// 原始名字
+ (NSString *)getDeviceOriginName;

///人能看得懂的名字
+ (NSString *)getDeviceName;

///人能看得懂的名字
+ (NSString *)zz_DeviceName;

/// 设备总内存
- (int64_t)zz_memoryTotal;

/// 设备已使用内存
- (int64_t)zz_memoryUsed;

/// 设备可用内存
- (int64_t)zz_memoryFree;

/// app使用的内存
- (int64_t)zz_app_memoryUsage;

/// app使用的CPU
- (float)zz_app_cpuUsage;

/// 设备CPU使用情况
- (float)zz_cpuUsage;

/// cpu数量
- (NSUInteger)zz_cpuCount;


@end
