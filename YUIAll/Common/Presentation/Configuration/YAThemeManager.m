//
//  YAThemeManager.m
//  qmuidemo
//
//  Created by QMUI Team on 2017/5/9.
//  Copyright © 2017年 QMUI Team. All rights reserved.
//

#import "YAThemeManager.h"

@interface YAThemeManager ()

@property(nonatomic, strong) UIColor *ya_backgroundColor;
@property(nonatomic, strong) UIColor *ya_backgroundColorLighten;
@property(nonatomic, strong) UIColor *ya_backgroundColorHighlighted;
@property(nonatomic, strong) UIColor *ya_tintColor;
@property(nonatomic, strong) UIColor *ya_titleTextColor;
@property(nonatomic, strong) UIColor *ya_mainTextColor;
@property(nonatomic, strong) UIColor *ya_descriptionTextColor;
@property(nonatomic, strong) UIColor *ya_placeholderColor;
@property(nonatomic, strong) UIColor *ya_codeColor;
@property(nonatomic, strong) UIColor *ya_separatorColor;
@property(nonatomic, strong) UIColor *ya_gridItemTintColor;

@property(nonatomic, strong) UIImage *ya_navigationBarBackgroundImage;
@property(nonatomic, strong) UIImage *ya_navigationBarBackIndicatorImage;
@property(nonatomic, strong) UIImage *ya_navigationBarCloseImage;
@property(nonatomic, strong) UIImage *ya_navigationBarDisclosureIndicatorImage;
@property(nonatomic, strong) UIImage *ya_tableViewCellDisclosureIndicatorImage;
@property(nonatomic, strong) UIImage *ya_tableViewCellCheckmarkImage;
@property(nonatomic, strong) UIImage *ya_tableViewCellDetailButtonImage;
@property(nonatomic, strong) UIImage *ya_searchBarTextFieldBackgroundImage;
@property(nonatomic, strong) UIImage *ya_searchBarBackgroundImage;

@property(nonatomic, strong) UIVisualEffect *ya_standardBlueEffect;

@property(class, nonatomic, strong, readonly) YAThemeManager *sharedInstance;
@end

@implementation YAThemeManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YAThemeManager *instance = nil;
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
        self.ya_backgroundColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeBackgroundColor;
        }];
        self.ya_backgroundColorLighten = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YAThemeProtocol> * _Nullable theme) {
            return theme.themeBackgroundColorLighten;
        }];
        self.ya_backgroundColorHighlighted = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeBackgroundColorHighlighted;
        }];
        self.ya_tintColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeTintColor;
        }];
        self.ya_titleTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeTitleTextColor;
        }];
        self.ya_mainTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeMainTextColor;
        }];
        self.ya_descriptionTextColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeDescriptionTextColor;
        }];
        self.ya_placeholderColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themePlaceholderColor;
        }];
        self.ya_codeColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeCodeColor;
        }];
        self.ya_separatorColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> *theme) {
            return theme.themeSeparatorColor;
        }];
        self.ya_gridItemTintColor = [UIColor qmui_colorWithThemeProvider:^UIColor * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YAThemeProtocol> * _Nullable theme) {
            return theme.themeGridItemTintColor;
        }];
        
        self.ya_navigationBarBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, NSObject<YAThemeProtocol> * _Nullable theme) {
            return [UIImage qmui_imageWithColor:theme.themeTintColor];
        }];
        self.ya_navigationBarBackIndicatorImage = [UIImage qmui_imageWithShape:QMUIImageShapeNavBack size:CGSizeMake(12, 20) tintColor:UIColor.whiteColor];
        self.ya_navigationBarCloseImage = [UIImage qmui_imageWithShape:QMUIImageShapeNavClose size:CGSizeMake(16, 16) tintColor:UIColor.whiteColor];
        self.ya_navigationBarDisclosureIndicatorImage = [[UIImage qmui_imageWithShape:QMUIImageShapeTriangle size:CGSizeMake(8, 5) tintColor:nil] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.ya_tableViewCellDisclosureIndicatorImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YAThemeProtocol> * _Nullable theme) {
            return [identifier isEqualToString:YAThemeIdentifierDark] ? [UIImage qmui_imageWithShape:QMUIImageShapeDisclosureIndicator size:CGSizeMake(6, 10) lineWidth:1 tintColor:UIColorMake(98, 100, 104)] : [UIImage qmui_imageWithShape:QMUIImageShapeDisclosureIndicator size:CGSizeMake(6, 10) lineWidth:1 tintColor:UIColorGray7];
        }];
        self.ya_tableViewCellCheckmarkImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YAThemeProtocol> * _Nullable theme) {
            return [UIImage qmui_imageWithShape:QMUIImageShapeCheckmark size:CGSizeMake(15, 12) tintColor:self.ya_tintColor];
        }];
        self.ya_tableViewCellDetailButtonImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YAThemeProtocol> * _Nullable theme) {
            return [UIImage qmui_imageWithShape:QMUIImageShapeDetailButtonImage size:CGSizeMake(20, 20) tintColor:self.ya_tintColor];
        }];
        self.ya_searchBarTextFieldBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, __kindof NSObject<YAThemeProtocol> * _Nullable theme) {
            return [UISearchBar qmui_generateTextFieldBackgroundImageWithColor:theme.themeBackgroundColorHighlighted];
        }];
        self.ya_searchBarBackgroundImage = [UIImage qmui_imageWithThemeProvider:^UIImage * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, __kindof NSObject<NSCopying> * _Nullable identifier, __kindof NSObject<YAThemeProtocol> * _Nullable theme) {
            return [UISearchBar qmui_generateBackgroundImageWithColor:theme.themeBackgroundColor borderColor:nil];
        }];
        
        self.ya_standardBlueEffect = [UIVisualEffect qmui_effectWithThemeProvider:^UIVisualEffect * _Nonnull(__kindof QMUIThemeManager * _Nonnull manager, NSString * _Nullable identifier, NSObject<YAThemeProtocol> * _Nullable theme) {
            return [UIBlurEffect effectWithStyle:[identifier isEqualToString:YAThemeIdentifierDark] ? UIBlurEffectStyleDark : UIBlurEffectStyleLight];
        }];
    }
    return self;
}

