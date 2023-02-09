//
//  Common.h
//  YUIAll
//
//  Created by YUI on 2021/11/2.
//

#ifndef CommonUI_h
#define CommonUI_h

#if __has_include("YACommonViewModel.h")
#import "YACommonViewModel.h"
#endif

#if __has_include("YACommonViewManager.h")
#import "YACommonViewManager.h"
#endif

#if __has_include("YUIViewManager+Common.h")
#import "YUIViewManager+Common.h"
#endif


#if __has_include("CommonView.h")
#import "YACommonView.h"
#endif

#if __has_include("UIView+Common.h")
#import "UIView+Common.h"
#endif


#if __has_include("CommonLayoutModel.h")
#import "CommonLayoutModel.h"
#endif

#if __has_include("CommonModelManager.h")
#import "CommonModelManager.h"
#endif

#if __has_include("CommonTransferModel.h")
#import "CommonTransferModel.h"
#endif

#if __has_include("CommonTransferModel.h")
#import "CommonTransferModel.h"
#endif


#if __has_include("ComnonArchitectureDelegateObject.h")
#import "YAComnonArchitectureDelegateObject.h"
#endif

#if __has_include("CommonEmptyDataTableSetViewDelegateObject.h")
#import "CommonEmptyDataSetDelegateObject.h"
#endif

#endif /* Common_h */

#ifdef __OBJC__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import <QMUIKit/QMUIKit.h>

#import "YACommonUI.h"
#import "YAUIHelper.h"
#import "YAThemeManager.h"
#import "YANavigationController.h"
#import "YACommonViewController.h"
#import "YACommonTableViewController.h"
#import "YACommonArchitectureViewController.h"

#if __has_include("YACommonViewController+PopupView.h")
#import "YACommonViewController+PopupView.h"
#endif

#if __has_include("YACommonViewController+EmptyView.h")
#import "YACommonViewController+EmptyView.h"
#endif

#if __has_include("YACommonViewController+SubclassingHooks.h")
#import "YACommonViewController+SubclassingHooks.h"
#endif

#endif
