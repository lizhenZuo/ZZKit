//
//  CALayer+XibBorderColor.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "CALayer+XibBorderColor.h"

@implementation CALayer (XibBorderColor)

- (void)setBorderColorWithUIColor:(UIColor *)borderColorWithUIColor {
    self.borderColor = borderColorWithUIColor.CGColor;
}

- (UIColor *)borderColorWithUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
