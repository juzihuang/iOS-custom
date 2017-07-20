//
//  PhoneCaptchaButton.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/4/25.
//  Copyright © 2017年 789. All rights reserved.
//

#import "PhoneCaptchaButton.h"



@interface PhoneCaptchaButton ()
@property (nonatomic, strong, readwrite) NSTimer *timer;
@property (assign, nonatomic) NSTimeInterval durationToValidity;

@end

@implementation PhoneCaptchaButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:kPhoneCaptchaButtonTitleFont];
        self.layer.cornerRadius = kBtnCornerRadius;
        self.enabled = YES;
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    [self setTitleColor:[UIColor colorWithHexString:kPhoneCaptchaButtonTitleEnabledColor] forState:UIControlStateNormal];
    if (enabled) {
        [self setTitle:@"发送验证码" forState:UIControlStateNormal];
        self.backgroundColor = kBtnEnabledColor;
    }else {
        self.backgroundColor = kBtnUnEnabledColor;
        if ([self.titleLabel.text isEqualToString:@"发送验证码"]){
            [self setTitle:@"正在发送..." forState:UIControlStateNormal];
        }
    }
}

- (void)startUpTimer{
    _durationToValidity = kPhoneCaptchaButtonDuration;
    
    if (self.isEnabled) {
        self.enabled = NO;
    }
    [self setTitle:[NSString stringWithFormat:@"%.0f 秒", _durationToValidity] forState:UIControlStateNormal];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(redrawTimer:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)invalidateTimer{
    if (!self.isEnabled) {
        self.enabled = YES;
    }
    [self.timer invalidate];
    self.timer = nil;
}

- (void)redrawTimer:(NSTimer *)timer {
    _durationToValidity--;
    if (_durationToValidity > 0) {
        self.titleLabel.text = [NSString stringWithFormat:@"%.0f 秒", _durationToValidity];
        [self setTitle:[NSString stringWithFormat:@"%.0f 秒", _durationToValidity] forState:UIControlStateNormal];
    }else{
        [self invalidateTimer];
    }
}

@end
