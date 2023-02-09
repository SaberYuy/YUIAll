//
//  YACommonViewController+PopupView.m
//  YUIAll
//
//  Created by YUI on 2021/11/1.
//

#import "YACommonViewController+PopupView.h"

@implementation YACommonViewController (PopupView)

- (UIView *)popupView {
    
    if (!_popupView && self.isViewLoaded) {
        
        _popupView = [[UIView alloc] initWithFrame:self.view.bounds];
    }
    return _popupView;
}

- (void)setPopupView:(UIView *)popupView {
    
    if (popupView != _popupView) {
        
        _popupView = popupView;
    }
}

- (void)showPopupView {
    
    [self.view addSubview:self.popupView];
}

- (void)hidePopupView {
    
    [_popupView removeFromSuperview];
}

- (void)showPopupViewWithLoading {
    
    [self.view addSubview:self.popupView];
}

- (void)hidePopupViewWithLoading {
    
    [_popupView removeFromSuperview];
}

- (BOOL)isPopupViewShowing {
    
    return _popupView && _popupView.superview;
}

@end
