//
//  MediationKit+ExampleObj.m
//  YUIAll
//
//  Created by YUI on 2021/8/27.
//

#import "MediationKit+MainAction.h"

NSString * const kMediationKitTargetMain = @"Main";

NSString * const kMediationKitActionNativeFetchMainTabBarController = @"nativeFetchMainTabBarController";

@implementation MediationKit (MainAction)

- (UIViewController *)viewControllerForMain
{
    UIViewController *viewController = [self performTarget:kMediationKitTargetMain
                                                    action:kMediationKitActionNativeFetchMainTabBarController
                                                    params:@{@"key":@"value"}
                                         shouldCacheTarget:NO
                                        ];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

@end
