//
//  ViewController.m
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import "ViewController.h"
#import "LJUserCenterCellModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
}

- (NSArray *)loadUserCenterDatasource {
    NSMutableArray *datasource = [NSMutableArray array];
    
    LJUserCenterCellModel *cellModel11 = [[LJUserCenterCellModel alloc] init];
    cellModel11.headerText = @"分组管理11";
    cellModel11.title = @"分组管理11";
    cellModel11.accessoryType = LJCellAccessoryDisclosureIndicator;
    cellModel11.clazz = @"ViewController1";
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor grayColor];
    label.text = @"未保护";
    label.font = [UIFont systemFontOfSize:14];
    [label sizeToFit];
    cellModel11.detailView = [[UIView alloc] init];
    [cellModel11.detailView addSubview:label];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"profileLockOff"];
    CGFloat labelHeight = label.frame.size.height;
    CGFloat labelWidth = label.frame.size.width;
    CGSize iconSize = CGSizeMake(14, 14);
    imageView.frame = CGRectMake(0, 0, iconSize.width, iconSize.height);
    [cellModel11.detailView addSubview:imageView];
    CGRect frame = cellModel11.detailView.frame;
    frame.size.width = labelWidth + imageView.frame.size.width;
    frame.size.height = labelHeight;
    cellModel11.detailView.frame = frame;
    label.frame = CGRectMake(imageView.frame.size.width + 3, 0, labelWidth + 3, labelHeight);
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];

    
    
    LJUserCenterCellModel *cellModel21 = [[LJUserCenterCellModel alloc] init];
    cellModel21.title = @"分组管理21";
    cellModel21.accessoryType = LJCellAccessoryDisclosureIndicator;
    cellModel21.clazz = @"ViewController2";
    
    LJUserCenterCellModel *cellModel22 = [[LJUserCenterCellModel alloc] init];
    cellModel22.title = @"分组管理22";
    cellModel22.accessoryType = LJCellAccessoryDisclosureIndicator;
    cellModel22.clazz = @"ViewController3";
    
    LJUserCenterCellModel *cellModel23 = [[LJUserCenterCellModel alloc] init];
    cellModel23.title = @"分组管理23";
    cellModel23.accessoryType = LJCellAccessoryDisclosureIndicator;
    cellModel23.clazz = @"ViewController4";
    
    NSArray *section2 = @[cellModel21, cellModel22, cellModel23];
    [datasource addObject:section2];
    
    LJUserCenterCellModel *cellModel31 = [[LJUserCenterCellModel alloc] init];
    cellModel31.title = @"分组管理31";
    cellModel31.accessoryType = LJCellAccessoryDisclosureIndicator;
    
    LJUserCenterCellModel *cellModel32 = [[LJUserCenterCellModel alloc] init];
    cellModel32.title = @"分组管理32";
    cellModel32.accessoryType = LJCellAccessoryDisclosureIndicator;
    
    NSArray *section3 = @[cellModel31, cellModel32];
    [datasource addObject:section3];
    
    return datasource;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
