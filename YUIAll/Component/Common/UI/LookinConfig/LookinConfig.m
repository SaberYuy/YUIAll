//
//  LookinConfig.m
//  Lookin
//
//  Copyright © 2019 Lookin. All rights reserved.

#import "LookinConfig.h"

@implementation LookinConfig

/**
 Enable Lookin app to display colors with custom names.
 Available since Lookin v0.9.2 (Released at 2019-07-23).
 
 让 Lookin 显示 UIColor 在您业务里的自定义名称，而非仅仅展示一个色值。
 该配置从 2019-07-23 发布的 Lookin 0.9.2 版本开始生效。
 
 https://lookin.work/faq/config-file/#colors
 */
+ (NSDictionary *)colors {
    return @{
        @"ya_backgroundColor": UIColor.ya_backgroundColor,
        @"ya_backgroundColorLighten": UIColor.ya_backgroundColorLighten,
        @"ya_backgroundColorHighlighted": UIColor.ya_backgroundColorHighlighted,
        @"ya_tintColor": UIColor.ya_tintColor,
        @"ya_titleTextColor": UIColor.ya_titleTextColor,
        @"ya_mainTextColor": UIColor.ya_mainTextColor,
        @"ya_descriptionTextColor": UIColor.ya_descriptionTextColor,
        @"ya_placeholderColor": UIColor.ya_placeholderColor,
        @"ya_codeColor": UIColor.ya_codeColor,
        @"ya_separatorColor": UIColor.ya_separatorColor,
        @"ya_gridItemTintColor": UIColor.ya_gridItemTintColor,
    };
}

/**
 There are some kind of views that you rarely want to expand its hierarchy to inspect its subviews, e.g. UISlider, UIButton. Return the class names in the method below and Lookin will collapse them in most situations to keep your workspace uncluttered.
 Available since Lookin v0.9.2 (Released at 2019-07-23).
 
 有一些类我们很少有需求去查看它的 subviews 结构，比如 UISlider, UIButton。把这些不常展开的类的类名在下面的方法里返回，Lookin 将尽可能折叠这些类的图像，从而让你的工作区更加整洁。
 该配置从 2019-07-23 发布的 Lookin 0.9.2 版本开始生效。
 
 https://lookin.work/faq/config-file/#collapsed-classes
 */
+ (NSArray<NSString *> *)collapsedClasses {
//    example:
//    return @[@"AvatarButton", @"BookCoverView"];
    return nil;
}

@end
