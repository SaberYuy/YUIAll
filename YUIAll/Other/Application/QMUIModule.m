//
//  QMUIModule.m
//  YUIAll
//
//  Created by SPDBVIP453 on 2022/12/1.
//

#import "QMUIModule.h"

#import "YUIUIHelper.h"
#import "YUICommonUI.h"
//#import "YUITabBarViewController.h"
//#import "YUINavigationController.h"
//#import "YUIUIKitViewController.h"
//#import "YUIComponentsViewController.h"
//#import "YUILabViewController.h"
#import "QMUIConfigurationTemplateGrapefruit.h"
#import "QMUIConfigurationTemplateGrass.h"
#import "QMUIConfigurationTemplatePinkRose.h"
#import "QMUIConfigurationTemplateDark.h"

@implementation QMUIModule

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1. 先注册主题监听，在回调里将主题持久化存储，避免启动过程中主题发生变化时读取到错误的值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleThemeDidChangeNotification:) name:QMUIThemeDidChangeNotification object:nil];
    
    // 2. 然后设置主题的生成器
    QMUIThemeManagerCenter.defaultThemeManager.themeGenerator = ^__kindof NSObject * _Nonnull(NSString * _Nonnull identifier) {
        if ([identifier isEqualToString:YUIThemeIdentifierDefault]) return QMUIConfigurationTemplate.new;
        if ([identifier isEqualToString:YUIThemeIdentifierGrapefruit]) return QMUIConfigurationTemplateGrapefruit.new;
        if ([identifier isEqualToString:YUIThemeIdentifierGrass]) return QMUIConfigurationTemplateGrass.new;
        if ([identifier isEqualToString:YUIThemeIdentifierPinkRose]) return QMUIConfigurationTemplatePinkRose.new;
        if ([identifier isEqualToString:YUIThemeIdentifierDark]) return QMUIConfigurationTemplateDark.new;
        return nil;
    };
    
    // 3. 再针对 iOS 13 开启自动响应系统的 Dark Mode 切换
    // 如果不需要这个功能，则不需要这一段代码
    if (@available(iOS 13.0, *)) {
        if (QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier) {// 做这个 if(currentThemeIdentifier) 的保护只是为了避免 YUI 里的配置表没启动时，没人为 currentTheme/currentThemeIdentifier 赋值，导致后续的逻辑会 crash，业务项目里理论上不会有这种情况出现，所以可以省略这个 if，直接写下面的代码就行了
            
            QMUIThemeManagerCenter.defaultThemeManager.identifierForTrait = ^__kindof NSObject<NSCopying> * _Nonnull(UITraitCollection * _Nonnull trait) {
                // 1. 如果当前系统切换到 Dark Mode，则返回 App 在 Dark Mode 下的主题
                if (trait.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    return YUIThemeIdentifierDark;
                }
                
                // 2. 如果没有命中1，说明此时系统是 Light，则返回 App 在 Light 下的主题即可，这里不直接返回 Default，而是先做一些复杂判断，是因为 QMUI Demo 非深色模式的主题有好几个，而我们希望不管之前选择的是 Default、Grapefruit 还是 PinkRose，只要从 Dark 切换为非 Dark，都强制改为 Default。
                
                // 换句话说，如果业务项目只有 Light/Dark 两套主题，则按下方被注释掉的代码一样直接返回 Light 下的主题即可。
//                return YUIThemeIdentifierDefault;
                
                if ([QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier isEqual:YUIThemeIdentifierDark]) {
                    return YUIThemeIdentifierDefault;
                }
                return QMUIThemeManagerCenter.defaultThemeManager.currentThemeIdentifier;
            };
            QMUIThemeManagerCenter.defaultThemeManager.respondsSystemStyleAutomatically = YES;
        }
    }
    
    // QMUIConsole 默认只在 DEBUG 下会显示，作为 Demo，改为不管什么环境都允许显示
    [QMUIConsole sharedInstance].canShow = YES;
    
    // YUI自定义的全局样式渲染
    [YUICommonUI renderGlobalAppearances];
    
    // 预加载 QQ 表情，避免第一次使用时卡顿
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [YUIUIHelper qmuiEmotions];
    });
    
    return YES;
}

@end
