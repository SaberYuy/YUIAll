//
//  ExampleObjDataSource.h
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import <Foundation/Foundation.h>

#import "ExampleObjViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjDataSource : NSObject <QMUITableViewDataSource>

@property (nonatomic, weak) ExampleObjViewModel *modelManager;

@end

NS_ASSUME_NONNULL_END
