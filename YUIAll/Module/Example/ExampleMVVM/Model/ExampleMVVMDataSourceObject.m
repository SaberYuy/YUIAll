//
//  ExampleMVVMDataSourceObject.m
//  YUIAll
//
//  Created by YUI on 2021/10/28.
//

#import "ExampleMVVMDataSourceObject.h"

#import "ExampleMVVMTableViewCell.h"

@implementation ExampleMVVMDataSourceObject

static NSString * const kExampleMVVMTableViewCellID = @"exampleMVVM";

#pragma mark - <QMUITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    ExampleMVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleMVVMTableViewCellID];

    if (!cell) {

        cell = [[ExampleMVVMTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kExampleMVVMTableViewCellID];
    }

    return cell;
}

@end
