//
//  UIButton+ZZEnlargeEdge.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ZZEnlargeEdge)

/**
 扩大按钮响应区域
 
 @param inset  top, left, bottom, right
 */
- (void)addExtensionInset:(UIEdgeInsets)inset;

@end

NS_ASSUME_NONNULL_END
