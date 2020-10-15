//
//  NSBundle+ZZKT.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (ZZKT)

+ (instancetype)zz_bundleName:(NSString *)bundleName targetClass:(Class)targetClass;
+ (instancetype)zz_bundleName:(NSString *)bundleName;

@end

NS_ASSUME_NONNULL_END
