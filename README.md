# LJUserCenter
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/liuliangju/LJUserCenter/raw/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/LJUserCenter.svg?style=flat)](http://cocoapods.org/?q=LJUserCenter)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
![Platform](http://cocoapod-badges.herokuapp.com/p/LJUserCenter/badge.png)&nbsp;
[![CI Status](https://travis-ci.org/liuliangju/LJUserCenter.svg?branch=master)](https://travis-ci.org/liuliangju/LJUserCenter)


Features
==============
- Custom static cell easyily, Just need to provide the data source。

## Installation
With[ CocoaPods,](https://cocoapods.org/) add this line to your Podfile.

```
pod 'LJUserCenter', '~> 0.9.0' 
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
or if you want to know which cell be Called after the user changes the selection, realize `LJUserCenterTableViewCellDelegate`(optional) method;
```objc
- (void)tableViewCell:(LJUserCenterTableViewCell *)tableViewCell 
        withCellModel:(LJUserCenterCellModel *)cellModel 
          atIndexPath:(NSIndexPath *)indexPath;
```
for more use, download the project and see the demo

## Contributing

Forks, patches and other feedback are welcome.

## License

LJUserCenter is released under the MIT license. See LICENSE file for details.<br/><br/>

# 中文介绍

## 特性
- 静态cell的定制，只需提供数据源，可以快速的创建同种模式的cell。

## 用法
继承于`LJUserCenterViewController`创建自己的控制器

实现以下方法来构造数据源

```objc
- (NSArray *)loadUserCenterDatasource;
```
例如:
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
当需要刷新数据源时需要实现以下方法
``` objc
- (void)reloadUserCenterDatasource;
```

当需要监听cell的点击事件时，需要实现`LJUserCenterTableViewCellDelegate`代理方法;
```objc
- (void)tableViewCell:(LJUserCenterTableViewCell *)tableViewCell 
        withCellModel:(LJUserCenterCellModel *)cellModel 
          atIndexPath:(NSIndexPath *)indexPath;
```
更多使用,下载项目查看demo

## 许可证
LJUserCenter 使用 MIT 许可证，详情见 LICENSE 文件。






