//
//  YUIConfigurationTemplate.m
//  qmui
//
//  Created by QMUI Team on 15/3/29.
//  Copyright (c) 2015年 QMUI Team. All rights reserved.
//

#import "YUIConfigurationTemplateGrapefruit.h"

@implementation YUIConfigurationTemplateGrapefruit

#pragma mark - <YUIConfigurationTemplateProtocol>

// QMUI 2.3.0 版本里，配置表新增这个方法，返回 YES 表示在 App 启动时要自动应用这份配置表。仅当你的 App 里存在多份配置表时，才需要把除默认配置表之外的其他配置表的返回值改为 NO。
- (BOOL)shouldApplyTemplateAutomatically {
    [QMUIThemeManagerCenter.defaultThemeManager addThemeIdentifier:self.themeName theme:self];
    
    NSString *selectedThemeIdentifier = [[NSUserDefaults standardUserDefaults] stringForKey:YASelectedThemeIdentifier];
    BOOL result = [selectedThemeIdentifier isEqualToString:self.themeName];
    if (result) {
        QMUIThemeManagerCenter.defaultThemeManager.currentTheme = self;
    }
    return result;
}

#pragma mark - <YAThemeProtocol>

- (UIColor *)themeTintColor {
    return UIColorTheme1;
}

- (NSString *)themeName {
    return YAThemeIdentifierGrapefruit;
}

@end
