//
//  ComnonArchitectureDelegateObject.h
//  YUIAll
//
//  Created by YUI on 2021/6/15.
//

#import <Foundation/Foundation.h>

#import "YUIViewDelegateProtocol.h"
#import "YUIViewModelDelegateProtocol.h"
#import "YUIViewManagerDelegateProtocol.h"
#import "YUIViewControllerDelegateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YAComnonArchitectureDelegateObject : NSObject <YUIViewDelegateProtocol,YUIViewModelDelegateProtocol,YUIViewManagerDelegateProtocol,YUIViewControllerDelegateProtocol>

@property (nonatomic, weak) NSObject *delegate;

- (void)receiveView:(UIView *)view name:(NSString *)name event:(NSDictionary *)event;

- (void)receiveViewModel:(id)viewModel name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo;

- (void)receiveViewManager:(id)viewManager name:(NSString *)name userInfo:(NSDictionary *)userInfo;

- (void)receiveViewController:(__kindof UIViewController *)viewController name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
