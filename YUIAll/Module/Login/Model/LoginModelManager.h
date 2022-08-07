//
//  LoginModelManager.h
//  YUIAll
//
//  Created by YUI on 2020/11/17.
//

#import "CommonModelManager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LoginModelManagerDelegate <NSObject, CommonManagerDelegate>

- (void)loginSuccess;

@end

@interface LoginModelManager : CommonModelManager

@property (nonatomic, weak) id<LoginModelManagerDelegate> delegate;

- (void)login;

@end

NS_ASSUME_NONNULL_END
