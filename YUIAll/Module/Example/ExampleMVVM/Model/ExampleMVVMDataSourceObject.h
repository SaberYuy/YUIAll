//
//  ExampleMVVMDataSourceObject.h
//  YUIAll
//
//  Created by YUI on 2021/10/28.
//

#import <Foundation/Foundation.h>

#import <YUIArchitecture.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExampleMVVMDataSourceObject : NSObject <QMUITableViewDataSource, QMUITableViewDelegate>

@property (nonatomic, weak) YUIModelManager *modelManager;

@end

NS_ASSUME_NONNULL_END
