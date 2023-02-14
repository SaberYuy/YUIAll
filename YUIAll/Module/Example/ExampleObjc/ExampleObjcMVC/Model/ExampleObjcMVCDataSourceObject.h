//
//  ExampleObjcMVCDataSourceObject.h
//  YUIAll
//
//  Created by YUI on 2021/10/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjcMVCDataSourceObject : NSObject <QMUITableViewDataSource>

@property (nonatomic, weak) YUIModelManager *modelManager;

@end

NS_ASSUME_NONNULL_END
