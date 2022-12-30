//
//  ExampleMVVMViewController.m
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

#import "ExampleMVVMViewController.h"

#import "ExampleMVVMView.h"
#import "ExampleMVVMViewManager.h"
#import "ExampleMVVMViewModel.h"
#import "ExampleMVVMDataSourceObject.h"
#import "ExampleMVVMEmptyDataSetDelegateObject.h"

@interface ExampleMVVMViewController ()<QMUITableViewDelegate>

@property (nonatomic, strong) ExampleMVVMView *mainView;
@property (nonatomic, strong) ExampleMVVMViewManager *viewManager;
@property (nonatomic, strong) ExampleMVVMViewModel *viewModel;
@property (nonatomic, strong) ExampleMVVMDataSourceObject *dataSourceObject;
@property (nonatomic, strong) ExampleMVVMEmptyDataSetDelegateObject *emptyDataSetObject;

@end

@implementation ExampleMVVMViewController

@dynamic mainView;
@dynamic viewManager;
@dynamic viewModel;

#pragma mark - init

- (void)configureArchitecture{
    
    [super configureArchitecture:YUIArchitectureTypeMVVM];
}

#pragma mark - Lifecycle

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self showPopupViewWithLoading];
    
    [self.viewModel loadData:nil];
}

- (void)configureBingding{
    
    [super configureBingding];
    
    self.dataSourceObject.modelManager = self.viewModel;
    self.mainView.tableView.delegate = self.viewManager;
    self.mainView.tableView.dataSource = self.dataSourceObject;
    self.mainView.tableView.emptyDataSetSource = self.emptyDataSetObject;
    self.mainView.tableView.emptyDataSetDelegate = self.emptyDataSetObject;
}

//#pragma mark - UITableViewDelegate
#pragma mark - ViewDelegate

#pragma mark - <QMUITableViewDelegate>

#pragma mark - <UITableViewDelegate>

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    return <#view#>;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    <#code#>
//}

#pragma mark - CustomDelegate
#pragma mark - event response
#pragma mark - private methods
#pragma mark - getters and setters

- (ExampleMVVMDataSourceObject *)dataSourceObject{
    
    if(!_dataSourceObject) {
        
        _dataSourceObject = [ExampleMVVMDataSourceObject new];
    }
    return _dataSourceObject;
}

- (ExampleMVVMEmptyDataSetDelegateObject *)emptyDataSetObject{
    
    if(!_emptyDataSetObject) {
        
        _emptyDataSetObject = [ExampleMVVMEmptyDataSetDelegateObject new];
    }
    return _emptyDataSetObject;
}

@end
