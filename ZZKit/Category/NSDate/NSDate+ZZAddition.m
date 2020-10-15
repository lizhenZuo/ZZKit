//
//  NSDate+ZZAddition.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "NSDate+ZZAddition.h"
#import "NSTimeZone+ZZAddition.h"
#import "NSLocale+ZZAddition.h"
#import "NSDateFormatter+ZZAddition.h"

@implementation NSDate (ZZAddition)

/**
 中文星期
 @return NSString
 */
-(NSString *)weekChinese{
    NSTimeZone *timeZone = [NSTimeZone zz_TimeZoneShanghai];
    NSLocale *locale = [NSLocale zz_LocalezhCN];
    NSCalendar *calender = [NSCalendar currentCalendar];
    [calender setTimeZone:timeZone];
    [calender setLocale:locale];
    NSInteger weekday = [[calender components:NSCalendarUnitWeekday fromDate:self] weekday];
    NSArray *weekdayArray = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    return [weekdayArray objectAtIndex:weekday];
};

/**
 日期文本
 @param format yyyy-MM-dd
 @return NSString
 */
- (NSString *)zz_stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter zz_dateFormatter];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

/**
 文本转日期
 @param dateString 2019-04-18
 @param format yyyy-MM-dd
 @return NSDate
 */
+ (NSDate *)zz_dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [NSDateFormatter zz_dateFormatter];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

@end
