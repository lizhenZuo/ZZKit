//
//  UIDevice+Model.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "UIDevice+Model.h"
#import <sys/utsname.h>
//#import <YYKit/UIDevice+YYAdd.h>
//#import <YYKit/UIApplication+YYAdd.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <objc/runtime.h>

@implementation UIDevice (Model)

+ (NSString *)getDeviceOriginName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

+ (NSString *)getDeviceName
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    
    if ([deviceString isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceString isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([deviceString isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([deviceString isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([deviceString isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    if ([deviceString isEqualToString:@"iPhone12,8"])   return @"iPhone SE 2";
    
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro (9.7英寸)";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro (9.7英寸)";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad6,11"])    return @"iPad 5";
    if ([deviceString isEqualToString:@"iPad6,12"])    return @"iPad 5";
    if ([deviceString isEqualToString:@"iPad7,1"])     return @"iPad Pro 2 (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad7,2"])     return @"iPad Pro 2 (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad7,3"])     return @"iPad Pro (10.5英寸)";
    if ([deviceString isEqualToString:@"iPad7,4"])     return @"iPad Pro (10.5英寸)";
    
    //新增
    if ([deviceString isEqualToString:@"iPad8,1"])     return @"iPad Pro (11英寸)";
    if ([deviceString isEqualToString:@"iPad8,2"])     return @"iPad Pro (11英寸)";
    if ([deviceString isEqualToString:@"iPad8,3"])     return @"iPad Pro (11英寸)";
    if ([deviceString isEqualToString:@"iPad8,4"])     return @"iPad Pro (11英寸)";
    
    if ([deviceString isEqualToString:@"iPad8,5"])     return @"iPad Pro 3 (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad8,6"])     return @"iPad Pro 3 (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad8,7"])     return @"iPad Pro 3 (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad8,8"])     return @"iPad Pro 3 (12.9英寸)";
    
    if ([deviceString isEqualToString:@"iPad8,9"])     return @"iPad Pro 2 (11英寸)";
    if ([deviceString isEqualToString:@"iPad8,10"])     return @"iPad Pro 2 (11英寸)";
    
    if ([deviceString isEqualToString:@"iPad8,11"])     return @"iPad Pro 4 (12.9英寸)";
    if ([deviceString isEqualToString:@"iPad8,12"])     return @"iPad Pro 4 (12.9英寸)";
    
    if ([deviceString isEqualToString:@"iPad11,1"])     return @"iPad mini 5";
    if ([deviceString isEqualToString:@"iPad11,2"])     return @"iPad mini 5";
    
    if ([deviceString isEqualToString:@"iPad11,3"])     return @"iPad Air 3";
    if ([deviceString isEqualToString:@"iPad11,4"])     return @"iPad Air 3";
    
    if ([deviceString isEqualToString:@"AppleTV2,1"])    return @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])    return @"Apple TV 4";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceString;
}

///人能看得懂的名字
+ (NSString *)zz_DeviceName{
    return [self getDeviceName];
}

/*
static int kMB = 1024*1024;
/// 设备总内存
- (int64_t)zz_memoryTotal{
    return self.memoryTotal/kMB;
}

/// 设备已使用内存
- (int64_t)zz_memoryUsed{
    return self.memoryUsed/kMB;
}

/// 设备可用内存
- (int64_t)zz_memoryFree{
    return self.memoryFree/kMB;
}

/// app使用的内存
- (int64_t)zz_app_memoryUsage{
    //https://github.com/aozhimin/iOS-Monitor-Platform
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t result = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
    if (result != KERN_SUCCESS){
        return -1;
    }else{
        return vmInfo.phys_footprint/kMB;
    }
}

/// app使用的CPU
- (float)zz_app_cpuUsage{
    return [UIApplication sharedApplication].cpuUsage;
}

/// 设备CPU使用情况
- (float)zz_cpuUsage{
    return self.cpuUsage;
}

/// cpu数量
- (NSUInteger)zz_cpuCount{
    return self.cpuCount;
}
*/

@end
