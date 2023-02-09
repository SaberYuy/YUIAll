//
//  ExampleMVCViewController.m
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

#import "ExampleObjcMVCViewController.h"

#import "ExampleObjcMVCView.h"
#import "ExampleObjcMVCModelManager.h"
#import "ExampleObjcMVCDataSourceObject.h"
#import "ExampleObjcMVCEmptyDataSetDelegateObject.h"

@interface ExampleObjcMVCViewController ()<QMUITableViewDelegate>

@property (nonatomic, strong) ExampleObjcMVCView *containerView;
@property (nonatomic, strong) ExampleObjcMVCModelManager *modelManager;
@property (nonatomic, strong) ExampleObjcMVCDataSourceObject *dataSourceObject;
@property (nonatomic, strong) ExampleObjcMVCEmptyDataSetDelegateObject *emptyDataSetObject;

@end

@implementation ExampleObjcMVCViewController

@dynamic containerView;
@dynamic modelManager;

#pragma mark - init

- (void)configureArchitecture{
    
    [super configureArchitecture:YUIArchitectureTypeMVC];
}

#pragma mark - Lifecycle

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self showPopupViewWithLoading];
    
    [self.modelManager loadData:nil];
}

- (void)configureBingding{
    
    [super configureBingding];
    
    self.dataSourceObject.modelManager = self.modelManager;
    self.containerView.tableView.delegate = self;
    self.containerView.tableView.dataSource = self.dataSourceObject;
    self.containerView.tableView.emptyDataSetSource = self.emptyDataSetObject;
    self.containerView.tableView.emptyDataSetDelegate = self.emptyDataSetObject;
}

//#pragma mark - UITableViewDelegate
#pragma mark - ViewDelegate

#pragma mark - <QMUITableViewDelegate>

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}

#pragma mark - CustomDelegate
#pragma mark - event response
#pragma mark - private methods
#pragma mark - getters and setters

- (ExampleObjcMVCDataSourceObject *)dataSourceObject{
    
    if(!_dataSourceObject) {
        
        _dataSourceObject = [ExampleObjcMVCDataSourceObject new];
    }
    return _dataSourceObject;
}

- (ExampleObjcMVCEmptyDataSetDelegateObject *)emptyDataSetObject{
    
    if(!_emptyDataSetObject) {
        
        _emptyDataSetObject = [ExampleObjcMVCEmptyDataSetDelegateObject new];
    }
    return _emptyDataSetObject;
}

@end
