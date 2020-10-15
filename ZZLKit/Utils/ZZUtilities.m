//
//  ZZUtilities.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "ZZUtilities.h"

@implementation ZZUtilities

/** 是否为iphonex系列 iPhoneXS iPhoneXR iPhoneXSMax*/
+ (BOOL)isDeviceIphoneXSeries{
    return [self isDeviceIphoneXSMax] || [self isDeviceIphoneXS];
}

/**
 显示为00:00
 @param intDuration 时间s
 @return 00:00
 */
+ (NSString *)convertTotDurationString:(NSInteger)intDuration{
    return [NSString stringWithFormat:@"%02d:%02d", (int)(intDuration / 60), (int)(intDuration % 60)];
}

// 读取本地JSON文件
+(NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"geojson"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

+ (UIStoryboard *)getCurrentStoryboard
{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"HealthScale_Iphone4" bundle:nil];
    return storyboard;
}

+ (NSString *)resourcePath:(NSString *)path
{
    NSString *suffix_iphone = @"iphone";
    NSString *suffix_iphone5 = @"iphone5";
    NSString *suffix_ipad = @"ipad";
    
    // prepare new path
    NSString *pathExt = [path pathExtension];
    if (pathExt == nil || pathExt.length == 0)
    {
        return path;
    }
    NSString *pathWithoutExt = [path stringByDeletingPathExtension];

    // device array
    NSMutableArray *arrayDevice = [NSMutableArray array];
    if ([ZZUtilities isDeviceIpad])
    {
        // ipad
        [arrayDevice addObject:suffix_ipad];
    }
    else
    {
        // iphone
        if ([ZZUtilities isDeviceIphone5])
        {
            [arrayDevice addObject:suffix_iphone5];
        }
        [arrayDevice addObject:suffix_iphone];
    }
    
    // lang
    NSString *curLang = [ZZUtilities currentLanguage];
    
    // "path + device + lang"
    // iphone3 = path-iphone-lang, path-iphone-lang@2x
    // iphone4 = path-iphone-lang@2x, path-iphone-lang
    // iphone5 = path-iphone5-lang@2x, path-iphone-lang@2x, path-iphone-lang
    // ipad = path-ipad-lang, path-ipad-lang@2x
    // ipad3 = path-ipad-lang@2x, path-ipad-lang
    for (NSString *device in arrayDevice)
    {
        NSString *newPath = [NSString stringWithFormat:@"%@-%@-%@.%@", pathWithoutExt, device, curLang, pathExt];
        NSString *newPath2x = [NSString stringWithFormat:@"%@-%@-%@@2x.%@", pathWithoutExt, device, curLang, pathExt];
        NSString *newFullPath = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath];
        NSString *newFullPath2x = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath2x];
        if ([[NSFileManager defaultManager] fileExistsAtPath:newFullPath] || [[NSFileManager defaultManager] fileExistsAtPath:newFullPath2x])
        {
            return newPath;
        }
    }
    
    // "path + device"
    // iphone3 = path-iphone, path-iphone@2x
    // iphone4 = path-iphone@2x, path-iphone
    // iphone5 = path-iphone5@2x, path-iphone@2x, path-iphone
    // ipad = path-ipad, path-ipad@2x
    // ipad3 = path-ipad@2x, path-ipad
    for (NSString *device in arrayDevice)
    {
        NSString *newPath = [NSString stringWithFormat:@"%@-%@.%@", pathWithoutExt, device, pathExt];
        NSString *newPath2x = [NSString stringWithFormat:@"%@-%@@2x.%@", pathWithoutExt, device, pathExt];
        NSString *newFullPath = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath];
        NSString *newFullPath2x = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath2x];
        if ([[NSFileManager defaultManager] fileExistsAtPath:newFullPath] || [[NSFileManager defaultManager] fileExistsAtPath:newFullPath2x])
        {
            return newPath;
        }
    }
    
    // "path + lang"
    // iphone3 = path-lang, path-lang@2x
    // iphone4 = path-lang@2x, path-lang
    // iphone5 = path-lang@2x, path-lang
    // ipad = path-lang@2x
    // ipad3 = path-lang@2x
    {
        NSString *newPath = [NSString stringWithFormat:@"%@-%@.%@", pathWithoutExt, curLang, pathExt];
        NSString *newPath2x = [NSString stringWithFormat:@"%@-%@@2x.%@", pathWithoutExt, curLang, pathExt];
        NSString *newFullPath = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath];
        NSString *newFullPath2x = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath2x];
        
        if ([ZZUtilities isDeviceIpad] && [[NSFileManager defaultManager] fileExistsAtPath:newFullPath2x])
        {
            return newPath2x;
        }

        if ([[NSFileManager defaultManager] fileExistsAtPath:newFullPath] || [[NSFileManager defaultManager] fileExistsAtPath:newFullPath2x])
        {
            return newPath;
        }
    }

    // "path"
    // iphone3 = path, path@2x
    // iphone4 = path@2x, path
    // iphone5 = path@2x, path
    // ipad = path@2x
    // ipad3 = path@2x
    {
        NSString *newPath = [NSString stringWithFormat:@"%@.%@", pathWithoutExt, pathExt];
        NSString *newPath2x = [NSString stringWithFormat:@"%@@2x.%@", pathWithoutExt, pathExt];
        NSString *newFullPath = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath];
        NSString *newFullPath2x = [NSString stringWithFormat:@"%@/%@", [ZZUtilities resouceDir], newPath2x];

        if ([ZZUtilities isDeviceIpad] && [[NSFileManager defaultManager] fileExistsAtPath:newFullPath2x])
        {
            return newPath2x;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:newFullPath] || [[NSFileManager defaultManager] fileExistsAtPath:newFullPath2x])
        {
            return newPath;
        }
    }
    
    // all others = path
    return path;
}

