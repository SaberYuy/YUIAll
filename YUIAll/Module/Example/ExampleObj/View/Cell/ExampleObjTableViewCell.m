//
//  ExampleObjTableViewCell.m
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import "ExampleObjTableViewCell.h"

@interface ExampleObjTableViewCell ()

@end

@implementation ExampleObjTableViewCell

- (void)didInitializeWithStyle:(UITableViewCellStyle)style{
    
    [super didInitializeWithStyle:style];
    
    [self setupMainView];
    [self initSubviews];
    [self setupSubviewsConstraints];
}

- (void)setupMainView{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)initSubviews{
    
//    _aIV = [UIImageView new];
//    [self.contentView addSubview: _aIV];
//
//    _bIV = [UIImageView new];
//    [self.contentView addSubview: _bIV];
    
    _aWV = [WKWebView new];
    [self.contentView addSubview: _aWV];
    
    _bWV = [WKWebView new];
    [self.contentView addSubview: _bWV];
}

- (void)setupSubviewsConstraints{
    
    [_aWV mas_makeConstraints:^(MASConstraintMaker *make) {
          
        make.width.equalTo(self).multipliedBy(0.5);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self);
    }];
    
    [_bWV mas_makeConstraints:^(MASConstraintMaker *make) {
            
        make.width.equalTo(self).multipliedBy(0.5);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
    }];
    
//    [_aIV mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.width.equalTo(self).multipliedBy(0.5);
//        make.top.equalTo(self);
//        make.bottom.equalTo(self);
//        make.left.equalTo(self);
//    }];
//
//    [_bIV mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.width.equalTo(self).multipliedBy(0.5);
//        make.top.equalTo(self);
//        make.bottom.equalTo(self);
//        make.right.equalTo(self);
//    }];
}

@end
