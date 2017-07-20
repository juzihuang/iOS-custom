//
//  ButtonWithCircleStyle.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/9.
//  Copyright © 2017年 789. All rights reserved.
//

#import "ButtonWithCircleStyle.h"

@implementation ButtonWithCircleStyle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = frame.size.height/2;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //首先调用父类的方法确定点击的区域确实在按钮的区域中
    BOOL res = [super pointInside:point withEvent:event];
    if (res) {
        //绘制一个圆形path
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        if ([path containsPoint:point]) {
            //如果在path区域内，返回YES
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
