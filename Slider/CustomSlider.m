//
//  CustomSlider.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/7/6.
//  Copyright © 2017年 789. All rights reserved.
//

#import "CustomSlider.h"

@implementation CustomSlider

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.cornerRadius = 3.f;
        self.maximumTrackTintColor = [UIColor colorWithHexString:@"0xF0EEEC"];
        self.minimumTrackTintColor = [UIColor colorWithHexString:@"0xCAED7C"];
        [self setThumbImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)trackRectForBounds:(CGRect)bounds {
    return CGRectMake(0, 0, bounds.size.width, 4);
}

@end
