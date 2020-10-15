//
//  NSData+MD5.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "NSData+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (MD5)

- (NSString *)md5
{
    const char* str = [self bytes];
    unsigned char result[16];
    CC_MD5(str, (CC_LONG)self.length, result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:16 * 2];
    for(int i = 0; i<16; i++) {
        [ret appendFormat:@"%02x",(unsigned int)(result[i])];
    }
    return ret;
}

@end
