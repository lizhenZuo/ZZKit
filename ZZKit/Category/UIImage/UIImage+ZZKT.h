//
//  UIImage+ZZKT.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZZKT)

+ (instancetype)zz_imgWithName:(NSString *)name bundle:(NSString *)bundleName targetClass:(Class)targetClass;
+ (instancetype)zz_imgWithName:(NSString *)name bundle:(NSString *)bundleName;

@end

NS_ASSUME_NONNULL_END
