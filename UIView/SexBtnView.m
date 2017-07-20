//
//  SexBtnView.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/4/30.
//  Copyright © 2017年 789. All rights reserved.
//

#import "SexBtnView.h"

@interface SexBtnView()

@property (nonatomic, strong)UIButton *boyBtn, *girlBtn;

@end

@implementation SexBtnView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.boyBtn = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width/4 - kSexBtnBackImageWidth/2, (frame.size.height - kSexBtnBackImageHeight)/2, kSexBtnBackImageWidth, kSexBtnBackImageHeight)];
        [self.boyBtn addTarget:self action:@selector(sexBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.boyBtn.tag = 0;
        
        self.girlBtn = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width*3/4 - kSexBtnBackImageWidth/2, (frame.size.height - kSexBtnBackImageHeight)/2, kSexBtnBackImageWidth, kSexBtnBackImageHeight)];
        [self.girlBtn addTarget:self action:@selector(sexBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.girlBtn.tag = 1;
        
        [self addSubview: self.boyBtn];
        [self addSubview: self.girlBtn];
    }
    return self;
}

#pragma mark - Button
- (void)reloadBtnImage:(genderClass)gender{
    //默认选择男性
    [self.boyBtn setBackgroundImage:[UIImage imageNamed:(gender == 1)?@"boyUnSelected":@"boySelected"] forState:UIControlStateNormal];
    [self.girlBtn setBackgroundImage:[UIImage imageNamed:(gender == 1)?@"girlSelected":@"girlUnSelected"] forState:UIControlStateNormal];
}

- (void)sexBtnClicked:(UIButton *)sender{
    if(sender.tag == 0){
        [self.boyBtn setBackgroundImage:[UIImage imageNamed:@"boySelected"] forState:UIControlStateNormal];
        [self.girlBtn setBackgroundImage:[UIImage imageNamed:@"girlUnSelected"] forState:UIControlStateNormal];
    }else{
        [self.boyBtn setBackgroundImage:[UIImage imageNamed:@"boyUnSelected"] forState:UIControlStateNormal];
        [self.girlBtn setBackgroundImage:[UIImage imageNamed:@"girlSelected"] forState:UIControlStateNormal];
    }
    if(_sexBtnClickedBlock){
        self.sexBtnClickedBlock(sender);
    }
}

@end
