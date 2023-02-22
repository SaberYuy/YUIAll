//
//  ExampleObjcTableViewCell.m
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import "ExampleObjcTableViewCell.h"

@interface ExampleObjcTableViewCell ()

@end

@implementation ExampleObjcTableViewCell

- (void)didInitializeWithStyle:(UITableViewCellStyle)style{
    
    [super didInitializeWithStyle:style];
    
    [self setupContainerView];
    [self initSubviews];
    [self setupSubviewsConstraints];
}

- (void)setupContainerView{
    
    self.contentView.backgroundColor = [UIColor qmui_randomColor];
}

- (void)initSubviews{
    
//    _aIV = [UIImageView new];
//    [self.ContainerView addSubview: _aIV];
//
//    _bIV = [UIImageView new];
//    [self.ContainerView addSubview: _bIV];
    
    _aBtn = [UIButton new];
    _aBtn.backgroundColor = [UIColor qmui_randomColor];
    [_aBtn addTarget:self action:@selector(tapA:) forControlEvents: UIControlEventTouchDown];
    [self.contentView addSubview: _aBtn];
}

- (void)setupSubviewsConstraints{
    
    [_aBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(50);
    }];
}

- (void)tapA:(UIControl *)sender {

    if(self.yui_viewDelegate && [self.yui_viewDelegate respondsToSelector:@selector(receiveView:name:event:)]) {

        [self.yui_viewDelegate receiveView:self name:@"tapA" event:@{@"data": @"123"}];
    }
}

@end
