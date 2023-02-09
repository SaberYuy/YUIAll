//
//  ExampleObjcMVCDataSourceObject.m
//  YUIAll
//
//  Created by YUI on 2021/10/28.
//

#import "ExampleObjcMVCDataSourceObject.h"

#import "ExampleObjcTableViewCell.h"

@implementation ExampleObjcMVCDataSourceObject

static NSString * const kExampleObjcTableViewCellID = @"ExampleObjcTableViewCell";

#pragma mark - <QMUITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    ExampleObjcTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleObjcTableViewCellID];

    if (!cell) {

        cell = [[ExampleObjcTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kExampleObjcTableViewCellID];
    }

    return cell;
}

@end
