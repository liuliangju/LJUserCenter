//
//  LJUserCenterRootViewController.h
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  屏幕宽高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

static const CGFloat kFirstSectionHeaderHeight = 15.0f; // 第一个section header高度
static const CGFloat kOtherSectionHeaderHeight = 20.0f; // 其它section header高度
static const CGFloat kSectionFooterHeight = 0.01f;      // section footer高度
static const CGFloat kTableViewFooterHeight = 15.0f;    // tableview footer高度


@interface LJUserCenterRootViewController : UITableViewController

@end
