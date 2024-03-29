//
//  LoginViewController.h
//  YUIAll
//
//  Created by YUI on 2020/11/17.
//

#import "YACommonViewController.h"

#import "LoginModelManager.h"
#import "LoginViewManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : YACommonViewController

@property (nonatomic, strong) LoginModelManager *modelManager;
@property (nonatomic, strong) LoginViewManager *viewManager;

@end

NS_ASSUME_NONNULL_END
