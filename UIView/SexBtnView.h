//
//  SexBtnView.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/4/30.
//  Copyright © 2017年 789. All rights reserved.
//
#define kSexBtnBackImageHeight  40
#define kSexBtnBackImageWidth   30

#import <UIKit/UIKit.h>

typedef enum{
    MALE,
    FEMALE
} genderClass;

@interface SexBtnView : UIView
@property (nonatomic, copy) void(^sexBtnClickedBlock)(UIButton *);

- (void)reloadBtnImage:(genderClass)gender;
@end
