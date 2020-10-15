//
//  NSBundle+ZZKT.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "NSBundle+ZZKT.h"

@implementation NSBundle (ZZKT)

+ (instancetype)zz_bundleName:(NSString *)bundleName targetClass:(Class)targetClass{
    NSBundle *bundle = [NSBundle bundleForClass:targetClass];
    NSURL *url = [bundle URLForResource:bundleName withExtension:@"bundle"];
    return url?[NSBundle bundleWithURL:url]:[NSBundle mainBundle];
}

+ (instancetype)zz_bundleName:(NSString *)bundleName{
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:bundleName];
    associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
    NSBundle *associateBunle = associateBundleURL?[NSBundle bundleWithURL:associateBundleURL]:[NSBundle mainBundle];
    associateBundleURL = [associateBunle URLForResource:bundleName withExtension:@"bundle"];
    NSBundle *bundle = associateBundleURL?[NSBundle bundleWithURL:associateBundleURL]:[NSBundle mainBundle];
    return bundle;
    
}

@end
