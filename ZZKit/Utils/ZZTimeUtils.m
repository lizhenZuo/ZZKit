//
//  ZZTimeUtils.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "ZZTimeUtils.h"
//#import <YYKit/NSDate+YYAdd.h>
#import "NSDateFormatter+ZZAddition.h"
#import "ZZKTCategoryKitHeader.h"

@implementation ZZTimeUtils

/**
 获取显示的时间 2018.1.1 12:12
 
 @param server_time 服务器时间
 @return 2018.1.1 12:12
 */
+(NSString *)getShowTimeStr:(NSString *)server_time{
    if (server_time==nil || server_time.length==0) {
        return nil;
    }
    NSDate *date = [NSDate zz_dateWithString:server_time format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *weekStr = date.weekChinese;
    NSString *dayStr = [date zz_stringWithFormat:@"yyyy.M.d"];
    NSString *hourStr = [date zz_stringWithFormat:@"HH:mm"];
    NSString *timeStr = [NSString stringWithFormat:@"%@ %@ %@",dayStr,weekStr,hourStr];
    return timeStr;
}

/**
 获取显示的时间 1.1 12:12
 
 @param server_time 服务器时间
 @return 1.1 12:12
 */
+(NSString *)getShowWithoutYearTimeStr:(NSString *)server_time{
    if (server_time==nil || server_time.length==0) {
        return nil;
    }
    NSDate *date = [NSDate zz_dateWithString:server_time
                                   format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *weekStr = date.weekChinese;
    NSString *dayStr = [date zz_stringWithFormat:@"M.d"];
    NSString *hourStr = [date zz_stringWithFormat:@"HH:mm"];
    NSString *timeStr = [NSString stringWithFormat:@"%@ %@ %@",dayStr,weekStr,hourStr];
    return timeStr;
}

/**
 获取显示时间
 @param dateStr 2018-11-12 12:12:12
 @return 09:00 昨天 09:00
 */
+ (NSString *)timeFormatSpecialString:(NSString *)dateStr{
    NSAssert(dateStr, @"时间不能为空");
    if(nil == dateStr || dateStr.length==0) return @"";
    NSDate *theDate = [NSDate zz_dateWithString:dateStr format:@"yyyy-MM-dd HH:mm:ss"];
    return [self timeFormatSpecialDate:theDate];
}

/**
 获取显示时间
 @param theDate 日期对象
 @return 09:00 昨天 09:00
 */
+(NSString *)timeFormatSpecialDate:(NSDate *)theDate{
    NSAssert(theDate, @"时间不能为空");
    if(nil == theDate) return @"";
    NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval late = [theDate timeIntervalSince1970]*1;
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    
    NSString * timeString = @"";
    NSTimeInterval cha = now - late;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:unitFlags fromDate:dat];
    int nowDay = (int)[components day];
    int nowYear = (int)[components year];
    int nowMonth = (int)[components month];
    
    NSDateComponents *theComponents = [calendar components:unitFlags fromDate:theDate];
    int theDay = (int)[theComponents day];
    int theYear = (int)[theComponents year];
    int theMonth = (int)[theComponents month];
    
    if (theYear == nowYear && theMonth == nowMonth){
        switch (nowDay - theDay) {
            case 0:{
                if (cha/3600 < 1) {
                    timeString = [NSString stringWithFormat:@"%f", cha/60];
                    timeString = [timeString substringToIndex:timeString.length-7];
                    int num= [timeString intValue];
                    if (num <= 1) {
                        timeString = [NSString stringWithFormat:@"刚刚"];
                    }else{
                        timeString = [NSString stringWithFormat:@"%@分钟前", timeString];
                    }
                }else if (cha/3600 > 1 && cha/86400 < 1) {
                    timeString = [NSString stringWithFormat:@"%f", cha/3600];
                    timeString = [timeString substringToIndex:timeString.length-7];
                    timeString = [NSString stringWithFormat:@"%@小时前", timeString];
                }
                break;
            }
            case 1:{
                timeString = [theDate zz_stringWithFormat:@"昨天 HH:mm"];
                break;
            }
            case 2:{
                timeString = [theDate zz_stringWithFormat:@"前天 HH:mm"];
                break;
            }
            default:{
                timeString = [theDate zz_stringWithFormat:@"yyyy-MM-dd HH:mm"];
                break;
            }
        }
    }else{
        if (nowDay != 1) {
            timeString = [theDate zz_stringWithFormat:@"yyyy-MM-dd HH:mm"];
        }else {
            NSDate *lastDate = [NSDate dateWithTimeIntervalSinceNow:-24*3600];
//            if (lastDate.year == theDate.year && lastDate.month == theDate.month && lastDate.day == theDate.day) {
//                timeString = [theDate zz_stringWithFormat:@"昨天 HH:mm"];
//            }else {
//                timeString = [theDate zz_stringWithFormat:@"yyyy-MM-dd HH:mm"];
//            }
        }
    }
    return timeString;
}

/**
 获取展示的日期时间 2018-10-13 09:00
 
 @param serverTime 服务器时间
 @return 日期时间
 */
+(NSString *)getMinutesTimeStr:(NSString *)serverTime{
    if (serverTime == nil) {
        return nil;
    }
    NSDate *date = [NSDate zz_dateWithString:serverTime
                                      format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [date zz_stringWithFormat:@"yyyy-M-d HH:mm"];
    return timeStr;
}

/**
 获取展示的日期时间 210.13 09:00
 
 @param serverTime 服务器时间
 @return 日期时间
 */
+(NSString *)getShortMinutesTimeStr:(NSString *)serverTime{
    if (serverTime.length == 0) {
        return nil;
    }
    NSDate *date = [NSDate zz_dateWithString:serverTime
                                   format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [date zz_stringWithFormat:@"MM.dd HH:mm"];
    return timeStr;
}

/**
 获取展示的时间
 
 @param serverTime 服务器时间
 @return 时间
 */
+(NSString *)getShortMinutesTimeStrNew:(NSString *)serverTime{
    if (serverTime.length == 0) {
        return nil;
    }
    NSDate *date = [NSDate zz_dateWithString:serverTime
                                   format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [date zz_stringWithFormat:@"HH:mm"];
    return timeStr;
}

#pragma mark - ......::::::: lizhen TimeFormatter :::::::......
//时间戳转字符串
+ (NSString *)convertTimestampToString:(int32_t)timeStamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateFormatter *dateFormatter = [NSDateFormatter zz_dateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

//字符串转时间戳
+ (int32_t)convertStringToTimestamp:(NSString *)timeStr{
    NSDateFormatter *dateFormatter = [NSDateFormatter zz_dateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date =  [dateFormatter dateFromString:timeStr];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

+ (int32_t)couvertNOSecondStringToTimestamp:(NSString *)timeStr
{
    NSDateFormatter *dateFormatter = [NSDateFormatter zz_dateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date =  [dateFormatter dateFromString:timeStr];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

/// 当前时间文本（yyyy-MM-dd HH:mm:ss）
+ (NSString *)getNowymdhmsTimeStr{
    NSDate *dateNow = [NSDate date];
    NSString *dateStr = [dateNow zz_stringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
    return dateStr;
}

/// 以毫秒为单位(HH:mm:ss)
+ (NSString *)getNowhmsTimeStr{
    NSDate *dateNow = [NSDate date];
    NSString *timeStr = [dateNow zz_stringWithFormat:@"HH:mm:ss"];
    return timeStr;
}

/// 当前时间精确到毫秒3为 文本(yyyy-MM-dd HH:mm:ss.SSS)
+ (NSString *)getNowymdhmssssTimeStr{
    NSDate *dateNow = [NSDate date];
    NSString *dateStr = [dateNow zz_stringWithFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    return dateStr;
}

/// 当前时间精确到毫秒3为 文本(yyyy_MM_zz_HH_mm_ss_SSS)
+ (NSString *)getNowUnderLineTimeStr{
    NSDate *dateNow = [NSDate date];
    NSString *dateStr = [dateNow zz_stringWithFormat:@"yyyyMMddHHmmss_SSS"];
    return dateStr;
}

/// 获取当前时间的时间戳
+ (NSTimeInterval)getNowTimeStamp;{
    return [NSDate date].timeIntervalSince1970;
}

+ (NSDate *)convertTimeStringToDate:(NSString *)dateString{
    NSDateFormatter *formatter = [NSDateFormatter zz_dateFormatter] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

+ (NSString *)getYearFromTimeString:(NSString *)dateString
{
    NSDateFormatter *formatter = [NSDateFormatter zz_dateFormatter];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    [formatter setDateFormat:@"yyyy"];
    NSString *year = [formatter stringFromDate:date];
    return year;
}

+ (NSString *)getMonthFromTimeString:(NSString *)dateString
{
    NSDateFormatter *formatter = [NSDateFormatter zz_dateFormatter];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    [formatter setDateFormat:@"MM"];
    NSString *year = [formatter stringFromDate:date];
    return year;
}

+ (NSString *)getDayFromTimeString:(NSString *)dateString
{
    NSDateFormatter *formatter = [NSDateFormatter zz_dateFormatter];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    [formatter setDateFormat:@"dd"];
    NSString *year = [formatter stringFromDate:date];
    return year;
}

+ (NSString *)getYearMonthDayFromTimeString:(NSString *)dateString
{
    NSDateFormatter *formatter = [NSDateFormatter zz_dateFormatter];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *year = [formatter stringFromDate:date];
    return year;
}

//传入今天的时间，返回明天的时间
+ (NSString *)getTomorrowDay:(NSDate *)aDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [NSDateFormatter zz_dateFormatter];
    [dateday setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateday stringFromDate:beginningOfWeek];
}

//传入今天的时间，返回前天的时间
+ (NSString *)getYesterday:(NSDate *)aDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]-1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [NSDateFormatter zz_dateFormatter];
    [dateday setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateday stringFromDate:beginningOfWeek];
}

//得到今天的day字符串
+ (NSString *)getDayFromToday
{
    NSString *todayString = [ZZTimeUtils getNowymdhmsTimeStr];
    NSString *dayString = [ZZTimeUtils getDayFromTimeString:todayString];
    return dayString;
}

@end
