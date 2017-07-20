//
//  SearchFilterCell.h
//  Walk-a-long Tales
//
//  Created by 789 on 2017/7/14.
//  Copyright © 2017年 789. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *const kCellIdentifier_SearchFilterCell = @"searchFilterCell";
static NSString *const kCellIdentifier_SearchFilterHeaderCell = @"searchFilterHeaderCell";

@interface SearchFilterCell : UITableViewCell
@property (nonatomic, copy) NSString *title, *subTitle;
@property (nonatomic, assign) BOOL isFold;
@end
