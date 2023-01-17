//
//  ExampleObjViewManager.m
//  YUIAll
//
//  Created by YUI on 2020/11/24.
//

#import "ExampleObjViewManager.h"

#import "ExampleMVCViewController.h"

@interface ExampleObjViewManager()

@end

@implementation ExampleObjViewManager

@dynamic managerView;
@dynamic viewController;

- (void)tapA:(NSDictionary *)event {
    
    ExampleMVCViewController *viewController = [ExampleMVCViewController new];
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
