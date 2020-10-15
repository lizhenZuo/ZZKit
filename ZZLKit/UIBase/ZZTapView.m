//
//  ZZTapView.m
//  ZZKitDemo
//
//  Created by 左礼振 on 2020/10/14.
//

#import "ZZTapView.h"
#import <YYKit/YYKit.h>

@implementation ZZTapView

-(void)addSender:(ZZNoParamsBlock)block{
    [self setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        if (block) {
            block();
        }
    }];
    [self addGestureRecognizer:tapgesture];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.disBackColorEffect) {
        self.alpha = 1.f;
    } else {
        self.alpha = 0.7;
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   self.alpha = 1;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.alpha = 1;
}

@end
