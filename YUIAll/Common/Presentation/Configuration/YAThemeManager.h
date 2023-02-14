//
//  YAThemeManager.h
//  qmuidemo
//
//  Created by QMUI Team on 2017/5/9.
//  Copyright © 2017年 QMUI Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YAThemeProtocol.h"

/// 简单对 QMUIThemeManager 做一层业务的封装，省去类型转换的工作量
@interface YAThemeManager : NSObject

@property(class, nonatomic, readonly, nullable) NSObject<YAThemeProtocol> *currentTheme;
@end

@interface UIColor (YATheme)

@property(class, nonatomic, strong, readonly) UIColor *ya_backgroundColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_backgroundColorLighten;
@property(class, nonatomic, strong, readonly) UIColor *ya_backgroundColorHighlighted;
@property(class, nonatomic, strong, readonly) UIColor *ya_tintColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_titleTextColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_mainTextColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_descriptionTextColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_placeholderColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_codeColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_separatorColor;
@property(class, nonatomic, strong, readonly) UIColor *ya_gridItemTintColor;
@end

@interface UIImage (YATheme)

@property(class, nonatomic, strong, readonly) UIImage *ya_navigationBarBackgroundImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_navigationBarBackIndicatorImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_navigationBarCloseImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_navigationBarDisclosureIndicatorImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_tableViewCellDisclosureIndicatorImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_tableViewCellCheckmarkImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_tableViewCellDetailButtonImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_searchBarTextFieldBackgroundImage;
@property(class, nonatomic, strong, readonly) UIImage *ya_searchBarBackgroundImage;
@end

@interface UIVisualEffect (YATheme)

@property(class, nonatomic, strong, readonly) UIVisualEffect *ya_standardBlurEffect;
@end
