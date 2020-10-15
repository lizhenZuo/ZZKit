//
//  UIView+iPad.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "UIView+iPad.h"
#import "ZZGlobalDefines.h"
//#import <YYKit/NSObject+YYAdd.h>
#import "NSBundle+ZZKT.h"

@implementation UIView (iPad)

/*
+(NSString *)nibName{
    if (ZZisiPad) {
        NSString *nibName = [NSString stringWithFormat:@"%@_iPad",self.className];
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"];
        if (nibPath && nibPath.length>0) {
            return nibName;
        }
    }
    return self.className;
}

+(instancetype)nibView{
    return [[[NSBundle mainBundle] loadNibNamed:[self.class nibName] owner:nil options:nil] firstObject];
}

+ (NSString *)nibNameWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass{
    if (ZZisiPad) {
        NSString *nibName = [NSString stringWithFormat:@"%@_iPad",self.className];
        NSBundle *nibPath = [NSBundle zz_bundleName:bundleName targetClass:targetClass];
        if (nibPath && nibPath.bundlePath.length>0) {
            return nibName;
        }
    }
    return self.className;
}

+ (instancetype)nibViewWithBundleName:(NSString *)bundleName targetClass:(Class)targetClass{
    return [[[NSBundle mainBundle] loadNibNamed:[self.class nibNameWithBundleName:bundleName targetClass:targetClass] owner:nil options:nil] firstObject];
}
*/

@end
