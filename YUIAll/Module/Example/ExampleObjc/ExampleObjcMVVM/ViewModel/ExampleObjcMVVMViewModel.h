//
//  ExampleObjcMVVMViewModel.h
//  YUIAll
//
//  Created by YUI on 2021/3/23.
//

#import "YACommonViewModel.h"

#import "ExampleObjcImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjcMVVMViewModel : YACommonViewModel

@property (nonatomic, strong) NSMutableArray <ExampleObjcImage *> *datas;

@end

NS_ASSUME_NONNULL_END
