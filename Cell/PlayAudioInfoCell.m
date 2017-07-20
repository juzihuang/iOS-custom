//
//  PlayAudioInfoCell.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/7/2.
//  Copyright © 2017年 789. All rights reserved.
//

#import "PlayAudioInfoCell.h"
@interface PlayAudioInfoCell ()
@property (strong, nonatomic) UIImageView *lockImg;
@end
@implementation PlayAudioInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _lockImg = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width -50, 10, 24, 24)];
        [_lockImg setImage : [UIImage imageNamed:@" "] ];
        [self.contentView addSubview:_lockImg];
        self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //左侧icon
    self.imageView.frame =CGRectMake(30, 10,24,24);
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 66;
    self.textLabel.frame = tmpFrame;
}

- (void)setUnlocked:(BOOL)unlocked{
    _unlocked = unlocked;
    if (unlocked) {
        [self.lockImg removeFromSuperview];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
