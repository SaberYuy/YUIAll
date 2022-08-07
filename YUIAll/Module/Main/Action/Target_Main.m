//
//  Target_Main.m
//  YUIAll
//
//  Created by YUI on 2019/11/22.
//  Copyright © 2019 YUI. All rights reserved.
//

#import "Target_Main.h"

#import "MainTabBarController.h"

@implementation Target_Main

- (UIViewController *)Action_nativeFetchMainTabBarController:(nullable NSDictionary *)params{
    
    MainTabBarController *mainTBC = [MainTabBarController new];
    
    return mainTBC;
}

- (void)Action_nativeRootMainTabBarController:(NSDictionary *)params{
    
    MainTabBarController *mainTBC = [[MainTabBarController alloc] init];
    //    [[UIApplication sharedApplication].keyWindow setRootViewController:viewController];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:mainTBC animated:YES completion:nil];
}

- (void)Action_nativeRootMainNavigationController:(nullable NSDictionary *)params{
    
    MainTabBarController *mainTBC = [[MainTabBarController alloc] init];
    
    UINavigationController *mainNC = [[UINavigationController alloc]initWithRootViewController:mainTBC];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:mainNC animated:YES completion:nil];
}

@end
