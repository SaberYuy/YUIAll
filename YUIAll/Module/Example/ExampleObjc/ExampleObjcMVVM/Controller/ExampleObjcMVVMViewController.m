//
//  ExampleObjcMVVMViewController.m
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

#import "ExampleObjcMVVMViewController.h"

#import "ExampleObjcMVVMViewModel.h"
#import "ExampleObjcMVVMDataSourceObject.h"
#import "ExampleObjcMVVMEmptyDataSetDelegateObject.h"
#import "ExampleObjcMVVMView.h"
#import "ExampleObjcMVVMViewManager.h"
//
//#import "ExampleMVCViewController.h"


@interface ExampleObjcMVVMViewController ()

@property (nonatomic, strong) ExampleObjcMVVMView *containerView;
@property (nonatomic, strong) ExampleObjcMVVMViewModel *viewModel;
@property (nonatomic, strong) ExampleObjcMVVMViewManager *viewManager;
@property (nonatomic, strong) ExampleObjcMVVMDataSourceObject *dataSourceObject;
@property (nonatomic, strong) ExampleObjcMVVMEmptyDataSetDelegateObject *emptyDataSetObject;

@end

@implementation ExampleObjcMVVMViewController

@dynamic containerView;
@dynamic viewModel;
@dynamic viewManager;

#pragma mark - init

- (void)configureArchitecture{
    
    [super configureArchitecture: YUIArchitectureTypeMVVM];
}
//
//- (void)didInitialize{
//
//    [super didInitialize];
//
//    [self configureObserver];
//}
//
//- (void)configureObserver{
//
//    [super configureObserver];
//
//    __weak typeof(self) weakSelf = self;
//    [self.KVOController observe:self keyPath:FBKVOKeyPath(self.viewModel.datas) options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
//
//        __strong __typeof(weakSelf)strongSelf = weakSelf;
//        [strongSelf.ContainerView.tableView reloadData];
//    }];
//}

#pragma mark - Lifecycle

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.viewModel loadData:nil];
}

- (void)configureBingding{

    [super configureBingding];
    
    [self.containerView.aBtn addTarget:self.viewManager action:@selector(tapA:) forControlEvents:UIControlEventTouchDown];

    self.dataSourceObject.modelManager = self.viewModel;
    self.containerView.tableView.delegate = self.viewManager;
    self.containerView.tableView.dataSource = self.dataSourceObject;
    self.containerView.tableView.emptyDataSetSource = self.emptyDataSetObject;
    self.containerView.tableView.emptyDataSetDelegate = self.emptyDataSetObject;
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

- (ExampleObjcMVVMDataSourceObject *)dataSourceObject {

    if(!_dataSourceObject) {

        _dataSourceObject = [ExampleObjcMVVMDataSourceObject new];
    }
    return _dataSourceObject;
}

- (ExampleObjcMVVMEmptyDataSetDelegateObject *)emptyDataSetObject{
    
    if(!_emptyDataSetObject) {
        
        _emptyDataSetObject = [ExampleObjcMVVMEmptyDataSetDelegateObject new];
    }
    return _emptyDataSetObject;
}

@end
