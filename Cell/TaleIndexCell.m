//
//  TaleIndexCell.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/14.
//  Copyright © 2017年 789. All rights reserved.
//

static const float kBottomTag_height     = 16.5;
static const float kCategoryLabel_width  = 74.f;
static const float kCategoryLabel_height = 18.f;

#import "TaleIndexCell.h"
#import "LabelWithImageAndTitle.h"
#import "PlistFileManager.h"
#import "NSArray+BlocksKit.h"
#import "NSDictionary+BlocksKit.h"

@interface TaleIndexCell()
@property (nonatomic, strong)UIImageView *backImg;
//@property (nonatomic, strong)UILabel *titleText;
@property (nonatomic, strong)LabelWithImageAndTitle *nickName;
@property (nonatomic, strong)LabelWithImageAndTitle *language;
@property (nonatomic, strong)LabelWithImageAndTitle *date;
@property (nonatomic, strong)LabelWithImageAndTitle *playTimes;
@end

@implementation TaleIndexCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        _backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Height, kTaleIndexCellHeight)];
        [self.contentView addSubview:_backImg];
        
        if ([reuseIdentifier isEqualToString:kCellIdentifier_TaleDetail]){
            _nickName = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kPaddingLeftWidth, kTaleIndexCellHeight + 8 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(100.f), kBottomTag_height)];
            _language = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone6_Desgin(115.5f), kTaleIndexCellHeight + 8 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(88.f), kBottomTag_height)];
            _date = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone6_Desgin(205.f), kTaleIndexCellHeight + 8 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(108.f), kBottomTag_height)];
            _playTimes = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone6_Desgin(327.f), kTaleIndexCellHeight + 8 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(34.f), kBottomTag_height)];
        }else{
            
            _nickName = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kPaddingLeftWidth, kTaleIndexCellHeight - 9.5 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(100.f), kBottomTag_height)];
            _language = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone6_Desgin(115.5f), kTaleIndexCellHeight - 9.5 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(88.f), kBottomTag_height)];
            _date = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone6_Desgin(205.f), kTaleIndexCellHeight - 9.5 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(108.f), kBottomTag_height)];
            _playTimes = [[LabelWithImageAndTitle alloc] initWithFrame:CGRectMake(kScaleFrom_iPhone6_Desgin(327.f), kTaleIndexCellHeight - 9.5 - kBottomTag_height, kScaleFrom_iPhone6_Desgin(34.f), kBottomTag_height)];
            
        }
        [self.contentView addSubview:_nickName];
        [self.contentView addSubview:_language];
        [self.contentView addSubview:_date];
        [self.contentView addSubview:_playTimes];
    }
    return self;
}

-(void)getKeyWithValue:(NSString *)fileName andValue:(NSNumber *)value block:(void (^)(id key))block{
    PlistFileManager *fm = [PlistFileManager new];
    [[fm readFileWithName:fileName] bk_each:^(id key, id obj) {
        if(obj == value){
            block(key);
        }
    }];
}

- (void)setTale:(Tales *)tale{
    _tale = tale;
    [_backImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@" ",kBaseFileUrlStr, _tale.searchCoverURL]] placeholderImage:[UIImage imageNamed:@" "]];
    for (UIView *view in self.backImg.subviews){  //先删除之前的
        [view removeFromSuperview];
    }
    for(int i = 0; i < tale.categoryTags.count; i++){
        UIImageView *taleCategory = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width/2-kCategoryLabel_width*tale.categoryTags.count/2+i*kCategoryLabel_width+i*6, 88.5, kCategoryLabel_width, kCategoryLabel_height)];
        [taleCategory setImage: [UIImage imageNamed:[NSString stringWithFormat:@" ",[_tale.categoryTags[i] intValue]]]];
        [self.backImg addSubview:taleCategory];
    }
    
    __weak typeof(self) weakself = self;
    [self.nickName setImgAndTitleWithImg:[UIImage imageNamed:@" "] andTitle:_tale.speakerName];
    [self getKeyWithValue:kLanguageTagListPath andValue: _tale.languageTag block:^(id key) {
        [weakself.language setImgAndTitleWithImg:[UIImage imageNamed:@" "] andTitle:key];
    }];
    [_date setImgAndTitleWithImg:[UIImage imageNamed:@" "] andTitle: [_tale.createDate stringWithFormat:[NSDate dateFormatString]]];
    [_playTimes setImgAndTitleWithImg:[UIImage imageNamed:@" "] andTitle:[NSString stringWithFormat:@"%@",_tale.playTimes]];
}

@end
