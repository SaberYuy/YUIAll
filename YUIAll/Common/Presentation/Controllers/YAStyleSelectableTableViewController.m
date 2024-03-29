//
//  YAStyleSelectableTableViewController.m
//  qmuidemo
//
//  Created by MoLice on 2020/7/8.
//  Copyright © 2020 QMUI Team. All rights reserved.
//

#import "YAStyleSelectableTableViewController.h"

@implementation YAStyleSelectableTableViewController

- (void)setupNavigationItems {
    [super setupNavigationItems];
    if (!self.segmentedTitleView) {
        self.segmentedTitleView = [[UISegmentedControl alloc] initWithItems:@[
            @"Plain",
            @"Grouped",
            @"InsetGrouped"
        ]];
        [self.segmentedTitleView addTarget:self action:@selector(handleTableViewStyleChanged:) forControlEvents:UIControlEventValueChanged];
        
        UIColor *tintColor = self.navigationController.navigationBar.tintColor;
        self.segmentedTitleView.selectedSegmentTintColor = tintColor;
        [self.segmentedTitleView setTitleTextAttributes:@{NSForegroundColorAttributeName: tintColor} forState:UIControlStateNormal];
        [self.segmentedTitleView setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColor.ya_tintColor} forState:UIControlStateSelected];
    }
    self.segmentedTitleView.selectedSegmentIndex = self.tableView.style;
    self.navigationItem.titleView = self.segmentedTitleView;
}

- (void)handleTableViewStyleChanged:(UISegmentedControl *)segmentedControl {
    self.tableView = [[QMUITableView alloc] initWithFrame:self.view.bounds style:segmentedControl.selectedSegmentIndex];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view sendSubviewToBack:self.tableView];
}

@end
