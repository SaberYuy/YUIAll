//
//  LayoutService.h
//  YUIAll
//
//  Created by YUI on 2017/10/17.
//  Copyright © 2017年 YUI rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LayoutServiceShared     [LayoutService sharedInstance]
#define IS_iPhone_X_SERIES      [LayoutService isIPhoneXSeries]
#define AdaptWidthRatio(width)  [[LayoutService sharedInstance] adaptWidthRatio:(width)]


@protocol LayoutServiceDelegate <NSObject>

@end

@interface LayoutService : NSObject

@property (nonatomic, assign) NSInteger statusBarHeight;
@property (nonatomic, assign) NSInteger navigationBarHeight;
@property (nonatomic, assign) NSInteger safeAreaTopHeight;
@property (nonatomic, assign) NSInteger safeAreaBottomHeight;
@property (nonatomic, assign) NSInteger tabBarHeight;
@property (nonatomic, assign) NSInteger contentHeight;

@property (nonatomic, assign) UIEdgeInsets subviewEdge;

@property (nonatomic, assign) NSInteger subviewSpacingWidth;

@property (nonatomic, assign) NSInteger subviewSpacingHeight;

+ (instancetype)sharedInstance;

+ (BOOL)isIPhoneXSeries;

- (NSInteger)adaptWidthRatio:(float)width;

@property (nonatomic, assign) id<LayoutServiceDelegate> delegate;

@end
