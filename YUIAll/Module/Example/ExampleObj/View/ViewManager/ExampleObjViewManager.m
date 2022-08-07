//
//  ExampleObjViewManager.m
//  YUIAll
//
//  Created by YUI on 2020/11/24.
//

#import "ExampleObjViewManager.h"

#import "ExampleMVCViewController.h"

@implementation ExampleObjViewManager

- (void)tapA:(NSDictionary *)event{
    
    ExampleMVCViewController *viewController = [ExampleMVCViewController new];
    [self.viewController.navigationController pushViewController:viewController animated:YES];
}

@end
