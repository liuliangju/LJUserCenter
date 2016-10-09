//
//  LJUserCenterCellModel.m
//  LJUserCenter
//
//  Created by liangju on 10/9/16.
//  Copyright © 2016 liangju. All rights reserved.
//

#import "LJUserCenterCellModel.h"

@implementation LJUserCenterCellModel

- (CGFloat)height {
    if (_height == 0.0f) {
        _height = 44.0f;
    }
    return _height;
}


@end
