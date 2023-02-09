//
//  ExampleObjcMVVMViewManager.m
//  YUIAll
//
//  Created by YUI on 2020/11/24.
//

#import "ExampleObjcMVVMViewManager.h"

#import "ExampleObjcMVCViewController.h"

@interface ExampleObjcMVVMViewManager()

@end

@implementation ExampleObjcMVVMViewManager

@dynamic managerView;
@dynamic viewController;

- (void)tapA:(NSDictionary *)event {
    
    ExampleObjcMVCViewController *viewController = [ExampleObjcMVCViewController new];
    [self.viewController.navigationController pushViewController:viewController animated:YES];
}

- (void)tapB:(NSDictionary *)event {
 
    self.viewController.popupView.backgroundColor = UIColor.greenColor;
    [self.viewController showPopupView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)loadComplete {
    
    [self.managerView.tableView reloadData];
}

@end
