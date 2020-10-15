//
//  ZZUtilities.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//Basic UI Size.
#define UI_HIGHT_STATUS (20)
#define UI_HIGHT_NAVIGATION_BAR (44)
#define UI_SIZE_NAVIGATION_BAR_ICON (CGSizeMake(40, 40))
#define UI_SIZE_NAVIGATION_BAR_TITLE (CGSizeMake(([OurUtilities isDeviceIphone]? 200: 620), UI_HIGHT_NAVIGATION_BAR))
#define UI_SIZE_NAVIGATION_BAR_BUTTON (CGSizeMake(44, UI_HIGHT_NAVIGATION_BAR))
#define UI_SIZE_TOOL_BAR_ICON (CGSizeMake(20, 20))
#define UI_HIGHT_TABLE_BAR ([OurUtilities isDeviceIphone]? 49: 98)
#define UI_SIZE_TABLE_BAR_ICON (CGSizeMake(30, 30))
#define UI_SIZE_AD_BANNER ([OurUtilities isDeviceIphone]? CGSizeMake(320, 50): CGSizeMake(728, 90))
#define UI_SIZE_BANNER ([OurUtilities isDeviceIphone]? CGSizeMake(320, 50): CGSizeMake(768, 90))

#define UI_SIZE_SCREEN ([[UIScreen mainScreen] bounds].size)
#define UI_SIZE_VIEW_WITHOUT_NAV (CGSizeMake(UI_SIZE_SCREEN.width, UI_SIZE_SCREEN.height - UI_HIGHT_STATUS - UI_HIGHT_NAVIGATION_BAR))
#define UI_SIZE_VIEW_WITHOUT_NAV_TAB (CGSizeMake(UI_SIZE_SCREEN.width, UI_SIZE_SCREEN.height - UI_HIGHT_STATUS - UI_HIGHT_NAVIGATION_BAR - UI_HIGHT_TABLE_BAR))

// Recommended UI Size.
#define UI_FONT_SIZE_RECOMMENDED_NAVIGATION_BAR_TITLE ([OurUtilities isDeviceIphone]? 18: 18)
#define UI_HEIGHT_RECOMMENDED_TABLE_CELL ([OurUtilities isDeviceIphone]? 50: 80)
#define UI_SIZE_RECOMMENDED_TABLE_CELL_ICON ([OurUtilities isDeviceIphone]? CGSizeMake(30, 30): CGSizeMake(48, 48))
#define UI_SIZE_RECOMMENDED_TABLE_CELL_INDICATOR ([OurUtilities isDeviceIphone]? CGSizeMake(15, 15): CGSizeMake(24, 24))

//fb add
#define UI_KEYBOARD_HEIGHT ([OurUtilities isDeviceIphone5]? 500/2 :500/2 )
#define UI_KEYBOARD_ORIGIN_Y (UI_SCREEN_HEIGHT - UI_KEYBOARD_HEIGHT)
#define UI_SCREEN_HEIGHT ([OurUtilities isDeviceIphone5]? 1136/2 :960/2 )

#define OurSafeString(s) (((s)==nil)?(@""):(s))

#define OurAbs(n) ((n)>=0? (n): -(n))
#define OurFloatEquals(f1,f2) (OurAbs((f1)-(f2))<=0.0001)

#define OurUIResPath(p) ([OurUIUtilities resourcePath:(p)])
#define OurUIResValue(v) ([OurUIUtilities resourceValue:(v)])

//颜色
#define kGetColor(r,g,b)       [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define OurUIColor(rgb,a) ([OurUIUtilities color:(rgb) alpha:(a)])
#define OurUIColorRGBA(r,g,b,a) ([UIColor colorWithRed:(CGFloat)(r)/256.0 green:(CGFloat)(g)/256.0 blue:(CGFloat)(b)/256.0 alpha:a])
#define OurUIColorRGBA1(r,g,b) OurUIColorRGBA(r,g,b,1)
#define OurUIColorRef(rgb,a) ([OurUIColor((rgb),(a)) CGColor])

#define OurUIResImage(image) ([OurUIUtilities resourceImage:(image)])

@interface ZZUtilities : NSObject

/** 是否为iphonex系列 iPhoneXS iPhoneXR iPhoneXSMax*/
+ (BOOL)isDeviceIphoneXSeries;

/**
 显示为00:00
 @param intDuration 时间s
 @return 00:00
 */
+ (NSString *)convertTotDurationString:(NSInteger)intDuration;

// 读取本地JSON文件
+(NSDictionary *)readLocalFileWithName:(NSString *)name;

//获取当前storyboard
+ (UIStoryboard *)getCurrentStoryboard;

// path
+ (NSString *)resourcePath:(NSString *)path;
+ (CGFloat)resourceValue:(CGFloat)value;

// color
+ (UIColor *)color:(NSUInteger)rgb alpha:(CGFloat)a;
+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size;

// image
+ (UIImage *)resourceImage:(NSString *)image;

// ios version. "4.3.5"
+ (NSArray *)iosVersion;

+ (NSUInteger)iosSubVerion:(NSUInteger)index;

// no "/".
+ (NSString *)resouceDir;

// no "/".
+ (NSString *)docDir;

// no "/".
+ (NSString *)cacheDir;

// no "/".
+ (NSString *)libDir;

// includes "/".
+ (NSString *)tmpDir;

+ (NSString *)trimString:(NSString *)str;
+ (NSString *)safeString:(NSString *)str;

+ (NSString *)currentLanguage;

+ (NSString *)getBundleId;
+ (NSString *)getBundleName;
+ (NSString *)getBundleDisplayName;
+ (NSString *)getBundleVersion;
+ (NSString *)getAppVersion;

+ (NSInteger)random:(NSInteger)min max:(NSInteger)max;
+ (NSArray *)randomArray:(NSInteger)min max:(NSInteger)max count:(NSUInteger)count;
+ (NSUInteger)randomIndexWithPercent:(NSArray *)arrPercent;

+ (BOOL)isDeviceIpad;
+ (BOOL)isDeviceIpad3;
+ (BOOL)isDeviceIpadPro;
+ (BOOL)isDeviceIphone;
+ (BOOL)isDeviceIphone3;
+ (BOOL)isDeviceIphone4;
+ (BOOL)isDeviceIphone5;
+ (BOOL)isDeviceIphone6;
+ (BOOL)isDeviceIphone6Plus;
+ (BOOL)isDeviceIphoneXS;
+ (BOOL)isDeviceIphoneXSMax;
+ (BOOL)isIosSimulator;

+ (NSString *)changeExtensionWithFilepath:(NSString *)filepath extension:(NSString *)extension;

@end

NS_ASSUME_NONNULL_END
