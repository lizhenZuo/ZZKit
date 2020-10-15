//
//  NSDateFormatter+ZZAddition.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "NSDateFormatter+ZZAddition.h"
#import "NSTimeZone+ZZAddition.h"
#import "NSLocale+ZZAddition.h"

@implementation NSDateFormatter (ZZAddition)

+(instancetype)zz_dateFormatter{
    static NSDateFormatter *sharedDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone zz_TimeZoneShanghai];
        NSLocale *locale = [NSLocale zz_LocalezhCN];
        [formatter setTimeZone:timeZone];
        [formatter setLocale:locale];
        sharedDateFormatter = formatter;
    });
    return sharedDateFormatter;
}

@end
