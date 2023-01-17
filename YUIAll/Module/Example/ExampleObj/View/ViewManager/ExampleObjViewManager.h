//
//  ExampleObjViewManager.h
//  YUIAll
//
//  Created by YUI on 2020/11/24.
//

#import "YACommonViewManager.h"

#import "ExampleObjView.h"
#import "ExampleObjViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjViewManager : YACommonViewManager <QMUITableViewDelegate>

@property (nonatomic, weak) ExampleObjView *managerView;

@property (nonatomic, weak) ExampleObjViewController *viewController;

- (void)tapA:(NSDictionary *)event;

- (void)tapB:(NSDictionary *)event;

@end

NS_ASSUME_NONNULL_END
