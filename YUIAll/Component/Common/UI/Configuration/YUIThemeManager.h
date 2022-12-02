//
//  YUIThemeManager.h
//  qmuidemo
//
//  Created by QMUI Team on 2017/5/9.
//  Copyright © 2017年 QMUI Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUIThemeProtocol.h"

/// 简单对 QMUIThemeManager 做一层业务的封装，省去类型转换的工作量
@interface YUIThemeManager : NSObject

@property(class, nonatomic, readonly, nullable) NSObject<YUIThemeProtocol> *currentTheme;
@end

@interface UIColor (YUITheme)

@property(class, nonatomic, strong, readonly) UIColor *yui_backgroundColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_backgroundColorLighten;
@property(class, nonatomic, strong, readonly) UIColor *yui_backgroundColorHighlighted;
@property(class, nonatomic, strong, readonly) UIColor *yui_tintColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_titleTextColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_mainTextColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_descriptionTextColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_placeholderColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_codeColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_separatorColor;
@property(class, nonatomic, strong, readonly) UIColor *yui_gridItemTintColor;
@end

@interface UIImage (YUITheme)

@property(class, nonatomic, strong, readonly) UIImage *yui_navigationBarBackgroundImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_navigationBarBackIndicatorImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_navigationBarCloseImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_navigationBarDisclosureIndicatorImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_tableViewCellDisclosureIndicatorImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_tableViewCellCheckmarkImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_tableViewCellDetailButtonImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_searchBarTextFieldBackgroundImage;
@property(class, nonatomic, strong, readonly) UIImage *yui_searchBarBackgroundImage;
@end

@interface UIVisualEffect (YUITheme)

@property(class, nonatomic, strong, readonly) UIVisualEffect *yui_standardBlurEffect;
@end
