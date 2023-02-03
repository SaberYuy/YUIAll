//
//  ExampleObjMVVMViewManager.h
//  YUIAll
//
//  Created by YUI on 2020/11/24.
//

#import "YACommonViewManager.h"

#import "ExampleObjMVVMView.h"
#import "ExampleObjMVVMViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjMVVMViewManager : YACommonViewManager <QMUITableViewDelegate>

@property (nonatomic, weak) ExampleObjMVVMView *managerView;

@property (nonatomic, weak) ExampleObjMVVMViewController *viewController;

- (void)tapA:(NSDictionary *)event;

- (void)tapB:(NSDictionary *)event;

@end

NS_ASSUME_NONNULL_END
