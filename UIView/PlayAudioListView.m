//
//  PlayAudioListView.m
//  Walk-a-long Tales
//
//  Created by 789 on 2017/6/19.
//  Copyright © 2017年 789. All rights reserved.
//

#import "PlayAudioListView.h"
#import "PlayAudioInfoCell.h"

@interface PlayAudioListView()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic) UITableView *tableView;
@end

@implementation PlayAudioListView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
        [self.tableView setBackgroundColor:[UIColor clearColor]];
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        [self.tableView registerClass:[PlayAudioInfoCell class] forCellReuseIdentifier:@"PlayAudioInfoCell"];
        [self addSubview:_tableView];
        //渐变背景
        NSArray *colors = [NSArray arrayWithObjects:(id)[UIColor colorWithHexString:@"0xFFFFFF"].CGColor,(id)kCommonBGColor.CGColor,nil];
        [self setGradientLayerWithColors:colors];
        // 阴影
        [self setShadowWithShadowRadius:8.f shadowOffset:CGSizeMake(0, 0) shadowColor:[UIColor colorWithHexString:@"0x000000" andAlpha:0.08f].CGColor];
    }
    return self;
}

#pragma mark - setter
- (void)setUnlocked:(BOOL)unlocked{
    _unlocked = unlocked;
    [self.tableView reloadData];
}

- (void)setIsDownloaded:(BOOL)isDownloaded{
    _isDownloaded = isDownloaded;
    [self.tableView reloadData];
}

- (void)setPlayAudioIndex:(NSInteger)playAudioIndex{
    _playAudioIndex = playAudioIndex;
    [self.tableView reloadData];
}
#pragma mark -- uitableviewdelegate & datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _audioList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PlayAudioInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayAudioInfoCell" forIndexPath:indexPath];
    AudioMedia *audio = (AudioMedia *) _audioList[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = audio.title;
    cell.textLabel.textColor = [UIColor colorWithHexString:_isDownloaded?@"0x2E3E38":@"0x88968E"];
    cell.unlocked = _unlocked;
    if (indexPath.row == _playAudioIndex) {
        cell.imageView.image = [UIImage imageNamed:@" "];
    }else{
        cell.imageView.image = [UIImage imageNamed:_isDownloaded?@" ":@" "];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.clickBlock(indexPath.row);
}

@end
