//
//  YACommonArchitectureViewController.h
//  YUIAll
//
//  Created by YUI on 2022/12/14.
//

#import "YACommonViewController.h"

#import <YUIArchitecture.h>

NS_ASSUME_NONNULL_BEGIN

@interface YACommonArchitectureViewController : YACommonViewController<YUIViewControllerProtocol, YUIViewProtocol, YUIModelManagerProtocol, YUIViewDelegateProtocol, YUIViewControllerDelegateProtocol>

@property (nonatomic, assign) BOOL isFirstAppear;

@property (nonatomic, strong) UIView <YUIViewProtocol> *containerView;
@property (nonatomic, strong) id<YUIModelManagerProtocol> modelManager;
@property (nullable, nonatomic, weak) id<YUIViewControllerDelegateProtocol> viewControllerDelegate;

+ (instancetype)sharedInstance;

- (void)configureArchitecture: (YUIArchitectureType)architectureType;

@end

NS_ASSUME_NONNULL_END
