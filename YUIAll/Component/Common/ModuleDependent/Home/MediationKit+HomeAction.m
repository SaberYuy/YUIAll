//
//  MediationKit+ExampleObj.m
//  YUIAll
//
//  Created by YUI on 2021/8/27.
//

#import "MediationKit+HomeAction.h"

NSString * const kMediationKitTargetHome = @"Home";

NSString * const kMediationKitActionNativeFetchHomeViewController = @"nativeFetchHomeViewController";

@implementation MediationKit (HomeAction)

- (UIViewController *)viewControllerForHome
{
    UIViewController *viewController = [self performTarget:kMediationKitTargetHome
                                                    action:kMediationKitActionNativeFetchHomeViewController
                                                    params:@{ kYUIMediatorParamsKeySwiftTargetModuleName: @"YUIAll"}
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
