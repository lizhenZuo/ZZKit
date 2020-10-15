//
//  UITabBar+ZZAddition.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (ZZAddition)

/// 显示小红点
/// @param index vc索引
- (void)showBadgeOnItemIndex:(NSInteger)index;


/// 隐藏小红点
/// @param index vc索引
- (void)hideBadgeOnItemIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
