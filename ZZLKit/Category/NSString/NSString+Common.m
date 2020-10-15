//
//  NSString+Common.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "NSString+Common.h"
//#import <DDKTGlobalDefine/DDKTGlobalDefineHeader.h>
@implementation NSString (Common)

+ (BOOL)isEmpty:(NSString *)string{
    return string == nil || string.length == 0;
};

/// 网络速度显示(10M/s)
/// @param speedBytes 字节
+(NSString *)netSpeedWityBytes:(uint64_t)speedBytes{
    return [NSString stringWithFormat:@"%@/s",[self netSpeedWithByteString:speedBytes]];;
}

/// 网络速度显示 10M
/// @param speedBytes 字节
+(NSString *)netSpeedWithByteString:(uint64_t)speedBytes{
    NSString *txt = nil;
    if (speedBytes>1024*1024*1024){
        txt = [NSString stringWithFormat:@"%.1fGB",speedBytes/(1024.0*1024*1024.0)];
    }else if (speedBytes>=1024*1024){
        txt = [NSString stringWithFormat:@"%.1fM",speedBytes/(1024.0*1024.0)];
    }else if (speedBytes>=1024 && speedBytes) {
        txt = [NSString stringWithFormat:@"%llukb",speedBytes/1024];
    }else{
        txt = [NSString stringWithFormat:@"%llub",speedBytes];
    }
    return txt;
}

/** 是否为http https头*/
-(BOOL)isValidHTTP{
    return [self hasPrefix:@"http://"] || [self hasPrefix:@"https://"];
}

/// 是否为Base64的图片字符
-(BOOL)isBase64Image{
    return [self hasPrefix:@"data:image"];
}

+ (NSMutableAttributedString *)getAttributedStringWithString:(NSString *)string font1:(UIFont *)font1 color1:(UIColor *)color1 length1:(NSInteger)length1 font2:(UIFont *)font2 color2:(UIColor *)color2
{
    //total
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger totalLength = attributedString.length;
    
    //title1
    [attributedString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, length1)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, length1)];
    
    //title2
    [attributedString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(length1, totalLength-length1)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(length1, totalLength-length1)];
    
    return attributedString;
}

+ (NSMutableAttributedString *)getAttributedStringWithString:(NSString *)string font1:(UIFont *)font1 color1:(UIColor *)color1 length1:(NSInteger)length1 font2:(UIFont *)font2 color2:(UIColor *)color2 length2:(NSInteger)length2 font3:(UIFont *)font3 color3:(UIColor *)color3
{
    //total
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSInteger totalLength = attributedString.length;
    
    //title1
    [attributedString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, length1)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, length1)];
    
    //title2
    [attributedString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(length1, totalLength-length1)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(length1, totalLength-length1)];
    
    //title2
    [attributedString addAttribute:NSFontAttributeName value:font3 range:NSMakeRange(length1+length2, totalLength-(length1+length2))];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color3 range:NSMakeRange(length1+length2, totalLength-(length1+length2))];
    
    return attributedString;
}

//下划线
+ (NSMutableAttributedString *)getUnderlineString:(NSString *)string font:(UIFont *)font color:(UIColor *)color
{
    NSDictionary *attribtDic2 = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:string attributes:attribtDic2];
    [attribtStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    
    return attribtStr;
}

//下划线
+ (NSMutableAttributedString *)getUnderlineString:(NSString *)string font1:(UIFont *)font1 color1:(UIColor *)color1 length1:(NSInteger)length1 font2:(UIFont *)font2 color2:(UIColor *)color2
{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attribtStr addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, string.length-length1)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, string.length-length1)];
    
    [attribtStr addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(string.length-length1, length1)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(string.length-length1, length1)];
    [attribtStr addAttributes:attribtDic range:NSMakeRange(string.length-length1, length1)];
    
    return attribtStr;
}

//下划线
+ (NSMutableAttributedString *)getUnderlineString:(NSString *)string font1:(UIFont *)font1 color1:(UIColor *)color1 length1:(NSInteger)length1 font2:(UIFont *)font2 color2:(UIColor *)color2 length2:(NSInteger)length2 font3:(UIFont *)font3 color3:(UIColor *)color3
{
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attribtStr addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, length1)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, length1)];
    
    [attribtStr addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(length1, length2)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(length1, length2)];
    [attribtStr addAttributes:attribtDic range:NSMakeRange(length1, length2)];
    
    [attribtStr addAttribute:NSFontAttributeName value:font3 range:NSMakeRange(length1+length2, string.length-length1-length2)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color3 range:NSMakeRange(length1+length2, string.length-length1-length2)];
    
    return attribtStr;
}

//中划线
+ (NSMutableAttributedString *)getStrikethroughString:(NSString *)string font:(UIFont *)font color:(UIColor *)color
{
    NSDictionary *attribtDic2 = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:string attributes:attribtDic2];
    [attribtStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    [attribtStr addAttribute:NSBaselineOffsetAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, string.length)];
    
    return attribtStr;
}

//中划线
+ (NSMutableAttributedString *)getStrikethroughString:(NSString *)string font1:(UIFont *)font1 color1:(UIColor *)color1 length1:(NSInteger)length1 font2:(UIFont *)font2 color2:(UIColor *)color2
{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attribtStr addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, string.length-length1)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0, string.length-length1)];
    
    [attribtStr addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(string.length-length1, length1)];
    [attribtStr addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(string.length-length1, length1)];
    [attribtStr addAttribute:NSBaselineOffsetAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(string.length-length1, length1)];
    [attribtStr addAttributes:attribtDic range:NSMakeRange(string.length-length1, length1)];
    
    return attribtStr;
}


/// url encode
- (NSString *)dd_URLEncodedStringValue {
    return DDAFPercentEscapedStringFromString([self description]);
}

/**
 Returns a percent-escaped string following RFC 3986 for a query string key or value.
 RFC 3986 states that the following characters are "reserved" characters.
    - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
    - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="

 In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
 query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
 should be percent-escaped in the query string.
    - parameter string: The string to be percent-escaped.
    - returns: The percent-escaped string.
 */
NSString * DDAFPercentEscapedStringFromString(NSString *string) {
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";

    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];

    // FIXME: https://github.com/AFNetworking/AFNetworking/pull/3028
    // return [string stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];

    static NSUInteger const batchSize = 50;

    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;

    while (index < string.length) {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wgnu"
        NSUInteger length = MIN(string.length - index, batchSize);
#pragma GCC diagnostic pop
        NSRange range = NSMakeRange(index, length);

        // To avoid breaking up character sequences such as 👴🏻👮🏽
        range = [string rangeOfComposedCharacterSequencesForRange:range];

        NSString *substring = [string substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];

        index += range.length;
    }

    return escaped;
}
@end
