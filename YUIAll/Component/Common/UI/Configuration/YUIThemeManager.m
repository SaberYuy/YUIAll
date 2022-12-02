//
//  YUIThemeManager.m
//  qmuidemo
//
//  Created by QMUI Team on 2017/5/9.
//  Copyright © 2017年 QMUI Team. All rights reserved.
//

#import "YUIThemeManager.h"

@interface YUIThemeManager ()

@property(nonatomic, strong) UIColor *yui_backgroundColor;
@property(nonatomic, strong) UIColor *yui_backgroundColorLighten;
@property(nonatomic, strong) UIColor *yui_backgroundColorHighlighted;
@property(nonatomic, strong) UIColor *yui_tintColor;
@property(nonatomic, strong) UIColor *yui_titleTextColor;
@property(nonatomic, strong) UIColor *yui_mainTextColor;
@property(nonatomic, strong) UIColor *yui_descriptionTextColor;
@property(nonatomic, strong) UIColor *yui_placeholderColor;
@property(nonatomic, strong) UIColor *yui_codeColor;
@property(nonatomic, strong) UIColor *yui_separatorColor;
@property(nonatomic, strong) UIColor *yui_gridItemTintColor;

@property(nonatomic, strong) UIImage *yui_navigationBarBackgroundImage;
@property(nonatomic, strong) UIImage *yui_navigationBarBackIndicatorImage;
@property(nonatomic, strong) UIImage *yui_navigationBarCloseImage;
@property(nonatomic, strong) UIImage *yui_navigationBarDisclosureIndicatorImage;
@property(nonatomic, strong) UIImage *yui_tableViewCellDisclosureIndicatorImage;
@property(nonatomic, strong) UIImage *yui_tableViewCellCheckmarkImage;
@property(nonatomic, strong) UIImage *yui_tableViewCellDetailButtonImage;
@property(nonatomic, strong) UIImage *yui_searchBarTextFieldBackgroundImage;
@property(nonatomic, strong) UIImage *yui_searchBarBackgroundImage;

@property(nonatomic, strong) UIVisualEffect *yui_standardBlueEffect;

@property(class, nonatomic, strong, readonly) YUIThemeManager *sharedInstance;
@end

@implementation YUIThemeManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YUIThemeManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (instancetype)init {
    if (self = [super init]) {
        self.yui_backgroundColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeBackgroundColor;
        }];
        self.yui_backgroundColorLighten = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YUIThemeProtocol> * _Nullable theme) {
            return theme.themeBackgroundColorLighten;
        }];
        self.yui_backgroundColorHighlighted = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeBackgroundColorHighlighted;
        }];
        self.yui_tintColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeTintColor;
        }];
        self.yui_titleTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeTitleTextColor;
        }];
        self.yui_mainTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeMainTextColor;
        }];
        self.yui_descriptionTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeDescriptionTextColor;
        }];
        self.yui_placeholderColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themePlaceholderColor;
        }];
        self.yui_codeColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeCodeColor;
        }];
        self.yui_separatorColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> *theme) {
            return theme.themeSeparatorColor;
        }];
        self.yui_gridItemTintColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YUIThemeProtocol> * _Nullable theme) {
            return theme.themeGridItemTintColor;
        }];
        
        self.yui_navigationBarBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YUIThemeProtocol> * _Nullable theme) {
            return [UIImage qmui_imageWithColor:theme.themeTintColor];
        }];
        self.yui_navigationBarBackIndicatorImage = [UIImage qmui_imageWithShape:QMUIImageShapeNavBack size:CGSizeMake(12, 20) tintColor:UIColor.whiteColor];
        self.yui_navigationBarCloseImage = [UIImage qmui_imageWithShape:QMUIImageShapeNavClose size:CGSizeMake(16, 16) tintColor:UIColor.whiteColor];
        self.yui_navigationBarDisclosureIndicatorImage = [[UIImage qmui_imageWithShape:QMUIImageShapeTriangle size:CGSizeMake(8, 5) tintColor:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.yui_tableViewCellDisclosureIndicatorImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YUIThemeProtocol> * _Nullable theme) {
            return [identifier isEqualToString:YUIThemeIdentifierDark] ? [UIImage qmui_imageWithShape:QMUIImageShapeDisclosureIndicator size:CGSizeMake(6, 10) lineWidth:1 tintColor:UIColorMake(98, 100, 104)] : [UIImage qmui_imageWithShape:QMUIImageShapeDisclosureIndicator size:CGSizeMake(6, 10) lineWidth:1 tintColor:UIColorGray7];
        }];
        self.yui_tableViewCellCheckmarkImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YUIThemeProtocol> * _Nullable theme) {
            return [UIImage qmui_imageWithShape:QMUIImageShapeCheckmark size:CGSizeMake(15, 12) tintColor:self.yui_tintColor];
        }];
        self.yui_tableViewCellDetailButtonImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YUIThemeProtocol> * _Nullable theme) {
            return [UIImage qmui_imageWithShape:QMUIImageShapeDetailButtonImage size:CGSizeMake(20, 20) tintColor:self.yui_tintColor];
        }];
        self.yui_searchBarTextFieldBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, __kindof NSObject<YUIThemeProtocol> * _Nullable theme) {
            return [UISearchBar qmui_generateTextFieldBackgroundImageWithColor:theme.themeBackgroundColorHighlighted];
        }];
        self.yui_searchBarBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, __kindof NSObject<YUIThemeProtocol> * _Nullable theme) {
            return [UISearchBar qmui_generateBackgroundImageWithColor:theme.themeBackgroundColor borderColor:nil];
        }];
        
        self.yui_standardBlueEffect = [UIVisualEffect qmui_effectWithThemeProvider:^UIVisualEffect * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YUIThemeProtocol> * _Nullable theme) {
            return [UIBlurEffect effectWithStyle:[identifier isEqualToString:YUIThemeIdentifierDark] ? UIBlurEffectStyleDark : UIBlurEffectStyleLight];
        }];
    }
    return self;
}

