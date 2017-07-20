//
//  InputWithPickerCell.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/4/30.
//  Copyright © 2017年 789. All rights reserved.
//
#define kCellIdentifier_Input_WithPicker_Cell @"Input_WithPicker_Cell"
#define kCellIdentifier_Input_Btn_WithPicker_Cell @"Input_Btn_WithPicker_Cell"

#import <UIKit/UIKit.h>

@interface InputWithPickerCell : UITableViewCell<UITextFieldDelegate>

@property (strong, nonatomic, readonly) UITextField *textField;
@property (nonatomic,copy) void(^inputWithPickerClickedBlock)();

- (void)setPlaceholder:(NSString *)phStr value:(NSString *)valueStr;
@end
