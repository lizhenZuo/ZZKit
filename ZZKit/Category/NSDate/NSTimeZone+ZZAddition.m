//
//  NSTimeZone+ZZAddition.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "NSTimeZone+ZZAddition.h"

@implementation NSTimeZone (ZZAddition)

+(instancetype)zz_TimeZoneShanghai{
    return [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
}

@end
