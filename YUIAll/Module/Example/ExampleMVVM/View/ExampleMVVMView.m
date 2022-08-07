//
//  ExampleMVVMView.m
//  YUIAll
//
//  Created by YUI on 2021/10/28.
//

#import "ExampleMVVMView.h"

@interface ExampleMVVMView ()

@end

@implementation ExampleMVVMView

- (void)setupMainView{
    
    [super setupMainView];
    
    self.backgroundColor = [UIColor whiteColor];
}

- (void)initSubviews{
    
    [super initSubviews];
    
    _tableView = [[QMUITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    [_tableView setContentInset:UIEdgeInsetsMake( 0, 0, SafeAreaInsetsConstantForDeviceWithNotch.bottom, 0)];
    _tableView.rowHeight = 65;
    _tableView.sectionHeaderHeight = 10;
    _tableView.scrollEnabled = YES;
    [self addSubview:_tableView];
}

- (void)setupSubviewsConstraints{

    [super setupSubviewsConstraints];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.bottom.left.right.equalTo(self);
    }];
}

@end
