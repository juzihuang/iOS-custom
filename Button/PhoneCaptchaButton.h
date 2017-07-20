//
//  PhoneCaptchaButton.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/4/25.
//  Copyright © 2017年 789. All rights reserved.
//
#define kPhoneCaptchaButtonTitleFont 14
#define kPhoneCaptchaButtonTitleEnabledColor   @"0xFFFFFF"
#define kPhoneCaptchaButtonTitleUnEnabledColor @"0xCFCFCF"
#define kPhoneCaptchaButtonDuration 60

#import <UIKit/UIKit.h>

@interface PhoneCaptchaButton : UIButton

- (void)startUpTimer;
- (void)invalidateTimer;

@end
