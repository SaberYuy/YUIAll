//
//  YACommonUI.m
//  qmuidemo
//
//  Created by QMUI Team on 16/8/8.
//  Copyright © 2016年 QMUI Team. All rights reserved.
//

#import "YACommonUI.h"
#import "YAUIHelper.h"

NSString *const YASelectedThemeIdentifier = @"selectedThemeIdentifier";
NSString *const YAThemeIdentifierDefault = @"Default";
NSString *const YAThemeIdentifierGrapefruit = @"Grapefruit";
NSString *const YAThemeIdentifierGrass = @"Grass";
NSString *const YAThemeIdentifierPinkRose = @"Pink Rose";
NSString *const YAThemeIdentifierDark = @"Dark";

const CGFloat YAButtonSpacingHeight = 72;

@implementation YACommonUI

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 统一设置所有 QMUISearchController 搜索状态下的 statusBarStyle
        OverrideImplementation([QMUISearchController class], @selector(initWithContentsViewController:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP (^originalIMPProvider)(void)) {
            return ^QMUISearchController *(QMUISearchController *selfObject, UIViewController *firstArgv) {
                
                // call super
                QMUISearchController *(*originSelectorIMP)(id, SEL, UIViewController *);
                originSelectorIMP = (QMUISearchController * (*)(id, SEL, UIViewController *))originalIMPProvider();
                QMUISearchController *result = originSelectorIMP(selfObject, originCMD, firstArgv);
                
                result.qmui_preferredStatusBarStyleBlock = ^UIStatusBarStyle{
                    if ([QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier isEqual:YAThemeIdentifierDark]) {
                        return UIStatusBarStyleLightContent;
                    }
                    return QMUIStatusBarStyleDarkContent;
                };
                return result;
            };
        });
    });
}

+ (void)renderGlobalAppearances {
    [YAUIHelper customMoreOperationAppearance];
    [YAUIHelper customAlertControllerAppearance];
    [YAUIHelper customDialogViewControllerAppearance];
    [YAUIHelper customImagePickerAppearance];
    [YAUIHelper customEmotionViewAppearance];
    [YAUIHelper customPopupAppearance];
    
    UISearchBar *searchBar = [UISearchBar appearance];
    searchBar.searchTextPositionAdjustment = UIOffsetMake(4, 0);
    searchBar.qmui_centerPlaceholder = YES;
    
    QMUILabel *label = [QMUILabel appearance];
    label.highlightedBackgroundColor = TableViewCellSelectedBackgroundColor;
    
    QMUINavigationTitleView *titleView = QMUINavigationTitleView.appearance;
    titleView.verticalTitleFont = NavBarTitleFont;
}

@end

@implementation YACommonUI (ThemeColor)

static NSArray<UIColor *> *themeColors = nil;
+ (UIColor *)randomThemeColor {
    if (!themeColors) {
        themeColors = @[UIColorTheme1,
                        UIColorTheme2,
                        UIColorTheme3,
                        UIColorTheme4,
                        UIColorTheme5,
                        UIColorTheme6,
                        UIColorTheme7,
                        UIColorTheme8,
                        UIColorTheme9,
                        UIColorTheme10];
    }
    return themeColors[arc4random() % themeColors.count];
}

@end

@implementation YACommonUI (Layer)

+ (CALayer *)generateSeparatorLayer {
    CALayer *layer = [CALayer layer];
    [layer qmui_removeDefaultAnimations];
    layer.backgroundColor = UIColorSeparator.CGColor;
    return layer;
}

@end
