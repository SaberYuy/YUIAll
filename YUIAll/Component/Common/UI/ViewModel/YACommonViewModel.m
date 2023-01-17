//
//  YACommonViewModel.m
//  YUIAll
//
//  Created by YUI on 2021/5/17.
//

#import "YACommonViewModel.h"

#import "NetworkKit.h"
#import  <YYModel.h>

#import "YAComnonArchitectureDelegateObject.h"

@interface YACommonViewModel ()

@property (nonatomic, strong) YAComnonArchitectureDelegateObject *architectureDelegateObject;

@end

@implementation YACommonViewModel

#pragma mark - <YUIViewControllerDelegateProtocol>

- (void)setData:(id)parameter{
    
    if(parameter && [parameter isKindOfClass:[NSDictionary class]]) {
        
        [self yy_modelSetWithDictionary:parameter];
    }
}

#pragma mark - <YUIViewControllerDelegateProtocol>

- (void)receiveViewController:(__kindof UIViewController *)viewController name:(NSString *)name userInfo:(NSDictionary *)userInfo {
    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(receiveViewController:name:userInfo:)]) {
        
        [self.architectureDelegateObject receiveViewController:viewController name:name userInfo:userInfo];
    }
}

#pragma mark - <YUIViewManagerDelegate>

- (void)receiveViewManager:(id)viewManager name:(NSString *)name info:(NSDictionary *)userInfo {
    
    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(receiveViewManager:name:userInfo:)]) {
        
        [self.architectureDelegateObject receiveViewManager:viewManager name:name userInfo:userInfo];
    }
}

- (YAComnonArchitectureDelegateObject *)architectureDelegateObject{
    
    if(!_architectureDelegateObject) {
        
        _architectureDelegateObject = [YAComnonArchitectureDelegateObject new];
        _architectureDelegateObject.delegate = self;
    }
    return _architectureDelegateObject;
}

@end
