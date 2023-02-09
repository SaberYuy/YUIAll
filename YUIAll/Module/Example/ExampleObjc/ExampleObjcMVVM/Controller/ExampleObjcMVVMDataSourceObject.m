//
//  ExampleObjcMVVMDataSourceObject.m
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import "ExampleObjcMVVMDataSourceObject.h"

#import "ExampleObjcTableViewCell.h"
#import "SDWebImage.h"

@implementation ExampleObjcMVVMDataSourceObject

static NSString * const kExampleObjcTableViewCellID = @"ExampleObjcTableViewCell";

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _modelManager.datas.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ExampleObjcTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleObjcTableViewCellID];
    
    if (!cell) {
        cell = [[ExampleObjcTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kExampleObjcTableViewCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
