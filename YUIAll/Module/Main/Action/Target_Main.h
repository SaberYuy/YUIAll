//
//  Target_Main.h
//  YUIAll
//
//  Created by YUI on 2019/11/22.
//  Copyright © 2019 YUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_Main : NSObject

- (UIViewController *)Action_nativeFetchMainTabBarController:(nullable NSDictionary *)params;

- (void)Action_nativeRootMainTabBarController:(nullable NSDictionary *)params;

- (void)Action_nativeRootMainNavigationController:(nullable NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
