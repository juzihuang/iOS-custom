//
//  PlayProgress.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/7/3.
//  Copyright © 2017年 789. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayProgress : UIView
@property (nonatomic, assign) float progressValue;
@property (nonatomic, assign) NSTimeInterval curDuration;
@property (nonatomic, assign) NSTimeInterval totalDuration;
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, copy) void (^clickStartPlayBlock)(UIButton *);
@property (nonatomic, copy) void (^clickSliderBlock)(float value);
@end
