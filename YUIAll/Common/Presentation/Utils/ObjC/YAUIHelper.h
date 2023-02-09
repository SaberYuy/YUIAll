//
//  YAUIHelper.h
//  qmuidemo
//
//  Created by QMUI Team on 15/6/2.
//  Copyright (c) 2015年 QMUI Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YAUIHelper : NSObject

+ (void)forceInterfaceOrientationPortrait;

@end


@interface YAUIHelper (QMUIMoreOperationAppearance)

+ (void)customMoreOperationAppearance;

@end


@interface YAUIHelper (QMUIAlertControllerAppearance)

+ (void)customAlertControllerAppearance;

@end

@interface YAUIHelper (QMUIDialogViewControllerAppearance)

+ (void)customDialogViewControllerAppearance;

@end


@interface YAUIHelper (QMUIEmotionView)

+ (void)customEmotionViewAppearance;
@end


@interface YAUIHelper (QMUIImagePicker)

+ (void)customImagePickerAppearance;

@end

@interface YAUIHelper (QMUIPopupContainerView)

+ (void)customPopupAppearance;
@end


@interface YAUIHelper (UITabBarItem)

+ (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)tag;

@end


@interface YAUIHelper (Button)

+ (QMUIButton *)generateDarkFilledButton;
+ (QMUIButton *)generateLightBorderedButton;
+ (QMUIButton *)generateGhostButtonWithColor:(UIColor *)color;
@end


@interface YAUIHelper (Emotion)

+ (NSArray<QMUIEmotion *> *)qmuiEmotions;

/// 用于主题更新后，更新表情 icon 的颜色
+ (void)updateEmotionImages;
@end


@interface YAUIHelper (SavePhoto)

+ (void)showAlertWhenSavedPhotoFailureByPermissionDenied;

@end


@interface YAUIHelper (Calculate)

+ (NSString *)humanReadableFileSize:(long long)size;
    
@end


@interface YAUIHelper (Theme)

+ (UIImage *)navigationBarBackgroundImageWithThemeColor:(UIColor *)color;
@end

@class QMUIInteractiveDebugPanelViewController;
@class QMUIInteractiveDebugPanelItem;

@interface YAUIHelper (Debug)

+ (QMUIInteractiveDebugPanelViewController *)generateDebugViewControllerWithTitle:(NSString *)title items:(NSArray<QMUIInteractiveDebugPanelItem *> *)items;
@end


@interface NSString (Code)

- (void)enumerateCodeStringUsingBlock:(void (^)(NSString *codeString, NSRange codeRange))block;

@end

