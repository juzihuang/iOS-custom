//
//  CircleProgressView.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/7/3.
//  Copyright © 2017年 789. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView ()
@property (nonatomic, strong) UILabel *progressLabel;
@end

@implementation CircleProgressView
    
    
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"0xF0EEEC"];
        self.layer.cornerRadius = frame.size.width/2;
        self.layer.masksToBounds = YES;
        _progressLabel = [[UILabel alloc]initWithFrame:CGRectMake((frame.size.width - 35)/2, (frame.size.height -16)/2, 35, 16)];
        _progressLabel.textAlignment  = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor colorWithHexString:@"0x2E3E38"];
        _progressLabel.font = [UIFont systemFontOfSize:11.f];
        _progressLabel.text = [NSString stringWithFormat:@"%ld/%ld", _progressNum, _totalNum];
        [self addSubview:_progressLabel];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    [[UIColor colorWithHexString:@"0x505E58"] set];
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    CGFloat radius = self.frame.size.width/2;
    CGFloat startA = - M_PI_2;  //圆起点位置
    CGFloat endA = -M_PI_2 + M_PI * 2 * _progressNum / _totalNum;  //圆终点位置
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
}
    
- (void)setProgressNum:(NSInteger)progressNum{
    _progressNum = progressNum;
    dispatch_async(dispatch_get_main_queue(), ^{
        _progressLabel.text = [NSString stringWithFormat:@"%ld/%ld", _progressNum, _totalNum];
    });
    [self setNeedsDisplay];
}
    
@end
