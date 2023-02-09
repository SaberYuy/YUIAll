//
//  ApplicationMediator.h
//  YUIAll
//
//  Created by YUI on 2019/12/3.
//  Copyright © 2019 YUI. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppLifeCycleMediatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kModulesRegisterFileName;

@interface AppLifecycleMediator : NSObject<AppLifecycleMediatorProtocol>

+ (instancetype)sharedInstance;

- (void)loadModules;

- (void)loadModulesWithPlistFilePath:(NSString *)plistFilePath;

- (NSArray<id<AppLifecycleMediatorProtocol>> *)allModules;

@end

NS_ASSUME_NONNULL_END
