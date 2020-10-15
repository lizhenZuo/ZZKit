//
//  NSDate+ZZAddition.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZZAddition)

/**
 中文星期
 @return NSString
 */
-(NSString *)weekChinese;

/**
 日期文本
 @param format yyyy-MM-dd
 @return NSString
 */
- (NSString *)zz_stringWithFormat:(NSString *)format;

/**
 文本转日期
 @param dateString 2019-04-18
 @param format yyyy-MM-dd
 @return NSDate
 */
+ (NSDate *)zz_dateWithString:(NSString *)dateString format:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
