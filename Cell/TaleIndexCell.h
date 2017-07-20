//
//  TaleIndexCell.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/14.
//  Copyright © 2017年 789. All rights reserved.
//
static NSString *const kCellIdentifier_TaleIndex = @"TaleIndexCell";
static NSString *const kCellIdentifier_TaleDetail = @"TaleDetailCell";
static const float kTaleIndexCellHeight = 187.5;

#import <UIKit/UIKit.h>
#import "Tales.h"

@interface TaleIndexCell : UITableViewCell
@property (nonatomic, weak) Tales *tale;

@end
