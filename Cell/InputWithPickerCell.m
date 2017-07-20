//
//  InputWithPickerCell.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/4/30.
//  Copyright © 2017年 789. All rights reserved.
//

#import "InputWithPickerCell.h"

@interface InputWithPickerCell ()

@property (strong, nonatomic) UIButton *pickerBtn;

@end

@implementation InputWithPickerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (!_textField) {
            _textField = [UITextField new];
            _textField.clearButtonMode = UITextFieldViewModeNever;
            _textField.textColor = [UIColor blackColor];
            _textField.delegate = self;
            [_textField setFont:[UIFont systemFontOfSize:16]];
            [self.contentView addSubview:_textField];
            [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(self.contentView);
                make.left.equalTo(self.contentView).offset(kLoginPaddingLeftWidth);
                make.right.equalTo(self.contentView).offset(-kLoginPaddingLeftWidth);
                make.centerY.equalTo(self.contentView);
            }];
        }
    }
    if([reuseIdentifier isEqualToString:kCellIdentifier_Input_Btn_WithPicker_Cell]){
        _pickerBtn = ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width - 44- kLoginPaddingLeftWidth, 0, kBtnHeight, kBtnHeight)];
            [btn setImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(pickerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
        [self.contentView addSubview:_pickerBtn];
    }
    [self.textField resignFirstResponder];
    return self;
}

- (void)setPlaceholder:(NSString *)phStr value:(NSString *)valueStr {
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:phStr? phStr: @"" attributes:nil];
    if(valueStr && valueStr.length >0){
        self.textField.text = valueStr;
    }
}

#pragma mark - btn Click
- (void)pickerBtnClicked{
    if (self.inputWithPickerClickedBlock) {
        self.inputWithPickerClickedBlock();
    }
}

#pragma mark - UIView
- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
    UIView *rightElement;
    if ([self.reuseIdentifier isEqualToString:kCellIdentifier_Input_Btn_WithPicker_Cell]) {
        rightElement = _pickerBtn;
    }
    
    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat offset = rightElement? (CGRectGetMinX(rightElement.frame) - kScreen_Width - 10): -kLoginPaddingLeftWidth;
        make.right.equalTo(self.contentView).offset(offset);
    }];
}

#pragma mark TextField
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self pickerBtnClicked];
    return NO;
    
}

@end
