//
//  ExampleObjMVVMViewController.m
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

#import "ExampleObjMVVMViewController.h"

#import "ExampleObjMVVMViewModel.h"
#import "ExampleObjMVVMDataSourceObject.h"
#import "ExampleObjMVVMEmptyDataSetDelegateObject.h"
#import "ExampleObjMVVMView.h"
#import "ExampleObjMVVMViewManager.h"
//
//#import "ExampleMVCViewController.h"


@interface ExampleObjMVVMViewController ()

@property (nonatomic, strong) ExampleObjMVVMView *mainView;
@property (nonatomic, strong) ExampleObjMVVMViewModel *viewModel;
@property (nonatomic, strong) ExampleObjMVVMViewManager *viewManager;
@property (nonatomic, strong) ExampleObjMVVMDataSourceObject *dataSourceObject;
@property (nonatomic, strong) ExampleObjMVVMEmptyDataSetDelegateObject *emptyDataSetObject;

@end

@implementation ExampleObjMVVMViewController

@dynamic mainView;
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
//        [strongSelf.mainView.tableView reloadData];
//    }];
//}

#pragma mark - Lifecycle

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.viewModel loadData:nil];
}

- (void)configureBingding{

    [super configureBingding];
    
    [self.mainView.aBtn addTarget:self.viewManager action:@selector(tapA:) forControlEvents:UIControlEventTouchDown];

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

- (ExampleObjMVVMDataSourceObject *)dataSourceObject {

    if(!_dataSourceObject) {

        _dataSourceObject = [ExampleObjMVVMDataSourceObject new];
    }
    return _dataSourceObject;
}

- (ExampleObjMVVMEmptyDataSetDelegateObject *)emptyDataSetObject{
    
    if(!_emptyDataSetObject) {
        
        _emptyDataSetObject = [ExampleObjMVVMEmptyDataSetDelegateObject new];
    }
    return _emptyDataSetObject;
}

@end
