//
//  LJUserCenterRootViewController.m
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import "LJUserCenterRootViewController.h"

#define kTableViewSeparatorColor [UIColor colorWithRed:225.0f / 255 green:225.0f / 255 blue:225.0f / 255 alpha:1]

@interface LJUserCenterRootViewController ()

@end

@implementation LJUserCenterRootViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorColor = kTableViewSeparatorColor;
    [self setUp];
    
}

#pragma mark - Private Methods

- (void)setUp {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    CGRect frame = CGRectMake(0, 0, kScreenWidth, kTableViewFooterHeight);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:frame];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return kFirstSectionHeaderHeight;
    }
    return kOtherSectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kSectionFooterHeight;
}



- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
