//
//  LJUserCenterTableViewCell.h
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJUserCenterCellModel.h"

static const CGFloat kSectionHeaderAndFooterMarginLeft = 15.0f;
@class LJUserCenterTableViewCell;

@protocol LJUserCenterTableViewCellDelegate <NSObject>
@optional

/**
 *  checked有变化时回调该方法
 *
 *  @param tableViewCell 被点击的cell
 *  @param cellModel     cell数据model，checked已经被置为最新的值了
 *  @param indexPath     cell位置
 */
- (void)tableViewCell:(LJUserCenterTableViewCell *)tableViewCell
        withCellModel:(LJUserCenterCellModel *)cellModel
          atIndexPath:(NSIndexPath *)indexPath;

@end

@interface LJUserCenterTableViewCell : UITableViewCell
@property (nonatomic, strong) LJUserCenterCellModel *cellModel;
@property (nonatomic, weak) id <LJUserCenterTableViewCellDelegate> delegate;
@property (nonatomic, weak) UITableView *tableView;

@end



