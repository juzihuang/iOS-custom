//
//  BtnWithImageAboveTitleStyle.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/10.
//  Copyright © 2017年 789. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BtnWithImageAboveTitleStyle : UIButton
@property (nonatomic, assign) CGRect imgRect;
@property (nonatomic, copy) NSString *selectedImageName, *unSelectedImageName, *selectedTextColor, *unSelectedTextColor;
@end
