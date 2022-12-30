//
//  YUIApplicationModule.m
//  YUIAll
//
//  Created by YUI on 2019/12/3.
//  Copyright © 2019 YUI. All rights reserved.
//

#import "YUIAppLifeModule.h"

#import "IQKeyboardManager.h"
#import "MediationKit+MainAction.h"
#import "MediationKit+ExampleObjAction.h"
#import "MediationKit+HomeAction.h"
//#import "LocalStorageService.h"
//#import "NetworkService.h"

@implementation YUIAppLifeModule

#pragma mark - <UIApplicationDelegate>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [self setup];
    
#ifdef UIWindowScene_Enabled
    if (@available(iOS 13.0, *)) {
    } else {
#endif
        [self didInitWindow];
#ifdef UIWindowScene_Enabled
    }
#endif
    
    return YES;
}

//- (void)applicationWillResignActive:(UIApplication *)application{
//
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application{
//
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application{
//
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application{
//
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application{
//
//}

#pragma mark - <UISceneDelegate>

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions API_AVAILABLE(ios(13.0)) {
    
    [self setup];
    
    if (@available(iOS 13.0, *)) {
        if ([scene isKindOfClass:UIWindowScene.class]) {
            [self didInitWindow];
        }
    }
}

- (void)setup{
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)didInitWindow{
    
    UIWindow *window = [self getCurrentWindow];
    window.backgroundColor = [UIColor whiteColor];
    window.rootViewController = [self generateWindowRootViewController];
    [[self getCurrentWindow] makeKeyAndVisible];
    [self startLaunchingAnimation];
}

- (UIWindow *)getCurrentWindow{
    
    if (@available(iOS 13.0, *)) {
        
        UIWindow *rootWindow;
        
        if([UIApplication sharedApplication].connectedScenes) {
            
            for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
                
                if ([scene isKindOfClass:UIWindowScene.class] &&
                    [scene.delegate respondsToSelector:@selector(window)]) {
                    
                    id<UIWindowSceneDelegate> delegate = (id<UIWindowSceneDelegate>)scene.delegate;
                    rootWindow = delegate.window;
                    
                    if(rootWindow) {
                        
                        return rootWindow;
                    }
                }
            }
        }
        return UIApplication.sharedApplication.delegate.window;
    }
    else{
        
        return UIApplication.sharedApplication.delegate.window;
    }
    
    return nil;
}

- (UIViewController *)generateWindowRootViewController{
    
    //    UIViewController *viewController = [[MediationKit sharedInstance]viewControllerForMain];
    UIViewController *viewController = [[MediationKit sharedInstance]viewControllerForExampleObj];
    //    UIViewController *viewController = [[MediationKit sharedInstance]viewControllerForHome];
    return viewController;
}

- (void)startLaunchingAnimation{
    
}

@end
