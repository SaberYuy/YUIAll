//
//  ExampleObjMVVMViewManager.m
//  YUIAll
//
//  Created by YUI on 2020/11/24.
//

#import "ExampleObjMVVMViewManager.h"

#import "ExampleObjMVCViewController.h"

@interface ExampleObjMVVMViewManager()

@end

@implementation ExampleObjMVVMViewManager

@dynamic managerView;
@dynamic viewController;

- (void)tapA:(NSDictionary *)event {
    
    ExampleObjMVCViewController *viewController = [ExampleObjMVCViewController new];
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
