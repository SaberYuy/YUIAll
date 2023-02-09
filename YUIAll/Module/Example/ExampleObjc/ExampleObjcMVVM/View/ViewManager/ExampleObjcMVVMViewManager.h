//
//  ExampleObjcMVVMViewManager.h
//  YUIAll
//
//  Created by YUI on 2020/11/24.
//

#import "YACommonViewManager.h"

#import "ExampleObjcMVVMView.h"
#import "ExampleObjcMVVMViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjcMVVMViewManager : YACommonViewManager <QMUITableViewDelegate>

@property (nonatomic, weak) ExampleObjcMVVMView *managerView;

@property (nonatomic, weak) ExampleObjcMVVMViewController *viewController;

- (void)tapA:(NSDictionary *)event;

- (void)tapB:(NSDictionary *)event;

@end

NS_ASSUME_NONNULL_END
