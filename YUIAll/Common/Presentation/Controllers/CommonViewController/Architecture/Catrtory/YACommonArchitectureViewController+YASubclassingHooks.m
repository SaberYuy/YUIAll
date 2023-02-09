//
//  YACommonArchitectureViewController+YASubclassingHooks.m
//  YUIAll
//
//  Created by YUI on 2022/12/30.
//

#import "YACommonArchitectureViewController+YASubclassingHooks.h"

@implementation YACommonArchitectureViewController (YASubclassingHooks)

#pragma mark - <YUIViewControllerProtocol>

//- (void)configureArchitecture {
//
//    [self executeMethodFromArchitecture:_cmd];
//}
//
//- (void)configureBingding {
//
//    [self executeMethodFromArchitecture:_cmd];
//}

//- (void)didInitialize {
//
//    self.dataLoadType = DataLoadTypeCustom;
//    self.isFirstAppear = YES;
//
//    [self configureNotification];
//
//    [self executeMethodFromArchitecture:_cmd];
//}

#pragma mark - <YUIViewProtocol>

- (void)setupContainerView {
    // Rewrite this func in SubClass !
}

- (void)initSubviews {
    // Rewrite this func in SubClass !
    [super initSubviews];
}

- (void)setupSubviewsFrame {
    // Rewrite this func in SubClass !
}

- (void)setupSubviewsConstraints {
    // Rewrite this func in SubClass !
}

- (void)configureGesture {
    // Rewrite this func in SubClass !
}

- (void)updateSubviews {
    // Rewrite this func in SubClass !
}

- (void)updateSubviewsLayout {
    // Rewrite this func in SubClass !
}

- (void)setupNavigationItems {
    // Rewrite this func in SubClass !
    [super setupNavigationItems];
}

- (void)setupToolbarItems {
    // Rewrite this func in SubClass !
    [super setupToolbarItems];
}

- (void)contentSizeCategoryDidChanged:(NSNotification *)notification {
    // Rewrite this func in SubClass !
}

- (void)configureObserver {
    // Rewrite this func in SubClass !
}

- (void)cleanupObserver {
    // Rewrite this func in SubClass !
}

//- (void)configureNotification {
    // Rewrite this func in SubClass !
//}

- (void)removeNotification {
    // Rewrite this func in SubClass !
}

//- (void)cleanupNotification {
//
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}

- (void)configureTimer {
    // Rewrite this func in SubClass !
}

- (void)cleanupTimer {
    // Rewrite this func in SubClass !
}

#pragma mark - <YUIViewControllerDelegateProtocol>

- (void)viewController:(__kindof UIViewController *)viewController info:(NSDictionary *)info {
    
}

#pragma mark - <YUIViewDelegateProtocol>

- (void)view:(__kindof UIView *)view withEvent:(NSDictionary *)event {
    
}

#pragma mark - <YUIViewModelDelegateProtocol>

- (void)viewModel:(id)viewModel info:(NSDictionary *)info {
    
}

@end
