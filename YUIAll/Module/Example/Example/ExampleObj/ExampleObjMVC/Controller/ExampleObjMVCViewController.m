//
//  ExampleMVCViewController.m
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

#import "ExampleObjMVCViewController.h"

#import "ExampleObjMVCView.h"
#import "ExampleObjMVCModelManager.h"
#import "ExampleObjMVCDataSourceObject.h"
#import "ExampleObjMVCEmptyDataSetDelegateObject.h"

@interface ExampleObjMVCViewController ()<QMUITableViewDelegate>

@property (nonatomic, strong) ExampleObjMVCView *mainView;
@property (nonatomic, strong) ExampleObjMVCModelManager *modelManager;
@property (nonatomic, strong) ExampleObjMVCDataSourceObject *dataSourceObject;
@property (nonatomic, strong) ExampleObjMVCEmptyDataSetDelegateObject *emptyDataSetObject;

@end

@implementation ExampleObjMVCViewController

@dynamic mainView;
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
    self.mainView.tableView.delegate = self;
    self.mainView.tableView.dataSource = self.dataSourceObject;
    self.mainView.tableView.emptyDataSetSource = self.emptyDataSetObject;
    self.mainView.tableView.emptyDataSetDelegate = self.emptyDataSetObject;
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

- (ExampleObjMVCDataSourceObject *)dataSourceObject{
    
    if(!_dataSourceObject) {
        
        _dataSourceObject = [ExampleObjMVCDataSourceObject new];
    }
    return _dataSourceObject;
}

- (ExampleObjMVCEmptyDataSetDelegateObject *)emptyDataSetObject{
    
    if(!_emptyDataSetObject) {
        
        _emptyDataSetObject = [ExampleObjMVCEmptyDataSetDelegateObject new];
    }
    return _emptyDataSetObject;
}

@end