+ (CGFloat)resourceValue:(CGFloat)value;
{
    return ([ZZUtilities isDeviceIpad])? value * 2.0: value;
}

+ (UIColor *)color:(NSUInteger)rgb alpha:(CGFloat)a
{
    if (rgb > 0xffffff || a < 0 || a > 1)
    {
        return [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    }
    
    return [UIColor colorWithRed:((CGFloat)((rgb & 0xff0000) >> 16) / 256.0) green:((CGFloat)((rgb & 0xff00) >> 8) / 256.0) blue:((CGFloat)(rgb & 0xff) / 256.0) alpha:a];
}

+ (UIImage *)imageWithColor:(UIColor *)color Size:(CGSize)size
{
    CGSize imageSize = size;
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return pressedColorImg;
}

+ (UIImage *)resourceImage:(NSString *)image
{
    return [UIImage imageNamed:[ZZUtilities resourcePath:image]];
}

+ (NSArray *)iosVersion
{
    NSString *strVersion = [[UIDevice currentDevice] systemVersion];
    NSArray *arrayStrSubVersion = [strVersion componentsSeparatedByString:@"."];
    return arrayStrSubVersion;
}

+ (NSUInteger)iosSubVerion:(NSUInteger)index
{
    NSArray *arrVersions = [ZZUtilities iosVersion];
    if (index >= arrVersions.count)
    {
        return 0;
    }
    NSUInteger subVersion = [[arrVersions objectAtIndex:index] integerValue];
    return subVersion;
}

+ (NSString *)resouceDir
{
    return [[NSBundle mainBundle] resourcePath];
}

+ (NSString *)docDir
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    return dir;
}

+ (NSString *)cacheDir
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    return dir;
}

+ (NSString *)libDir
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *dir = [paths objectAtIndex:0];
    return dir;
}

+ (NSString *)tmpDir
{
    NSString *dir = NSTemporaryDirectory();
    return dir;
}

+ (NSString *)trimString:(NSString *)str
{
    NSString *tStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return tStr;
}

+ (NSString *)safeString:(NSString *)str
{
    if (str == nil) {
        return @"";
    }
    return str;
}

+ (NSString *)currentLanguage
{
    NSString* strLanguage = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    return strLanguage;
}

+ (NSString *)getBundleId
{
    NSString *str = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey];
    return str;
}

+ (NSString *)getBundleName
{
    NSString *str = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
    return str;
}

+ (NSString *)getBundleDisplayName
{
    NSString *strLocal = NSLocalizedStringFromTable(@"CFBundleDisplayName", @"InfoPlist", nil);
    if (strLocal != nil && strLocal.length > 0 && NSOrderedSame != [strLocal compare:@"CFBundleDisplayName"])
    {
        return strLocal;
    }

    NSString *str = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    return str;
}

+ (NSString *)getBundleVersion
{
    NSString *str = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    return str;
}

+ (NSString *)getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return appCurVersion;
}

+ (NSInteger)random:(NSInteger)min max:(NSInteger)max
{
    if (min < 0 || max > RAND_MAX || max < min) {
        return -1;
    }
    
    if (min == max) {
        return min;
    }
    
    NSInteger ret = (arc4random() % (max - min + 1)) + min;
    return ret;
}

