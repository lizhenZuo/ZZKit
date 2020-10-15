//
//  UIImage+ZZKT.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "UIImage+ZZKT.h"
#import "NSBundle+ZZKT.h"

@implementation UIImage (ZZKT)

+ (instancetype)zz_imgWithName:(NSString *)name bundle:(NSString *)bundleName targetClass:(Class)targetClass{
    NSString *dir = [NSString stringWithFormat:@"%@.bundle",bundleName];
    
    NSString *bundlePath = [[NSBundle bundleForClass:targetClass].resourcePath
                                stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",dir]];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:name
                                    inBundle:resource_bundle
               compatibleWithTraitCollection:nil];
    return image;
    
}

+ (instancetype)zz_imgWithName:(NSString *)name bundle:(NSString *)bundleName{
    NSBundle *resource_bundle = [NSBundle zz_bundleName:bundleName];
    UIImage *image = [UIImage imageNamed:name
                                    inBundle:resource_bundle
               compatibleWithTraitCollection:nil];
    return image;
    
}

@end
