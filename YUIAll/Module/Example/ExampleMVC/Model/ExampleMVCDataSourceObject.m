//
//  ExampleMVCDataSourceObject.m
//  YUIAll
//
//  Created by YUI on 2021/10/28.
//

#import "ExampleMVCDataSourceObject.h"

#import "ExampleMVCTableViewCell.h"

@implementation ExampleMVCDataSourceObject

static NSString * const kExampleMVCTableViewCellID = @"exampleMVC";

#pragma mark - <QMUITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    ExampleMVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleMVCTableViewCellID];

    if (!cell) {

        cell = [[ExampleMVCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kExampleMVCTableViewCellID];
    }

    return cell;
}

@end
