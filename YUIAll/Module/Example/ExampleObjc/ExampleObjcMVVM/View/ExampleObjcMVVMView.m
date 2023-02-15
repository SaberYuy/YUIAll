//
//  ExampleObjcView.m
//  YUIAll
//
//  Created by YUI on 2020/12/15.
//

#import "ExampleObjcMVVMView.h"

@interface ExampleObjcMVVMView ()

@end

@implementation ExampleObjcMVVMView

static NSString * const kExampleObjcTableViewCell = @"ExampleObjcTableViewCellID";

- (void)setupContainerView {
    
    self.backgroundColor = [UIColor qmui_randomColor];
}

- (void)initSubviews {
    
    [super initSubviews];
    
    _tableView = [[QMUITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [_tableView setContentInset:UIEdgeInsetsMake( 0, 0, SafeAreaInsetsConstantForDeviceWithNotch.bottom, 0)];
    _tableView.rowHeight = 100;
//    _tableView.tableHeaderView = self.headerView;
//    _tableView.sectionHeaderHeight = kWidth(98);
//    _tableView.sectionHeaderHeight = kWidth(5);
//    _tableView.sectionFooterHeight = kWidth(0);
    [self addSubview:_tableView];
    
    _aBtn = [UIButton new];
    _aBtn.backgroundColor = [UIColor qmui_randomColor];
    [self addSubview: _aBtn];
}

- (void)setupSubviewsConstraints {

    [super setupSubviewsConstraints];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    
    [_aBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(100);
        make.width.height.mas_equalTo(100);
    }];
}

- (void)tapA {
    
//    if(self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(view:withEvent:)]) {
//        
//        [self.viewDelegate view:self withEvent:@{@"name":@"tapA",@"data":@"123"}];
//    }
}

- (void)tapB {
    
    if (self.viewEventBlock) {
        self.viewEventBlock(@"btnClick");
    }
    
    if(self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(receiveView:name:event:)]) {

        [self.viewDelegate receiveView:self name:@"tapB" event:@{@"data": @"123"}];
    }
}

@end
