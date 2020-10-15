//
//  ZZGlobalDefines.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#ifndef ZZGlobalDefines_h
#define ZZGlobalDefines_h

#import "ZZUtilities.h"

#ifdef __cplusplus
extern "C" {
#endif

#pragma mark - ......::::::: 全局Block :::::::......
/** 空Block */
typedef void(^ZZNoParamsBlock)(void);
typedef void(^ZZOneParamsBlock)(NSString *param);
typedef void(^ZZTwoParamsBlock)(NSString *param1, NSString *param2);

#pragma mark - ......::::::: UIApplication window :::::::......
#define kZZApplicationWindow [[UIApplication sharedApplication].delegate window]

#pragma mark - ......::::::: CGD锁 :::::::......
#define ZZLock() dispatch_semaphore_wait(self->_lock, DISPATCH_TIME_FOREVER)
#define ZZUnlock() dispatch_semaphore_signal(self->_lock)

#pragma mark - ......::::::: 子类重载断言 :::::::......
#define ZZNSAssertMustOverridden  NSAssert(NO, @"The method \"%@\" in \"%@\" must be overridden.",NSStringFromSelector(_cmd),NSStringFromClass(self.class))

#ifndef DDColorHex
#define DDColorHex(str)  [UIColor colorWithHexString:(str)]
#endif

#pragma mark - ......::::::: iPad全局判断 :::::::......
#define ZZisiPad kZZisiPad()
static inline BOOL const kZZisiPad() {
    static dispatch_once_t one;
    static BOOL pad;
    dispatch_once(&one, ^{
        pad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    });
    return pad;
}

#pragma mark - ......::::::: 屏幕宽度 :::::::......
static NSInteger const kDDPageSizeDefault = 20;//默认翻页数据总数
static NSInteger const kiPhoneXAdaptiveNumber = 30;//iphonex 侧边宽度适配
static NSInteger const kiPhoneStatusBarHeight = 20; //时间状态栏的高度
static NSInteger const kCommonMarginHeight = 10;//通用的高度间距，tableview collectionview margin height
static NSInteger const kLeadingIPhoneXValue = kCommonMarginHeight + kiPhoneXAdaptiveNumber;//iphonex 侧边宽度适配
//导航栏高度
static inline CGFloat const kCustonNavigationBarHeight() {
    if (ZZisiPad) {
        return 110;
    }else{
        return 60;
    }
}
static inline CGFloat const kDDNavigationBarHeight() {
    if (ZZisiPad) {
        return 80;
    } else {
        if ([ZZUtilities isDeviceIphoneXSeries]) {
            return 88;
        } else {
            return 64;
        }
    }
}

static inline CGFloat const kDDStatusBarHeight() {
    if ([ZZUtilities isDeviceIphoneXSeries]) {
        return 44;
    } else {
        return 20;
    }
}

/** 状态栏高度 */
#define kDDStatusBarHeight kDDStatusBarHeight()
/** 导航栏高度 */
#define kDDNavigationBarHeight kDDNavigationBarHeight()

#pragma mark - ......::::::: 获取文字 :::::::......
static inline NSString *const ZZStringFormat(NSString *format,...) {
    @try {
        va_list args;
        va_start(args, format);
        NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        return str;
    } @catch(NSException *e) {
    }
    return nil;
}

#pragma mark - ......::::::: 全局 异/同 步线程 :::::::......
static inline void dispatch_async_global_queue_default(void (^block)(void)) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (block) {
            block();
        }
    });
}

#pragma mark - ......::::::: 设计的宽度尺寸 :::::::......
#define kZZUIDesignScreenWidth ZZUIDesignScreenWidth()
static inline CGFloat ZZUIDesignScreenWidth() {
    static CGFloat width;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       width = ZZisiPad?768:375;
    });
    return width;
}

#pragma mark - ......::::::: 竖屏屏幕尺寸 :::::::......
#define kZZScreenPortraitWidth ZZScreenPortraitSize().width
#define kZZScreenPortraitHeight ZZScreenPortraitSize().height
static inline CGSize ZZScreenPortraitSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

#pragma mark - ......::::::: 横屏屏幕尺寸 :::::::......
#define kZZScreenLandScapeWidth ZZScreenLandScapeSize().width
#define kZZScreenLandScapeHeight ZZScreenLandScapeSize().height
static inline CGSize ZZScreenLandScapeSize() {
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.width < size.height) {
            CGFloat tmp = size.width;
            size.width = size.height;
            size.height = tmp;
        }
    });
    return size;
}

#pragma mark - ......::::::: 动态屏幕尺寸 :::::::......
#define kZZScreenWidth ZZScreenSize().width
#define kZZScreenHeight ZZScreenSize().height
static inline CGSize ZZScreenSize() {
    //iPad强制为横屏幕宽高
    if (kZZisiPad()) {
        return ZZScreenLandScapeSize();
    }else{
        return [UIScreen mainScreen].bounds.size;
    }
}

#ifdef __cplusplus
}
#endif

#endif /* ZZGlobalDefines_h */
