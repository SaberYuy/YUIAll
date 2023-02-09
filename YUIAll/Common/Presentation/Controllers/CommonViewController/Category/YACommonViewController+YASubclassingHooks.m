////
////  YACommonViewController+MVVM.m
////  YUIAll
////
////  Created by YUI on 2021/5/26.
////
//
//#import "YACommonViewController+YASubclassingHooks.h"
//
//@implementation YACommonViewController (YASubclassingHooks)
//
//#pragma mark - <YUIViewControllerDelegateProtocol>
//
//- (void)viewController:(__kindof UIViewController *)viewController info:(NSDictionary *)info {
//
//    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(viewController:info:)]) {
//
//        [self.architectureDelegateObject viewController:viewController info:info];
//    }
//}
//
//#pragma mark - <YUIViewDelegateProtocol>
//
////既然使用dict作为信息转递决定具体的操作，我在中层添加了一种集约型模式转换为离散型模式的一种可能，并且以此弱化硬编码，优化上层判断
//- (void)view:(__kindof UIView *)view withEvent:(NSDictionary *)event {
//
//    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(view:withEvent:)]) {
//
//        [self.architectureDelegateObject view:view withEvent:event];
//    }
//}
//
//#pragma mark - <YUIViewModelDelegateProtocol>
//
//- (void)viewModel:(id)viewModel info:(NSDictionary *)info {
//
//    if(self.architectureDelegateObject && [self.architectureDelegateObject respondsToSelector:@selector(viewModel:info:)]) {
//
//        [self.architectureDelegateObject viewModel:viewModel info:info];
//    }
//}
//
//- (ComnonArchitectureDelegateObject *)architectureDelegateObject {
//
//    if(!_architectureDelegateObject) {
//
//        _architectureDelegateObject = [ComnonArchitectureDelegateObject new];
//        _architectureDelegateObject.delegate = self;
//    }
//    return _architectureDelegateObject;
//}
//
//- (void)setArchitectureDelegateObject:(ComnonArchitectureDelegateObject *)architectureDelegateObject {
//
//    if (architectureDelegateObject != _architectureDelegateObject) {
//        _architectureDelegateObject = architectureDelegateObject;
//    }
//}
//
//@end
