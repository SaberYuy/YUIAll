//
//  ExampleObjcMVVMDataSourceObject.h
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import <Foundation/Foundation.h>

#import "ExampleObjcMVVMViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjcMVVMDataSourceObject : NSObject <QMUITableViewDataSource>

@property (nonatomic, weak) ExampleObjcMVVMViewModel *modelManager;

@end

NS_ASSUME_NONNULL_END
