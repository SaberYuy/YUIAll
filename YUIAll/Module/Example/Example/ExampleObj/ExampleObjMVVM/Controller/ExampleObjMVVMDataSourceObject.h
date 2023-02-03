//
//  ExampleObjMVVMDataSourceObject.h
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import <Foundation/Foundation.h>

#import "ExampleObjMVVMViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjMVVMDataSourceObject : NSObject <QMUITableViewDataSource>

@property (nonatomic, weak) ExampleObjMVVMViewModel *modelManager;

@end

NS_ASSUME_NONNULL_END
