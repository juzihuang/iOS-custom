//
//  PlayProgress.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/7/3.
//  Copyright © 2017年 789. All rights reserved.
//

#import "PlayProgress.h"
#import "CustomSlider.h"
@interface PlayProgress()
@property (nonatomic, strong) CustomSlider *slider;
@property (nonatomic, strong) UILabel *curTime;
@property (nonatomic, strong) UILabel *duration;
@property (nonatomic, strong) UIButton *playBtn;
@end

@implementation PlayProgress

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"0xFFFFFF" andAlpha:0.9F];
        //圆角
        self.layer.cornerRadius = 4.f;
        //阴影
        [self setShadowWithShadowRadius:4.f shadowOffset:CGSizeMake(0, 0) shadowColor:[UIColor colorWithHexString:@"0x000000" andAlpha:0.16f].CGColor];
        
        self.slider = [[CustomSlider alloc] initWithFrame:CGRectMake(56, 22, frame.size.width - 68, 4)];
        [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: self.slider];
        
        self.curTime = [[UILabel alloc] initWithFrame:CGRectMake(56, 30, 40, 13)];
        self.curTime.font = [UIFont systemFontOfSize:11.f];
        self.curTime.textColor = [UIColor colorWithHexString:@"0x505E58"];
        [self addSubview:_curTime];
        
        self.duration = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 40, 30, 40, 13)];
        self.duration.font = [UIFont systemFontOfSize:11.f];
        self.duration.textColor = [UIColor colorWithHexString:@"0x505E58"];
        [self addSubview:_duration];
        
        _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 8, 32, 32)];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(playBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_playBtn];
    }
    return self;
}
    
#pragma mark - setter
- (void) setIsPlaying:(BOOL)isPlaying{
    _isPlaying = isPlaying;
    if (isPlaying) {
        [_playBtn setBackgroundImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];  //出现暂停按钮
    }else{
        [_playBtn setBackgroundImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];   //出现播放按钮
    }
}

- (void) setProgressValue:(float)progressValue{
    _progressValue = progressValue;
    [self.slider setValue:_progressValue];
}

- (void) setCurDuration:(NSTimeInterval)curDuration{
    _curDuration = curDuration;
    _curTime.text = [NSString stringWithNSTimeInterval:_curDuration];
}

- (void) setTotalDuration:(NSTimeInterval)totalDuration{
    _totalDuration = totalDuration;
    _duration.text = [NSString stringWithNSTimeInterval:_totalDuration];
}
#pragma mark - action
- (void)playBtnClicked:(UIButton *)btn{
    self.clickStartPlayBlock(btn);
}

- (void)sliderValueChanged:(id)sender{
    self.clickSliderBlock(_slider.value);
}

@end
