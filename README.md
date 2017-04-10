# LJUserCenter
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/liuliangju/LJUserCenter/raw/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/LJUserCenter.svg?style=flat)](http://cocoapods.org/?q=LJUserCenter)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
![Platform](http://cocoapod-badges.herokuapp.com/p/LJUserCenter/badge.png)

Features
==============
Custom static cell easyily, Just need to provide the data source。

## Installation
With[ CocoaPods,](https://cocoapods.org/) add this line to your Podfile.

```
pod 'LJUserCenter', '~> 0.6.0' 
```
Manually:
Drag all files under `LJUserCenter/Classes` folder into your project.

## Screenshots
<img src="https://github.com/liuliangju/LJUserCenter/raw/master/Screenshots/image1.png" width="240"/> <img src="https://github.com/liuliangju/LJUserCenter/raw/master/Screenshots/image2.png" width="240"/>

## Usage

If you want to create your own `ViewController`, simply you only need to subclass from `LJUserCenterViewController`.
```objc
@interface YourCustomViewController : LJUserCenterViewController

@end
```
realize 
```objc
- (NSArray *)loadUserCenterDatasource;
```
you can custom your cell like this
```objc
- (NSArray *)loadUserCenterDatasource {
    NSMutableArray *datasource = [NSMutableArray array];
    LJUserCenterCellModel *cellModel11 = [[LJUserCenterCellModel alloc] init];
    cellModel11.title = @"微信号";
    cellModel11.detail = @"123456789";
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];
    return datasource;
}
```
if you want reloadData tableView just to  
``` objc
- (void)reloadUserCenterDatasource;
```
or if you want to know which cell be Called after the user changes the selection, realize `LJUserCenterTableViewCellDelegate`(optional);
```objc
- (void)tableViewCell:(LJUserCenterTableViewCell *)tableViewCell withCellModel:(LJUserCenterCellModel *)cellModel atIndexPath:(NSIndexPath *)indexPath;
```
for more use, download the project and see the demo

## Contributing

Forks, patches and other feedback are welcome.

## License

Copyright (c) 2016 liangju. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

