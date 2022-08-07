//
//  ExampleObjViewModel.h
//  YUIAll
//
//  Created by YUI on 2021/3/23.
//

#import "CommonViewModel.h"

#import "ExampleObjImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleObjViewModel : CommonViewModel

@property (nonatomic, strong) NSMutableArray <ExampleObjImage *> *datas;

//@property (nonatomic, copy) NSString *a;
//
//@property (nonatomic, assign) NSInteger b;

@end

NS_ASSUME_NONNULL_END