+ (NSObject<YUIThemeProtocol> *)currentTheme {
    return QMUIThemeManagerCenter.defaultThemeManager.currentTheme;
}

@end

@implementation UIColor (YUITheme)

+ (instancetype)yui_sharedInstance {
    static dispatch_once_t onceToken;
    static UIColor *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (UIColor *)yui_backgroundColor {
    return YUIThemeManager.sharedInstance.yui_backgroundColor;
}

+ (UIColor *)yui_backgroundColorLighten {
    return YUIThemeManager.sharedInstance.yui_backgroundColorLighten;
}

+ (UIColor *)yui_backgroundColorHighlighted {
    return YUIThemeManager.sharedInstance.yui_backgroundColorHighlighted;
}

+ (UIColor *)yui_tintColor {
    return YUIThemeManager.sharedInstance.yui_tintColor;
}

+ (UIColor *)yui_titleTextColor {
    return YUIThemeManager.sharedInstance.yui_titleTextColor;
}

+ (UIColor *)yui_mainTextColor {
    return YUIThemeManager.sharedInstance.yui_mainTextColor;
}

+ (UIColor *)yui_descriptionTextColor {
    return YUIThemeManager.sharedInstance.yui_descriptionTextColor;
}

+ (UIColor *)yui_placeholderColor {
    return YUIThemeManager.sharedInstance.yui_placeholderColor;
}

+ (UIColor *)yui_codeColor {
    return YUIThemeManager.sharedInstance.yui_codeColor;
}

+ (UIColor *)yui_separatorColor {
    return YUIThemeManager.sharedInstance.yui_separatorColor;
}

+ (UIColor *)yui_gridItemTintColor {
    return YUIThemeManager.sharedInstance.yui_gridItemTintColor;
}

@end

@implementation UIImage (YUITheme)

+ (UIImage *)yui_navigationBarBackgroundImage {
    return YUIThemeManager.sharedInstance.yui_navigationBarBackgroundImage;
}

+ (UIImage *)yui_navigationBarBackIndicatorImage {
    return YUIThemeManager.sharedInstance.yui_navigationBarBackIndicatorImage;
}

+ (UIImage *)yui_navigationBarCloseImage {
    return YUIThemeManager.sharedInstance.yui_navigationBarCloseImage;
}

+ (UIImage *)yui_navigationBarDisclosureIndicatorImage {
    return YUIThemeManager.sharedInstance.yui_navigationBarDisclosureIndicatorImage;
}

+ (UIImage *)yui_tableViewCellDisclosureIndicatorImage {
    return YUIThemeManager.sharedInstance.yui_tableViewCellDisclosureIndicatorImage;
}

+ (UIImage *)yui_tableViewCellCheckmarkImage {
    return YUIThemeManager.sharedInstance.yui_tableViewCellCheckmarkImage;
}

+ (UIImage *)yui_tableViewCellDetailButtonImage {
    return YUIThemeManager.sharedInstance.yui_tableViewCellDetailButtonImage;
}

+ (UIImage *)yui_searchBarTextFieldBackgroundImage {
    return YUIThemeManager.sharedInstance.yui_searchBarTextFieldBackgroundImage;
}

+ (UIImage *)yui_searchBarBackgroundImage {
    return YUIThemeManager.sharedInstance.yui_searchBarBackgroundImage;
}

@end

@implementation UIVisualEffect (YUITheme)

+ (UIVisualEffect *)yui_standardBlurEffect {
    return YUIThemeManager.sharedInstance.yui_standardBlueEffect;
}

@end
