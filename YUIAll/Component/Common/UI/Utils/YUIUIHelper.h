//
//  YUIUIHelper.h
//  qmuidemo
//
//  Created by QMUI Team on 15/6/2.
//  Copyright (c) 2015年 QMUI Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUIUIHelper : NSObject

+ (void)forceInterfaceOrientationPortrait;

@end


@interface YUIUIHelper (QMUIMoreOperationAppearance)

+ (void)customMoreOperationAppearance;

@end


@interface YUIUIHelper (QMUIAlertControllerAppearance)

+ (void)customAlertControllerAppearance;

@end

@interface YUIUIHelper (QMUIDialogViewControllerAppearance)

+ (void)customDialogViewControllerAppearance;

@end


@interface YUIUIHelper (QMUIEmotionView)

+ (void)customEmotionViewAppearance;
@end


@interface YUIUIHelper (QMUIImagePicker)

+ (void)customImagePickerAppearance;

@end

@interface YUIUIHelper (QMUIPopupContainerView)

+ (void)customPopupAppearance;
@end


@interface YUIUIHelper (UITabBarItem)

+ (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)tag;

@end


@interface YUIUIHelper (Button)

+ (QMUIButton *)generateDarkFilledButton;
+ (QMUIButton *)generateLightBorderedButton;
+ (QMUIButton *)generateGhostButtonWithColor:(UIColor *)color;
@end


@interface YUIUIHelper (Emotion)

+ (NSArray<QMUIEmotion *> *)qmuiEmotions;

/// 用于主题更新后，更新表情 icon 的颜色
+ (void)updateEmotionImages;
@end


@interface YUIUIHelper (SavePhoto)

+ (void)showAlertWhenSavedPhotoFailureByPermissionDenied;

@end


@interface YUIUIHelper (Calculate)

+ (NSString *)humanReadableFileSize:(long long)size;
    
@end


@interface YUIUIHelper (Theme)

+ (UIImage *)navigationBarBackgroundImageWithThemeColor:(UIColor *)color;
@end

@class QMUIInteractiveDebugPanelViewController;
@class QMUIInteractiveDebugPanelItem;

@interface YUIUIHelper (Debug)

+ (QMUIInteractiveDebugPanelViewController *)generateDebugViewControllerWithTitle:(NSString *)title items:(NSArray<QMUIInteractiveDebugPanelItem *> *)items;
@end


@interface NSString (Code)

- (void)enumerateCodeStringUsingBlock:(void (^)(NSString *codeString, NSRange codeRange))block;

@end

