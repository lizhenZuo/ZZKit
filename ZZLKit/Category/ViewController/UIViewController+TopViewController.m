//
//  UIViewController+TopViewController.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "UIViewController+TopViewController.h"

@implementation UIViewController (TopViewController)

#pragma mark - ......::::获取当前最上层的控制器
+ (UIViewController *)getTopCurrentController {
    UIWindow *topWindow;
    if (@available(iOS 13.0, *)) {
        topWindow = [self keyWindow];
    } else {
        topWindow = [UIApplication sharedApplication].keyWindow;
    }
    if (topWindow.windowLevel != UIWindowLevelNormal) {
        topWindow = [self returnWindowWithWindowLevelNormal];
    }
    UIViewController *topController = topWindow.rootViewController;
    if (topController == nil) {
        topWindow = [UIApplication sharedApplication].delegate.window;
        if (topWindow.windowLevel != UIWindowLevelNormal) {
            topWindow = [self returnWindowWithWindowLevelNormal];
        }
        topController = topWindow.rootViewController;
    }
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    if ([topController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController*)topController;
        topController = [nav.viewControllers lastObject];
        while(topController.presentedViewController) {
            topController = topController.presentedViewController;
        }
    }
    return topController;
}

+ (UIWindow *)returnWindowWithWindowLevelNormal {
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (UIWindow *topWindow in windows) {
        if (topWindow.windowLevel == UIWindowLevelNormal) {
            return topWindow;
        }
    }
    if (@available(iOS 13.0, *)) {
        return [self keyWindow];
    } else {
        return [UIApplication sharedApplication].keyWindow;
    }
}

/// 对于 iOS 13 以上的
+ (UIWindow*)keyWindow {
    UIWindow *foundWindow = nil;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    return foundWindow;
}

@end
