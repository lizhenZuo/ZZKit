//
//  ZZTapView.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>
#import "ZZGlobalDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZTapView : UIView

/// 是否去掉点击背景颜色变化效果，默认是 NO， 拥有这个效果的
@property (nonatomic, assign) BOOL disBackColorEffect;

-(void)addSender:(ZZNoParamsBlock)block;

@end

NS_ASSUME_NONNULL_END
