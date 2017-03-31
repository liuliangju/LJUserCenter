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
 *  checked有变化时调用该方法，子类如果关注则需要继承该方法
 *
 *  @param checked   选中则为YES否则为NO
 *  @param cellModel cell数据model
 *  @param cell      点击的cell
 */
- (void)didCheckChanged:(BOOL)checked
          withCellModel:(LJUserCenterCellModel *)cellModel
                 atCell:(LJUserCenterTableViewCell *)cell;

@end

@interface LJUserCenterTableViewCell : UITableViewCell
@property (nonatomic, strong) LJUserCenterCellModel *cellModel;
@property (nonatomic, weak) id <LJUserCenterTableViewCellDelegate> delegate;
@end



