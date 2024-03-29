//
//  YACommonGridViewController.h
//  qmuidemo
//
//  Created by QMUI Team on 2016/10/10.
//  Copyright © 2016年 QMUI Team. All rights reserved.
//

#import "YACommonViewController.h"
#import <QMUIKit/QMUIKit.h>

@interface YACommonGridViewController : YACommonViewController

@property(nonatomic, strong) QMUIOrderedDictionary<NSString *, UIImage *> *dataSource;
@property(nonatomic, strong, readonly) UIScrollView *scrollView;
@property(nonatomic, strong, readonly) QMUIGridView *gridView;

@end

@interface YACommonGridViewController (UISubclassingHooks)

// 子类继承，可以不调super
- (void)initDataSource;
- (void)didSelectCellWithTitle:(NSString *)title;
@end
