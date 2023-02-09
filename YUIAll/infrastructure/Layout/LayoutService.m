//
//  layoutService.m
//  YUIAll
//
//  Created by YUI on 2017/10/17.
//  Copyright © 2017年 YUI rights reserved.
//

#define iPhone_5S_SIZE              CGSizeMake( 320, 568)

#define iPhone_6_SIZE               CGSizeMake( 375, 667)
#define iPhone_6S_SIZE              CGSizeMake( 375, 667)
#define iPhone_7_SIZE               CGSizeMake( 375, 667)
#define iPhone_8_SIZE               CGSizeMake( 375, 667)

#define iPhone_6_Plus_SIZE          CGSizeMake( 414, 736)
#define iPhone_6S_Plus_SIZE         CGSizeMake( 414, 736)
#define iPhone_7_Plus_SIZE          CGSizeMake( 414, 736)
#define iPhone_8_Plus_SIZE          CGSizeMake( 414, 736)

#define iPhone_X_SIZE               CGSizeMake( 375, 812)
#define iPhone_XS_SIZE              CGSizeMake( 375, 812)

#define iPhone_XR_SIZE              CGSizeMake( 414, 896)
#define iPhone_XS_Max_SIZE          CGSizeMake( 414, 896)

#define iPhone_11_SIZE              CGSizeMake( 414, 896)
#define iPhone_11_Pro_SIZE          CGSizeMake( 375, 812)
#define iPhone_11_Pro_Max_SIZE      CGSizeMake( 414, 896)

#define iPhone_12_SIZE              CGSizeMake( 390, 844)
#define iPhone_12_Mini_SIZE         CGSizeMake( 360, 780)
#define iPhone_12_Pro_SIZE          CGSizeMake( 390, 844)
#define iPhone_12_Pro_Max_SIZE      CGSizeMake( 428, 926)

#define iPhone_13_SIZE              CGSizeMake( 390, 844)
#define iPhone_13_Mini_SIZE         CGSizeMake( 360, 780)
#define iPhone_13_Pro_SIZE          CGSizeMake( 390, 844)
#define iPhone_13_Pro_Max_SIZE      CGSizeMake( 428, 926)

#define BenchmarkSize               iPhone_11_Pro_SIZE

#import "LayoutService.h"

@interface LayoutService ()

@property (nonatomic, assign) float adaptionWidthRatio;

@end

@implementation LayoutService

+ (instancetype)sharedInstance{
    
    //Singleton instance
    static LayoutService *layoutService;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        layoutService = [[self alloc] init];
        layoutService.adaptionWidthRatio = DEVICE_WIDTH / BenchmarkSize.width;
        
        if (IS_iPhone_X_SERIES) {
            
            //            layoutService.statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
            layoutService.statusBarHeight = [self getRootWindow].safeAreaInsets.top;
            //YUI Temp
//            layoutService.navigationBarHeight = 44;
            layoutService.safeAreaTopHeight = 88;
            layoutService.safeAreaBottomHeight = 34;
            layoutService.tabBarHeight = 83;
        }
        else{
            
            layoutService.statusBarHeight = 20;
            layoutService.navigationBarHeight = 44;
            layoutService.safeAreaTopHeight = 64;
            layoutService.safeAreaBottomHeight = 0;
            
            layoutService.tabBarHeight = 49;
        }
        
        layoutService.contentHeight = [[UIScreen mainScreen] bounds].size.height - layoutService.safeAreaTopHeight - layoutService.safeAreaBottomHeight - layoutService.tabBarHeight;
    });
    
    return layoutService;
}

+ (BOOL)isIPhoneXSeries{
    
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [self getRootWindow];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    
    return iPhoneXSeries;
}

+ (UIWindow *)getRootWindow{
    
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            window.windowLevel == UIWindowLevelNormal &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    return [UIApplication sharedApplication].keyWindow;
}

- (NSInteger)adaptWidthRatio:(float)length{
    
    NSInteger adaptionlength = length * self.adaptionWidthRatio;
    
    return adaptionlength;
}

@end
