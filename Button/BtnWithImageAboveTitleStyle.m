//
//  BtnWithImageAboveTitleStyle.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/10.
//  Copyright © 2017年 789. All rights reserved.
//

#import "BtnWithImageAboveTitleStyle.h"

@implementation BtnWithImageAboveTitleStyle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect imageRect = _imgRect;
    return imageRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0;
    CGFloat titleY = _imgRect.origin.y + _imgRect.size.height;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    CGRect titleRect = CGRectMake(titleX, titleY, titleW, titleH);
    return titleRect;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        if (_selectedTextColor) {
            [self setTitleColor:[UIColor colorWithHexString:_selectedTextColor] forState:UIControlStateNormal];
        }
        if (_selectedImageName) {
            [self setImage:[UIImage imageNamed:_selectedImageName] forState:UIControlStateNormal];
        }
    }else{
        if (_unSelectedTextColor) {
            [self setTitleColor:[UIColor colorWithHexString:_unSelectedTextColor] forState:UIControlStateNormal];
        }
        if (_unSelectedImageName) {
            [self setImage:[UIImage imageNamed:_unSelectedImageName] forState:UIControlStateNormal];
        }
    }
}

@end
