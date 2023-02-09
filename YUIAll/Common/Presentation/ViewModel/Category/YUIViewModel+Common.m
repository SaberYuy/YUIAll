//
//  YUIViewModel+Common.m
//  YUIAll
//
//  Created by YUI on 2021/5/20.
//

#import "YUIViewModel+Common.h"

#import "YAComnonArchitectureDelegateObject.h"

@interface YUIViewModel (Common)

@property (nonatomic, strong) YAComnonArchitectureDelegateObject *architectureDelegateObject;

@end

@implementation YUIViewModel (Common)

#pragma mark - <YUIViewControllerDelegateProtocol>

- (void)receiveViewController:(__kindof UIViewController *)viewController name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo {
    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(receiveViewController:name:userInfo:)]) {
        
        [self.architectureDelegateObject receiveViewController:viewController name:name userInfo:userInfo];
    }
}

#pragma mark - <YUIViewManagerDelegate>

- (void)receiveViewManager:(id)viewManager name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo {
    
    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(receiveViewManager:name:userInfo:)]) {
        
        [self.architectureDelegateObject receiveViewManager:viewManager name:name userInfo:userInfo];
    }
}

- (YAComnonArchitectureDelegateObject *)architectureDelegateObject{
    
    YAComnonArchitectureDelegateObject *architectureDelegateObject = objc_getAssociatedObject(self , _cmd);
    
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