+ (NSArray *)randomArray:(NSInteger)min max:(NSInteger)max count:(NSUInteger)count
{
    if (min < 0 || max > RAND_MAX || max < min || count > (max - min + 1)) {
        return nil;
    }
    
    NSMutableArray *arrRan = [NSMutableArray array];
    NSUInteger i = 0;
    while (i < count)
    {
        BOOL isValid = YES;
        NSInteger newRan = [self random:min max:max];
        for (NSUInteger j = 0; j < i; j++)
        {
            NSInteger oldRan = [(NSNumber *)[arrRan objectAtIndex:j] integerValue];
            if (newRan == oldRan)
            {
                isValid = NO;
                break;
            }
        }
        
        if (isValid)
        {
            NSNumber *num = [NSNumber numberWithInteger:newRan];
            [arrRan addObject:num];
            i ++;
        }
    }
    
    return arrRan;
}

+ (NSUInteger)randomIndexWithPercent:(NSArray *)arrPercent
{
    if (arrPercent == nil || arrPercent.count <= 1) {
        return 0;
    }
    
    NSUInteger total = 0;
    for (NSNumber *percent in arrPercent) {
        total += [percent integerValue];
    }
    
    NSUInteger ran = [self random:1 max:total];
    NSUInteger index = 0;
    NSUInteger tmpTotal = 0;
    for (NSNumber *percent in arrPercent) {
        tmpTotal += [percent integerValue];
        if (tmpTotal >= ran) {
            return index;
        }
        index ++;
    }
    return 0;
}

+ (BOOL)isDeviceIpad
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

+ (BOOL)isDeviceIpad3
{
    if (! [self isDeviceIpad])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return ((screenSize.width == 2048 && screenSize.height == 1536)
            || (screenSize.width == 1536 && screenSize.height == 2048));
}

+ (BOOL)isDeviceIpadPro
{
    if (! [self isDeviceIpad])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return ((screenSize.width == 1366 && screenSize.height == 1024)
            || (screenSize.width == 1024 && screenSize.height == 1366));
}

+ (BOOL)isDeviceIphone
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isDeviceIphone3
{
    if (! [self isDeviceIphone])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    return (screenScale == 1
            && ((screenSize.width == 480 && screenSize.height == 320) || (screenSize.width == 320 && screenSize.height == 480)));
}

+ (BOOL)isDeviceIphone4
{
    if (! [self isDeviceIphone])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    return (screenScale == 2
            && ((screenSize.width == 480 && screenSize.height == 320) || (screenSize.width == 320 && screenSize.height == 480)));
}

+ (BOOL)isDeviceIphone5
{
    if (! [self isDeviceIphone])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return ((screenSize.width == 568 && screenSize.height == 320) || (screenSize.width == 320 && screenSize.height == 568));
}

+ (BOOL)isDeviceIphone6
{
    if (! [self isDeviceIphone])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return ((screenSize.width == 667 && screenSize.height == 375) || (screenSize.width == 375 && screenSize.height == 667));
}

+ (BOOL)isDeviceIphone6Plus
{
    if (! [self isDeviceIphone])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return ((screenSize.width == 736 && screenSize.height == 414) || (screenSize.width == 414 && screenSize.height == 736));
}

+ (BOOL)isDeviceIphoneXS
{
    if (![self isDeviceIphone])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return ((screenSize.width == 375 && screenSize.height == 812) || (screenSize.width == 812 && screenSize.height == 375));
}

+ (BOOL)isDeviceIphoneXSMax
{
    if (![self isDeviceIphone])
    {
        return NO;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    return ((screenSize.width == 414 && screenSize.height == 896) || (screenSize.width == 896 && screenSize.height == 414));
}

+ (BOOL)isIosSimulator
{
#if (TARGET_IPHONE_SIMULATOR)
    return YES;
#else
    return NO;
#endif
}


+ (NSString *)changeExtensionWithFilepath:(NSString *)filepath extension:(NSString *)extension
{
    NSString *strExt = [filepath pathExtension];
    if (strExt == nil || strExt.length == 0)
    {
        return nil;
    }
    
    NSMutableString * strNewFilepath = [NSMutableString stringWithString:filepath];
    [strNewFilepath replaceOccurrencesOfString:strExt withString:extension options:NSBackwardsSearch range:NSMakeRange([strNewFilepath length] - [strExt length], [strExt length])];
    return strNewFilepath;
}

@end
