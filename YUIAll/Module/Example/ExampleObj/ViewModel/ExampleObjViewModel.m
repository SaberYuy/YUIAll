//
//  ExampleObjViewModel.m
//  YUIAll
//
//  Created by YUI on 2021/3/23.
//

#import "ExampleObjViewModel.h"

#import "ExampleObjRequest.h"
#import "ExampleObjImage.h"
#import "YYModel.h"

@interface ExampleObjViewModel ()

@end

@implementation ExampleObjViewModel

- (void)didInitialize{
    
    [super didInitialize];
    
    self.datas = [NSMutableArray new];
}

- (void)loadData:(id)parameter{
    
    [[NetworkKit sharedInstance]requestWithRequest:[ExampleObjRequest new]
                                           success:^(CommonRequest * _Nullable resultRequest, NSDictionary * _Nullable resultDict) {
        [[self mutableArrayValueForKey:@"datas"] addObjectsFromArray:[NSArray yy_modelArrayWithClass:[ExampleObjImage class] json:[resultDict objectForKey:@"data"]]];
        if(self.viewModelDelegate && [self.viewModelDelegate respondsToSelector:@selector(receiveViewModel:name:userInfo:)]) {

            [self.viewModelDelegate receiveViewModel:self name:@"loadComplete" userInfo:@{@"data":@"123"}];
        }
    }
                                           failure:^(NSError * _Nullable error) {
    }];
}

@end
