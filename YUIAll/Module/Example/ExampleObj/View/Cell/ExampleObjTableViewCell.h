//
//  ExampleObjTableViewCell.h
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjTableViewCell : QMUITableViewCell

@property (nonatomic, strong) UIImageView *aIV;
@property (nonatomic, strong) UIImageView *bIV;
@property (nonatomic, strong) WKWebView *aWV;
@property (nonatomic, strong) WKWebView *bWV;

@end

NS_ASSUME_NONNULL_END
