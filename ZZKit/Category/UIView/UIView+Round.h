//
//  UIView+Round.h
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import <UIKit/UIKit.h>

@interface UIView (Round)

@property (nonatomic,assign,readonly) BOOL isRound;

-(void)roundCorner:(UIRectCorner)corner radio:(CGFloat)radio;

@end
