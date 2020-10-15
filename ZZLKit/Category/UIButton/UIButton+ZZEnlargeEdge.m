//
//  UIButton+ZZEnlargeEdge.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "UIButton+ZZEnlargeEdge.h"
#import <objc/runtime.h>

@implementation UIButton (ZZEnlargeEdge)

- (void)addExtensionInset:(UIEdgeInsets)inset{
    objc_setAssociatedObject(self, _cmd, [NSValue valueWithUIEdgeInsets:inset], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    UIEdgeInsets insert = [objc_getAssociatedObject(self, @selector(addExtensionInset:)) UIEdgeInsetsValue];
    
    CGRect newFrame = CGRectMake(self.bounds.origin.x-insert.left, self.bounds.origin.y-insert.top, self.bounds.size.width+insert.left+insert.right, self.bounds.size.height+insert.top+insert.bottom);
    
    if (CGRectEqualToRect(newFrame, self.bounds)) {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(newFrame, point);
}

@end
