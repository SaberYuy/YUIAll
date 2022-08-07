//
//  MainTabBarControllerViewController.m
//  YUIAll
//
//  Created by YUI on 2019/11/22.
//  Copyright © 2019 YUI. All rights reserved.
//

#import "MainTabBarController.h"

#import "MediationKit+ExampleObjAction.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self setViewControllers];
}

- (void)setViewControllers{
    
    UITabBarItem *example1TBI = [[UITabBarItem alloc] init];
    [example1TBI setTitle:@"测试"];
    example1TBI.image = [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    example1TBI.selectedImage = [[UIImage imageNamed:@"Main_Btn_Guidebook_Selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [example1TBI setImage:[UIImage imageNamed:@"Main_Btn_Guidebook_Unselected"]];
    
    UITabBarItem *example2TBI = [[UITabBarItem alloc] init];
    [example2TBI setTitle:@"我的"];
    example2TBI.image = [[UIImage imageNamed:@"Personal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    example2TBI.selectedImage = [[UIImage imageNamed:@"Main_Btn_Personal_Selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [example2TBI setImage:[UIImage imageNamed:@"Main_Btn_Personal_Unselected"]];
    
//    UIViewController *example1VC = [[MediationKit sharedInstance]viewControllerForExampleObj];
//    UINavigationController *example1NC = [[UINavigationController alloc]initWithRootViewController:example1VC];
//    [example1NC setTitle:@"测试"];
//
////    CommonViewController *PersonalVC = [[CommonViewController alloc]init];
//    UIViewController *example2VC = [[MediationKit sharedInstance]viewControllerForExampleObj];
//    [example2NC setTitle:@"我的"];
//
//    example1NC.tabBarItem = example1TBI;
//    example2NC.tabBarItem = example2TBI;
    
//    [self setViewControllers:@[example1NC,example2NC] animated:YES];
    
    UIViewController *example1VC = [[MediationKit sharedInstance]viewControllerForExampleObj];
    UIViewController *example2VC = [[MediationKit sharedInstance]viewControllerForExampleObj];
    
    [self addChildVC:example1VC title:@"测试" image:nil selectedImage:nil];
    [self addChildVC:example2VC title:@"我的" image:nil selectedImage:nil];
}

- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    if (title) {
        childVC.title = title;
    }
    
    // 设置子控制器的tabBarItem图片
    if (image) {
        childVC.tabBarItem.image = [UIImage imageNamed:image];
    }
    
    // 禁用图片渲染
    if (selectedImage) {
        childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
//    [QMUICMI tabBarItemTitleFont]
//
//    TabBarItemTitleFont
    
    [({[[QMUIConfiguration sharedInstance] applyInitialTemplate];[QMUIConfiguration sharedInstance];}) tabBarItemTitleFont];
    
    // 设置文字的样式
    [childVC.tabBarItem setTitleTextAttributes:@{
        NSForegroundColorAttributeName : [UIColor qmui_colorWithHexString:@"#EE7623"],
        NSFontAttributeName : [UIFont systemFontOfSize:24]} forState:UIControlStateSelected];
    [childVC.tabBarItem setTitleTextAttributes:@{
        NSForegroundColorAttributeName : [UIColor qmui_colorWithHexString:@"#0A0000"],
        NSFontAttributeName : [UIFont systemFontOfSize:24]} forState:UIControlStateNormal];
    // 为子控制器包装导航控制器
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:childVC];
    // 添加子控制器
    [self addChildViewController:navigationVC];
}

@end
