//
//  ExampleObjView.m
//  YUIAll
//
//  Created by YUI on 2020/12/15.
//

#import "ExampleObjView.h"

#import "ExampleObjTableViewCell.h"

@interface ExampleObjView ()

//@property (nonatomic, strong) QMUILabel *label;
//@property (nonatomic, strong) UIButton *btn;
//@property (nonatomic, strong) UIImageView *imageView;
//@property (nonatomic, strong) QMUITableView *tableView;

@end


@implementation ExampleObjView

static NSString * const kExampleObjTableViewCell = @"ExampleObjTableViewCellID";

- (void)setupMainView{
    
    self.backgroundColor = [UIColor qmui_randomColor];
}

- (void)initSubviews{
    
    [super initSubviews];
    
    _tableView = [[QMUITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [_tableView setContentInset:UIEdgeInsetsMake( 0, 0, SafeAreaInsetsConstantForDeviceWithNotch.bottom, 0)];
    _tableView.rowHeight = (NSInteger)(SCREEN_HEIGHT / 3);
//    _tableView.tableHeaderView = self.headerView;
//    _tableView.sectionHeaderHeight = kWidth(98);
//    _tableView.sectionHeaderHeight = kWidth(5);
//    _tableView.sectionFooterHeight = kWidth(0);
    [self addSubview:_tableView];
}

- (void)setupSubviewsConstraints{

    [super setupSubviewsConstraints];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.bottom.left.right.equalTo(self);
    }];
}

- (void)tapA{
    
//    if(self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(view:withEvent:)]) {
//        
//        [self.viewDelegate view:self withEvent:@{@"name":@"tapA",@"data":@"123"}];
//    }
}

@end
