//
//  LJUserCenterViewController.h
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJUserCenterRootViewController.h"

static NSString *const kReuseIdentifier = @"LJUserCenterCell";

@interface LJUserCenterViewController : LJUserCenterRootViewController

@property (nonatomic, strong) NSArray *userCenterDatasource;

/**
 *  子类继承该方法提供数据源
 *
 *  @return 数据源
 */
- (NSArray *)loadUserCenterDatasource;

/**
 *  刷新数据源
 */
- (void)reloadUserCenterDatasource;


@end
