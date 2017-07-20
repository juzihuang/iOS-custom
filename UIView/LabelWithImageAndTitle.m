//
//  LabelWithImageAndTitle.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/13.
//  Copyright © 2017年 789. All rights reserved.
//
static const float kLabelFontSize = 12.f;
static const float kImgSize = 16.f;
static const float kSpacingX = 6.f;

#import "LabelWithImageAndTitle.h"

@interface LabelWithImageAndTitle()
@property (nonatomic, strong)UIImageView *img;
@property (nonatomic, strong)UILabel *titleText;
@end
@implementation LabelWithImageAndTitle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.img = [[UIImageView alloc] initWithFrame: CGRectMake(0, (self.frame.size.height-kImgSize)/2, kImgSize, kImgSize)];
        self.titleText = [[UILabel alloc] initWithFrame: CGRectMake(kImgSize+kSpacingX, 0, self.frame.size.width-kSpacingX-kImgSize, frame.size.height) ];
        self.titleText.font = [UIFont systemFontOfSize:kLabelFontSize];
        self.titleText.textColor = [UIColor colorWithHexString:@"0x2E3E38"];
        [self addSubview:_img];
        [self addSubview:_titleText];
    }
    return self;
}

-(void)setImgAndTitleWithImg:(UIImage *)img andTitle:(NSString *)title{
    self.img.image = img;
    self.titleText.text = title;
}

@end
