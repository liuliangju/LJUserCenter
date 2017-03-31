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

- (void)didCheckChanged:(BOOL)checked
        withCellModel:(LJUserCenterCellModel *)cellModel
          atCell:(LJUserCenterTableViewCell *)cell;

@optional
@end

@interface LJUserCenterTableViewCell : UITableViewCell

@property (nonatomic, strong) LJUserCenterCellModel *cellModel;
@property (nonatomic, weak) id <LJUserCenterTableViewCellDelegate> delegate;


@end
