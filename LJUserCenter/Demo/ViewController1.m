//
//  ViewController1.m
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import "ViewController1.h"
#import "LJUserCenterCellModel.h"
#import "LJUserCenterTableViewCell.h"


@interface ViewController1 () <LJUserCenterTableViewCellDelegate>

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)loadUserCenterDatasource {
    
    NSMutableArray *datasource = [NSMutableArray array];
    
    LJUserCenterCellModel *cellModel11 = [[LJUserCenterCellModel alloc] init];
    cellModel11.title = @"微信号";
    cellModel11.detail = @"123456789";
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];
    
    LJUserCenterCellModel *cellModel21 = [[LJUserCenterCellModel alloc] init];
    cellModel21.title = @"QQ号";
    cellModel21.detail = @"123456789";
    cellModel21.accessoryType = LJCellAccessoryDisclosureIndicator;
    LJUserCenterCellModel *cellModel22 = [[LJUserCenterCellModel alloc] init];
    cellModel22.title = @"手机号";
    cellModel22.detail = @"123456789";
    cellModel22.accessoryType = LJCellAccessoryDisclosureIndicator;
    LJUserCenterCellModel *cellModel23 = [[LJUserCenterCellModel alloc] init];
    cellModel23.title = @"邮箱地址";
    cellModel23.detail = @"未验证";
    cellModel23.accessoryType = LJCellAccessoryDisclosureIndicator;
    NSArray *section2 = @[cellModel21, cellModel22, cellModel23];
    [datasource addObject:section2];

    LJUserCenterCellModel *cellModel31 = [[LJUserCenterCellModel alloc] init];
    cellModel31.title = @"邮箱地址";
    cellModel31.accessoryType = LJCellAccessorySwitch;
    NSArray *section3 = @[cellModel31];
    [datasource addObject:section3];
    
    LJUserCenterCellModel *cellModel41 = [[LJUserCenterCellModel alloc] init];
    cellModel41.title = @"测试Checkmark";
    cellModel41.accessoryType = LJCellAccessoryCheckmark;
    cellModel41.checked = YES;
    LJUserCenterCellModel *cellModel42 = [[LJUserCenterCellModel alloc] init];
    cellModel42.title = @"测试Checkmark";
    cellModel42.accessoryType = LJCellAccessoryCheckmark;
    cellModel42.checked = NO;
    NSArray *section4 = @[cellModel41, cellModel42];
    [datasource addObject:section4];

    return datasource;
}


- (void)tableViewCell:(LJUserCenterTableViewCell *)tableViewCell
        withCellModel:(LJUserCenterCellModel *)cellModel
          atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击%ld-%ld", indexPath.section, indexPath.row);
    if (cellModel.accessoryType == LJCellAccessoryCheckmark) {
        BOOL mustChecked = NO;
        for (LJUserCenterCellModel *cellModel in self.userCenterDatasource[indexPath.section]) {
            if (cellModel.checked) {
                mustChecked = YES;
                break;
            }
        }
        if (!mustChecked) {
            cellModel.checked = YES;
            tableViewCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
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
