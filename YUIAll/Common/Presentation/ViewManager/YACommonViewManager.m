//
//  CommonViewManager.m
//  YUIAll
//
//  Created by YUI on 2020/11/19.
//

#import "YACommonViewManager.h"

#import "YAComnonArchitectureDelegateObject.h"

@interface YACommonViewManager ()

@property (nonatomic, strong) YAComnonArchitectureDelegateObject *architectureDelegate;

@end

@implementation YACommonViewManager

@dynamic viewController;

#pragma mark - <YUIViewDelegate>

//既然使用dict作为信息转递决定具体的操作，我在中层添加了一种集约型模式转换为离散型模式的一种可能，并且以此弱化硬编码，优化上层判断
- (void)receiveView:(UIView *)view name:(NSString *)name event:(nonnull NSDictionary *)event {
    
    if(self.architectureDelegate && [self.architectureDelegate respondsToSelector:@selector(receiveView:name:event:)]) {
        
        [self.architectureDelegate receiveView:view name:name event:event];
    }
}

#pragma mark - <YUIViewModelDelegate>

- (void)receiveViewModel:(id)viewModel name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo {
    
    if(self.architectureDelegate && [self.architectureDelegate respondsToSelector:@selector(receiveViewModel:name:userInfo:)]) {
        
        [self.architectureDelegate receiveViewModel:viewModel name:name userInfo:userInfo];
    }
}

- (YAComnonArchitectureDelegateObject *)architectureDelegate{
    
    if(!_architectureDelegate) {
        
        _architectureDelegate = [YAComnonArchitectureDelegateObject new];
        _architectureDelegate.delegate = self;
    }
    return _architectureDelegate;
}

@end
