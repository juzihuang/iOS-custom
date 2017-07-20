//
//  SearchFilterCell.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/7/14.
//  Copyright © 2017年 789. All rights reserved.
//

#import "SearchFilterCell.h"
@interface SearchFilterCell()
@property (nonatomic, strong)UILabel *cellTitle;
@property (nonatomic, strong)UILabel *option;
@property (nonatomic, strong)UIImageView *foldImageView;
@end
@implementation SearchFilterCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(kPaddingLeftWidth, 0, 90, 44)];
        if ([reuseIdentifier isEqualToString:kCellIdentifier_SearchFilterCell]){
            self.cellTitle.textColor = [UIColor colorWithHexString:@" "];
            self.cellTitle.font = [UIFont systemFontOfSize:14.f];
            
            self.option = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, kScreen_Width - 100 - 36 , 44)];
            self.option.textColor = [UIColor colorWithHexString:@" "];
            self.option.font = [UIFont systemFontOfSize:14.f];
            self.option.textAlignment = NSTextAlignmentRight;
            [self.contentView addSubview:self.option];
            
            self.foldImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width - 30, (self.contentView.frame.size.height-16)/2, 16, 16)];
            [self.contentView addSubview:self.foldImageView];
        }else if([reuseIdentifier isEqualToString:kCellIdentifier_SearchFilterHeaderCell]){
            self.cellTitle.textColor = [UIColor colorWithHexString:@" "];
            self.cellTitle.font = [UIFont systemFontOfSize:18.f];
            self.cellTitle.textAlignment = NSTextAlignmentCenter;
            [self.cellTitle setFrame:CGRectMake(0, 0, kScreen_Width, self.contentView.size.height)];
            [self.contentView addSubview:self.cellTitle];
        }
    }
    return self;
}

- (void) setTitle:(NSString *)title{
    _title = title;
    [self.cellTitle setText:_title];
}

- (void) setIsFold:(BOOL)isFold{
    _isFold = isFold;
    if (_isFold) {
        [self.foldImageView setImage:[UIImage imageNamed:@" "]];
    }else{
        [self.foldImageView setImage:[UIImage imageNamed:@" "]];
    }
}

- (void) setSubTitle:(NSString *)subTitle{
    _subTitle = subTitle;
    [self.option setText: _subTitle];
}

@end
