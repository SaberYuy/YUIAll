//
//  MediationKit+ExampleObj.m
//  YUIAll
//
//  Created by YUI on 2021/8/27.
//

#import "MediationKit+ExampleObjAction.h"

NSString * const kMediationKitTargetExampleObj = @"ExampleObj";

NSString * const kMediationKitActionNativeFetchExampleObjViewController = @"nativeFetchExampleObjViewController";
NSString * const kMediationKitActionNativePresentImage = @"nativePresentImage";
NSString * const kMediationKitActionNativeNoImage = @"nativeNoImage";
NSString * const kMediationKitActionShowAlert = @"showAlert";
NSString * const kMediationKitActionCell = @"cell";
NSString * const kMediationKitActionConfigCell = @"configCell";

@implementation MediationKit (ExampleObjAction)

- (UIViewController *)viewControllerForExampleObj
{
    UIViewController *viewController = [self performTarget:kMediationKitTargetExampleObj
                                                    action:kMediationKitActionNativeFetchExampleObjViewController
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

- (void)presentImage:(UIImage *)image
{
    if (image) {
        [self performTarget:kMediationKitTargetExampleObj
                     action:kMediationKitActionNativePresentImage
                     params:@{@"image":image}
          shouldCacheTarget:NO];
    } else {
        // 这里处理image为nil的场景，如何处理取决于产品
        [self performTarget:kMediationKitTargetExampleObj
                     action:kMediationKitActionNativeNoImage
                     params:@{@"image":[UIImage imageNamed:@"noImage"]}
          shouldCacheTarget:NO];
    }
}

- (void)showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kMediationKitTargetExampleObj
                 action:kMediationKitActionShowAlert
                 params:paramsToSend
      shouldCacheTarget:NO];
}

- (UITableViewCell *)tableViewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView
{
    return [self performTarget:kMediationKitTargetExampleObj
                        action:kMediationKitActionCell
                        params:@{
                                 @"identifier":identifier,
                                 @"tableView":tableView
                                 }
             shouldCacheTarget:YES];
}

- (void)configTableViewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath
{
    [self performTarget:kMediationKitTargetExampleObj
                 action:kMediationKitActionConfigCell
                 params:@{
                          @"cell":cell,
                          @"title":title,
                          @"indexPath":indexPath
                          }
      shouldCacheTarget:YES];
}

- (void)cleanTableViewCellTarget
{
    NSString *fullTargetName = [NSString stringWithFormat:@"Target_%@", kMediationKitTargetExampleObj];
    [self releaseCachedTargetWithFullTargetName:fullTargetName];
}

@end
