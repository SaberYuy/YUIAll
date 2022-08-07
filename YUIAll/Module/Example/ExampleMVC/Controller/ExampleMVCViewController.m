//
//  ExampleMVCViewController.m
//  YUIAll
//
//  Created by YUI on 2020/11/9.
//

#import "ExampleMVCViewController.h"

#import "ExampleMVCView.h"
#import "ExampleMVCModelManager.h"
#import "ExampleMVCDataSourceObject.h"
#import "ExampleMVCEmptyDataSetDelegateObject.h"

@interface ExampleMVCViewController ()<QMUITableViewDelegate>

@property (nonatomic, strong) ExampleMVCView *mainView;
@property (nonatomic, strong) ExampleMVCModelManager *modelManager;
@property (nonatomic, strong) ExampleMVCDataSourceObject *dataSourceObject;
@property (nonatomic, strong) ExampleMVCEmptyDataSetDelegateObject *emptyDataSetObject;

@end

@implementation ExampleMVCViewController

@dynamic mainView;
@dynamic modelManager;

#pragma mark - init

- (void)configureArchitecture{
    
    [super configureArchitecture:ArchitectureTypeMVC];
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

- (ExampleMVCDataSourceObject *)dataSourceObject{
    
    if(!_dataSourceObject){
        
        _dataSourceObject = [ExampleMVCDataSourceObject new];
    }
    return _dataSourceObject;
}

- (ExampleMVCEmptyDataSetDelegateObject *)emptyDataSetObject{
    
    if(!_emptyDataSetObject){
        
        _emptyDataSetObject = [ExampleMVCEmptyDataSetDelegateObject new];
    }
    return _emptyDataSetObject;
}

@end
