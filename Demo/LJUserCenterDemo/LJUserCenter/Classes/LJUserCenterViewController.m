//
//  LJUserCenterViewController.m
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import "LJUserCenterViewController.h"
#import "LJUserCenterTableViewCell.h"

static const CGFloat kHeaderMarginBottom = 8.0f;
static const CGFloat kFooterMarginTop = 8.0f;
static const CGFloat kHeaderAndFooterFontSize = 14.0f;

@interface LJUserCenterViewController ()<LJUserCenterTableViewCellDelegate>

@end

@implementation LJUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userCenterDatasource = [self loadUserCenterDatasource];
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.tableView.showsVerticalScrollIndicator = NO;
    [super viewDidAppear:animated];
    self.tableView.showsVerticalScrollIndicator = YES;
}


#pragma mark - UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.userCenterDatasource) {
        return self.userCenterDatasource.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.userCenterDatasource) {
        NSArray *sectionDatasource = self.userCenterDatasource[section];
        return sectionDatasource.count;
    }
    return 0;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJUserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
    if (!cell) {
        cell = [[LJUserCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:kReuseIdentifier];
        cell.tableView = tableView;
        cell.delegate = self;
        
    }
    cell.cellModel = self.userCenterDatasource[indexPath.section][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJUserCenterCellModel *cellModel = self.userCenterDatasource[indexPath.section][indexPath.row];
    if (cellModel) {
        return cellModel.height;
    }
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LJUserCenterCellModel *cellModel = self.userCenterDatasource[indexPath.section][indexPath.row];
    if (cellModel.operation) {
        cellModel.operation();
    } else if (cellModel.clazz) {
        Class clazz = NSClassFromString(cellModel.clazz);
        UIViewController *controller = [[clazz alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    } else if (cellModel.accessoryType == LJCellAccessoryCheckmark) {
        LJUserCenterTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            if (cell.delegate && [cell.delegate respondsToSelector:@selector(tableViewCell:withCellModel:atIndexPath:)]) {
                [cell.delegate tableViewCell:cell withCellModel:cellModel atIndexPath:indexPath];
            }
        } else {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            if (cell.delegate && [cell.delegate respondsToSelector:@selector(tableViewCell:withCellModel:atIndexPath:)]) {
                [cell.delegate tableViewCell:cell withCellModel:cellModel atIndexPath:indexPath];
            }
        }
        for (LJUserCenterTableViewCell *theCell in [tableView visibleCells]) {
            if (theCell != cell && (theCell.accessoryType == UITableViewCellAccessoryCheckmark)) {
                theCell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LJUserCenterCellModel *cellModel = [self.userCenterDatasource[section] lastObject];
    NSString *headerText = cellModel.headerText;
    if (headerText) {
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel.textAlignment = cellModel.headerAlignment;
        headerLabel.text = headerText;
        headerLabel.numberOfLines = 0;
        headerLabel.font = [UIFont systemFontOfSize:kHeaderAndFooterFontSize];
        headerLabel.textColor = [UIColor grayColor];
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft  * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString:headerText
                                  constraintSize:constraintSize];
        if (section == 0) {
            if (cellModel.footerAlignment == NSTextAlignmentCenter) {
                CGFloat x = (kScreenWidth - size.width) / 2;
                headerLabel.frame = CGRectMake(x, kFirstSectionHeaderHeight, size.width, size.height);
            } else {
                headerLabel.frame =
                CGRectMake(kSectionHeaderAndFooterMarginLeft, kFirstSectionHeaderHeight, size.width, size.height);
            }
        } else {
            if (cellModel.footerAlignment == NSTextAlignmentCenter) {
                CGFloat x = (kScreenWidth - size.width) / 2;
                headerLabel.frame = CGRectMake(x, kOtherSectionHeaderHeight, size.width, size.height);
            } else {
                headerLabel.frame =
                CGRectMake(kSectionHeaderAndFooterMarginLeft, kOtherSectionHeaderHeight, size.width, size.height);
            }
        }
        UIView *headerView = [[UIView alloc] init];
        [headerView addSubview:headerLabel];
        CGFloat headerViewHeight;
        if (section == 0) {
            headerViewHeight = size.height + kHeaderMarginBottom + kFirstSectionHeaderHeight;
        } else {
            headerViewHeight = size.height + kHeaderMarginBottom + kOtherSectionHeaderHeight;
        }
        headerView.frame = CGRectMake(0, 0, kScreenWidth, headerViewHeight);
        return headerView;
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    LJUserCenterCellModel *cellModel = [self.userCenterDatasource[section] lastObject];
    NSString *footerText = cellModel.footerText;
    if (footerText) {
        UILabel *footerLabel = [[UILabel alloc] init];
        footerLabel.textAlignment = cellModel.footerAlignment;
        footerLabel.text = footerText;
        footerLabel.numberOfLines = 0;
        footerLabel.font = [UIFont systemFontOfSize:kHeaderAndFooterFontSize];
        footerLabel.textColor = [UIColor grayColor];
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString:footerText
                                  constraintSize:constraintSize];
        if (cellModel.footerAlignment == NSTextAlignmentCenter) {
            CGFloat x = (kScreenWidth - size.width) / 2;
            footerLabel.frame = CGRectMake(x, kFooterMarginTop, size.width, size.height);
        } else {
            footerLabel.frame = CGRectMake(kSectionHeaderAndFooterMarginLeft, kFooterMarginTop, size.width, size.height);
        }
        UIView *footerView = [[UIView alloc] init];
        [footerView addSubview:footerLabel];
        CGFloat footerViewHeight;
        if (section == 0) {
            footerViewHeight = size.height + kFooterMarginTop + kSectionFooterHeight;
        } else {
            footerViewHeight = size.height + kFooterMarginTop + kSectionFooterHeight;
        }
        footerView.frame = CGRectMake(0, 0, kScreenWidth, footerViewHeight);
        return footerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    LJUserCenterCellModel *cellModel = [self.userCenterDatasource[section] lastObject];
    if (cellModel &&  cellModel.headerText) {
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString: cellModel.headerText
                                  constraintSize:constraintSize];
        if (section == 0) {
            return size.height + kHeaderMarginBottom + kFirstSectionHeaderHeight;
        } else {
            return size.height + kHeaderMarginBottom + kOtherSectionHeaderHeight;
        }
    } else {
        return [super tableView:tableView heightForHeaderInSection:section];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    LJUserCenterCellModel *cellModel = [self.userCenterDatasource[section] lastObject];
    if (cellModel && cellModel.footerText) {
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString:cellModel.footerText
                                  constraintSize:constraintSize];
        return size.height + kFooterMarginTop + kSectionFooterHeight;
    }
    return [super tableView:tableView heightForFooterInSection:section];
}

/**
 *  子类继承该方法提供数据源
 *
 *  @return 数据源
 */
- (NSArray *)loadUserCenterDatasource {
    return nil;
}

/**
 *  刷新数据源
 */
- (void)reloadUserCenterDatasource {
    self.userCenterDatasource = [self loadUserCenterDatasource];
    if ([[NSThread currentThread] isMainThread]) {
        [self.tableView reloadData];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }
}

#pragma mark - Private Methods
- (CGSize)boundingSizeWithFont:(UIFont *)font
                     forString:(NSString *)string
                constraintSize:(CGSize)size {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    return [string boundingRectWithSize:size
                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                             attributes:attributes
                                context:nil].size;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
