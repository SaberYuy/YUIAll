//
//  ComnonArchitectureDelegateObject.m
//  YUIAll
//
//  Created by YUI on 2021/6/15.
//

#import "YAComnonArchitectureDelegateObject.h"

@implementation YAComnonArchitectureDelegateObject

- (void)receiveView:(UIView *)view name:(NSString *)name event:(nonnull NSDictionary *)event {
    
    NSMutableDictionary *eventDict = [NSMutableDictionary dictionaryWithDictionary:event];
    [eventDict addEntriesFromDictionary:@{@"view":view}];
    
    [self performDynamicMethodWithName:name info:eventDict];
}

- (void)receiveViewModel:(id)viewModel name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo {
    
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [infoDict addEntriesFromDictionary:@{@"viewModel":viewModel}];
    
    [self performDynamicMethodWithName:name info:infoDict];
}

- (void)receiveViewManager:(id)viewManager name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo {
    
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [infoDict addEntriesFromDictionary:@{@"viewManager":viewManager}];
    
    [self performDynamicMethodWithName:name info:infoDict];
}

- (void)receiveViewController:(__kindof UIViewController *)viewController name:(NSString *)name userInfo:(nonnull NSDictionary *)userInfo {
    
    NSMutableDictionary *infoDict = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [infoDict addEntriesFromDictionary:@{@"viewController":viewController}];
    
    [self performDynamicMethodWithName:name info:infoDict];
}

- (void)performDynamicMethodWithName:(NSString *)name info:(NSDictionary *)info{
    
    NSString *methodName = name;
    SEL methodSelector1 = NSSelectorFromString(methodName);
    SEL methodSelector2 = NSSelectorFromString([NSString stringWithFormat:@"%@:",methodName]);
    
    if([self.delegate respondsToSelector:methodSelector2]) {
        
        IMP imp = [self.delegate methodForSelector:methodSelector2];
        void (*func)(id, SEL, NSDictionary *) = (void *)imp;
        func(self.delegate, methodSelector2, info);
    }
    else if([self.delegate respondsToSelector:methodSelector1]) {
        
        IMP imp = [self.delegate methodForSelector:methodSelector1];
        void (*func)(id, SEL) = (void *)imp;
        func(self.delegate, methodSelector1);
    }
}

@end
