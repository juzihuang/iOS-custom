//
//  PlayAudioListView.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/19.
//  Copyright © 2017年 789. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayAudioListView : UIView
@property (nonatomic, copy) NSArray *audioList;
@property (nonatomic, assign) BOOL unlocked;
@property (nonatomic, assign) BOOL isDownloaded;
@property (nonatomic, assign) NSInteger playAudioIndex;  //若未播放音频，请将该值置为负数
@property (nonatomic, copy) void (^clickBlock)(NSInteger selectNum);

- (instancetype)initWithFrame:(CGRect)frame;

@end