+ (NSObject<YAThemeProtocol> *)currentTheme {
    return QMUIThemeManagerCenter.defaultThemeManager.currentTheme;
}

@end

@implementation UIColor (YATheme)

+ (instancetype)ya_sharedInstance {
    static dispatch_once_t onceToken;
    static UIColor *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (UIColor *)ya_backgroundColor {
    return YAThemeManager.sharedInstance.ya_backgroundColor;
}

+ (UIColor *)ya_backgroundColorLighten {
    return YAThemeManager.sharedInstance.ya_backgroundColorLighten;
}

+ (UIColor *)ya_backgroundColorHighlighted {
    return YAThemeManager.sharedInstance.ya_backgroundColorHighlighted;
}

+ (UIColor *)ya_tintColor {
    return YAThemeManager.sharedInstance.ya_tintColor;
}

+ (UIColor *)ya_titleTextColor {
    return YAThemeManager.sharedInstance.ya_titleTextColor;
}

+ (UIColor *)ya_mainTextColor {
    return YAThemeManager.sharedInstance.ya_mainTextColor;
}

+ (UIColor *)ya_descriptionTextColor {
    return YAThemeManager.sharedInstance.ya_descriptionTextColor;
}

+ (UIColor *)ya_placeholderColor {
    return YAThemeManager.sharedInstance.ya_placeholderColor;
}

+ (UIColor *)ya_codeColor {
    return YAThemeManager.sharedInstance.ya_codeColor;
}

+ (UIColor *)ya_separatorColor {
    return YAThemeManager.sharedInstance.ya_separatorColor;
}

+ (UIColor *)ya_gridItemTintColor {
    return YAThemeManager.sharedInstance.ya_gridItemTintColor;
}

@end

@implementation UIImage (YATheme)

+ (UIImage *)ya_navigationBarBackgroundImage {
    return YAThemeManager.sharedInstance.ya_navigationBarBackgroundImage;
}

+ (UIImage *)ya_navigationBarBackIndicatorImage {
    return YAThemeManager.sharedInstance.ya_navigationBarBackIndicatorImage;
}

+ (UIImage *)ya_navigationBarCloseImage {
    return YAThemeManager.sharedInstance.ya_navigationBarCloseImage;
}

+ (UIImage *)ya_navigationBarDisclosureIndicatorImage {
    return YAThemeManager.sharedInstance.ya_navigationBarDisclosureIndicatorImage;
}

+ (UIImage *)ya_tableViewCellDisclosureIndicatorImage {
    return YAThemeManager.sharedInstance.ya_tableViewCellDisclosureIndicatorImage;
}

+ (UIImage *)ya_tableViewCellCheckmarkImage {
    return YAThemeManager.sharedInstance.ya_tableViewCellCheckmarkImage;
}

+ (UIImage *)ya_tableViewCellDetailButtonImage {
    return YAThemeManager.sharedInstance.ya_tableViewCellDetailButtonImage;
}

+ (UIImage *)ya_searchBarTextFieldBackgroundImage {
    return YAThemeManager.sharedInstance.ya_searchBarTextFieldBackgroundImage;
}

+ (UIImage *)ya_searchBarBackgroundImage {
    return YAThemeManager.sharedInstance.ya_searchBarBackgroundImage;
}

@end

@implementation UIVisualEffect (YATheme)

+ (UIVisualEffect *)ya_standardBlurEffect {
    return YAThemeManager.sharedInstance.ya_standardBlueEffect;
}

@end
