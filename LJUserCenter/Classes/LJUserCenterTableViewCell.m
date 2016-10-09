//
//  LJUserCenterTableViewCell.m
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import "LJUserCenterTableViewCell.h"
#import "Masonry.h"

static const CGFloat kTitleMarginLeft = 15.0f;
static const CGFloat kTitleMarginRight = 30.0f;
static const CGFloat kTitleMarginRight2 = 10.0f;

@interface LJUserCenterTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;          // 标题
@property (nonatomic, strong) UILabel *detailLabel;         // 详情
@property (nonatomic, strong) UIView *detailView;           // 详情view
@property (nonatomic, strong) UISwitch *switchView;         // 开关

@end

@implementation LJUserCenterTableViewCell

- (void)setCellModel:(LJUserCenterCellModel *)cellModel {
    _cellModel = cellModel;
    [self setUp];
}

- (void)setUp {
    __weak typeof(self) weakself = self;

    if (self.cellModel.tintColor) {
        self.tintColor = self.cellModel.tintColor;
    }

    /**
     *  设置详情
     */
    if (self.cellModel.detailView) { // detailView优先
        if (self.cellModel.accessoryType == LJCellAccessoryDisclosureIndicator) {
            self.detailView.hidden = NO;
            [self.detailView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.detailView.frame.size);
                make.right.mas_equalTo(0.0f);
                make.centerY.equalTo(self.contentView);
            }];
        } else { // 没有箭头则detailView作为accessoryView
            if (_detailView) {
                [_detailView removeFromSuperview];
            }
            self.accessoryView = self.detailView;
        }
    } else if (self.cellModel.detail) {
        self.detailLabel.hidden = NO;
        self.detailLabel.text = self.cellModel.detail;
        if (self.cellModel.detailColor) {
            [self.detailLabel setTextColor:self.cellModel.detailColor];
        } else {
            [self.detailLabel setTextColor:[UIColor blackColor]];
        }
        [self.detailLabel sizeToFit];
        if (self.cellModel.accessoryType == LJCellAccessoryNone) { // 没有箭头则detailLabel作为accessoryView
            self.accessoryView = self.detailLabel;
        } else {
            [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(weakself.detailLabel.frame.size);
                make.right.mas_equalTo(0.0f);
                make.centerY.equalTo(weakself.contentView);
                CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
                make.width.mas_equalTo(screenWidth / 2);
            }];
        }
    } else {
        if (_detailView) {
            self.detailView.hidden = YES;
        }
        if (_detailLabel) {
            self.detailLabel.hidden = YES;
        }
        self.accessoryView = nil;
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    switch (self.cellModel.accessoryType) {
        case LJCellAccessoryDisclosureIndicator: {
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case LJCellAccessoryDetailDisclosureButton:
            self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case LJCellAccessoryCheckmark: {
            if (self.cellModel.checked) {
                self.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                self.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        }
        case LJCellAccessoryDetailButton:
            self.accessoryType = UITableViewCellAccessoryDetailButton;
            break;
        case LJCellAccessorySwitch: {
            self.accessoryView = self.switchView;
            self.switchView.on = self.cellModel.checked;
            [self.switchView addTarget:self action:@selector(valueChanged:)
                      forControlEvents:UIControlEventValueChanged];
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        }
        default: {
            self.accessoryType = UITableViewCellAccessoryNone;
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        }
    }
    
    /**
     *  设置title约束
     */
    self.titleLabel.text = self.cellModel.title;
    if (self.cellModel.titleColor) {
        self.titleLabel.textColor = self.cellModel.titleColor;
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    [self.titleLabel sizeToFit];
    [self addTitleLabelConstraints];
}

- (void)addTitleLabelConstraints {
    __weak typeof(self) weakself = self;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakself.titleLabel.frame.size);
        if (self.cellModel.titleAlignment == NSTextAlignmentCenter) {
            make.centerX.mas_equalTo(weakself.contentView);
            weakself.titleLabel.textAlignment = NSTextAlignmentCenter;
        } else {
            make.left.mas_equalTo(kTitleMarginLeft);
            weakself.titleLabel.textAlignment = NSTextAlignmentLeft;
        }
        make.centerY.equalTo(weakself.contentView);
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat maxWidth = 0.0f;
        CGFloat detailViewWidth = 0.0f;
        if (_detailView) {
            detailViewWidth = _detailView.frame.size.width;
        }
        if (self.cellModel.accessoryType == LJCellAccessorySwitch) {
            detailViewWidth = self.switchView.frame.size.width;
        }
        if (self.cellModel.accessoryType == LJCellAccessoryDisclosureIndicator) {
            maxWidth = screenWidth - kTitleMarginLeft - kTitleMarginRight - detailViewWidth;
        } else {
            maxWidth = screenWidth - kTitleMarginLeft - kTitleMarginRight2 - detailViewWidth;
        }
        make.width.mas_equalTo(maxWidth);
    }];
}

- (void)valueChanged:(UISwitch *)sender {
    self.cellModel.checked = !self.cellModel.checked;
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:withCellModel:atIndexPath:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:self];
        [self.delegate tableViewCell:self withCellModel:self.cellModel atIndexPath:indexPath];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma marl lazyload
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIView *)detailView {
    if (_detailView) {
        [_detailView removeFromSuperview];
    }
    _detailView = self.cellModel.detailView;
    [self.contentView addSubview:_detailView];
    return _detailView;
}

- (UISwitch *)switchView {
    if (!_switchView) {
        _switchView = [[UISwitch alloc]init];
    }
    return _switchView;
}


@end
