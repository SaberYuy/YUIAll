//
//  MediationKit+ExampleObj.h
//  YUIAll
//
//  Created by YUI on 2021/8/27.
//

#import "MediationKit.h"

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MediationKit (ExampleObjAction)

- (UIViewController *)viewControllerForExampleObj;

- (void)showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;

- (void)presentImage:(UIImage *)image;

- (UITableViewCell *)tableViewCellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView;

- (void)configTableViewCell:(UITableViewCell *)cell withTitle:(NSString *)title atIndexPath:(NSIndexPath *)indexPath;

- (void)cleanTableViewCellTarget;

@end

NS_ASSUME_NONNULL_END
