//
//  YACommonGroupListViewController.h
//  qmuidemo
//
//  Created by QMUI Team on 2016/10/10.
//  Copyright © 2016年 QMUI Team. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>
#import "YACommonTableViewController.h"

@interface YACommonGroupListViewController : YACommonTableViewController

@property(nonatomic, strong) QMUIOrderedDictionary *dataSource;

- (NSString *)titleForSection:(NSInteger)section;
- (NSString *)keyNameAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface YACommonGroupListViewController (UISubclassingHooks)

// 子类继承，可以不调 super
- (void)initDataSource;
- (void)didSelectCellWithTitle:(NSString *)title;

@end
