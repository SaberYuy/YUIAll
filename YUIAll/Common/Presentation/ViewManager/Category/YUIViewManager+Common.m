//
//  YUIViewManager+Common.m
//  YUIAll
//
//  Created by YUI on 2021/5/20.
//

#import "YUIViewManager+Common.h"
#import <objc/runtime.h>

#import "YAComnonArchitectureDelegateObject.h"

@interface YUIViewManager (Common)

@property (nonatomic, strong) YAComnonArchitectureDelegateObject *architectureDelegateObject;

@end

@implementation YUIViewManager (Common)

#pragma mark - <YUIViewDelegate>

//既然使用dict作为信息转递决定具体的操作，我在中层添加了一种集约型模式转换为离散型模式的一种可能，并且以此弱化硬编码，优化上层判断
- (void)receiveView:(__kindof UIView *)view name:(nonnull NSString *)name event:(nonnull NSDictionary *)event {
    
    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(receiveView:name:event:)]) {
        
        [self.architectureDelegateObject receiveView:view name:name event:event];
    }
}

#pragma mark - <YUIViewModelDelegate>

- (void)receiveViewModel:(id)viewModel name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo {
    
    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(receiveViewModel:name:userInfo:)]) {
        
        [self.architectureDelegateObject receiveViewModel:viewModel name:name userInfo:userInfo];
    }
}

- (YAComnonArchitectureDelegateObject *)architectureDelegateObject{
    
    YAComnonArchitectureDelegateObject *architectureDelegateObject = objc_getAssociatedObject(self, _cmd);
    
    if(!architectureDelegateObject) {
        architectureDelegateObject = [YAComnonArchitectureDelegateObject new];
        architectureDelegateObject.delegate = self;
        [self setArchitectureDelegateObject:architectureDelegateObject];
    }
    
    return architectureDelegateObject;
}

- (void)setArchitectureDelegateObject:(YAComnonArchitectureDelegateObject *)architectureDelegateObject{
    
    objc_setAssociatedObject(self, @selector(architectureDelegateObject), architectureDelegateObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
