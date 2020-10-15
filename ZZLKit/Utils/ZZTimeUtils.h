//
//  ZZTimeUtils.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZTimeUtils : NSObject

/**
 获取显示的时间 2018.1.1 12:12
 
 @param server_time 服务器时间
 @return 2018.1.1 12:12
 */
+(NSString *)getShowTimeStr:(NSString *)server_time;

/**
 获取显示的时间 1.1 12:12
 
 @param server_time 服务器时间
 @return 1.1 12:12
 */
+(NSString *)getShowWithoutYearTimeStr:(NSString *)server_time;

/**
 获取显示时间
 @param dateStr 2018-11-12 12:12:12
 @return 09:00 昨天 09:00
 */
+ (NSString *)timeFormatSpecialString:(NSString *)dateStr;

/**
 获取显示时间
 @param theDate 日期对象
 @return 09:00 昨天 09:00
 */
+(NSString *)timeFormatSpecialDate:(NSDate *)theDate;

/**
 获取展示的日期时间 2018-10-13 09:00
 
 @param serverTime 服务器时间
 @return 日期时间
 */
+(NSString *)getMinutesTimeStr:(NSString *)serverTime;

/**
 获取展示的日期时间 210.13 09:00
 
 @param serverTime 服务器时间
 @return 日期时间
 */
+(NSString *)getShortMinutesTimeStr:(NSString *)serverTime;

/**
 获取展示的时间
 
 @param serverTime 服务器时间
 @return 时间
 */
+(NSString *)getShortMinutesTimeStrNew:(NSString *)serverTime;

#pragma mark - ......::::::: lizhen TimeFormatter :::::::......
//时间戳转字符串
+ (NSString *)convertTimestampToString:(int32_t)timeStamp;

//字符串转时间戳
+ (int32_t)convertStringToTimestamp:(NSString *)timeStr;

//不带秒的
+ (int32_t)couvertNOSecondStringToTimestamp:(NSString *)timeStr;

/// 当前时间文本（yyyy-MM-dd HH:mm:ss）
+ (NSString *)getNowymdhmsTimeStr;

/// 当前时间（HH:mm:ss）
+ (NSString *)getNowhmsTimeStr;

/// 当前时间精确到毫秒3为 文本(yyyy-MM-dd HH:mm:ss.SSS
+ (NSString *)getNowymdhmssssTimeStr;

/// 当前时间精确到毫秒3为 文本(yyyy_MM_dd_HH_mm_ss_SSS)
+ (NSString *)getNowUnderLineTimeStr;

/// 获取当前时间的时间戳
+ (NSTimeInterval)getNowTimeStamp;


//时间字符串转date
+ (NSDate *)convertTimeStringToDate:(NSString *)dateString;

+ (NSString *)getYearFromTimeString:(NSString *)dateString;

+ (NSString *)getMonthFromTimeString:(NSString *)dateString;

+ (NSString *)getDayFromTimeString:(NSString *)dateString;

+ (NSString *)getYearMonthDayFromTimeString:(NSString *)dateString;

//传入今天的时间，返回明天的时间
+ (NSString *)getTomorrowDay:(NSDate *)aDate;

//传入今天的时间，返回前天的时间
+ (NSString *)getYesterday:(NSDate *)aDate;

//得到今天的day字符串
+ (NSString *)getDayFromToday;

@end

NS_ASSUME_NONNULL_END
