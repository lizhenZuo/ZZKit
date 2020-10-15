//
//  UIView+Round.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "UIView+Round.h"
#import "objc/runtime.h"
//#import <YYKit/YYKitMacro.h>
@implementation UIView (Round)

-(void)roundCorner:(UIRectCorner)corner radio:(CGFloat)radio{
    /*
    @weakify(self);
    dispatch_async_on_main_queue(^{
        @strongify(self);
        CGRect rect = self.bounds;
        CGSize radioSize = CGSizeMake(radio, radio);//圆角尺寸
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radioSize];
        CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
        masklayer.frame = rect;
        masklayer.path = path.CGPath;//设置路径
        self.layer.mask = masklayer;
        self.clipsToBounds = YES;
        //设置flag
        [self setIsRound:YES];
    });
     */
}


-(void)setIsRound:(BOOL)isRound{
    NSNumber *number = [NSNumber numberWithBool:isRound];
    objc_setAssociatedObject(self, @selector(isRound), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isRound{
    NSNumber *number = objc_getAssociatedObject(self, @selector(isRound));
    return number.boolValue;
}

@end
