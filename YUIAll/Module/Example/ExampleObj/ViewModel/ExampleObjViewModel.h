//
//  ExampleObjViewModel.h
//  YUIAll
//
//  Created by YUI on 2021/3/23.
//

#import "YACommonViewModel.h"

#import "ExampleObjImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjViewModel : YACommonViewModel

@property (nonatomic, strong) NSMutableArray <ExampleObjImage *> *datas;

- (void)loadData:(id)parameter;

@end

NS_ASSUME_NONNULL_END
