//
//  ExampleObjMVCDataSourceObject.m
//  YUIAll
//
//  Created by YUI on 2021/10/28.
//

#import "ExampleObjMVCDataSourceObject.h"

#import "ExampleObjTableViewCell.h"

@implementation ExampleObjMVCDataSourceObject

static NSString * const kExampleObjTableViewCellID = @"ExampleObjTableViewCell";

#pragma mark - <QMUITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    ExampleObjTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleObjTableViewCellID];

    if (!cell) {

        cell = [[ExampleObjTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kExampleObjTableViewCellID];
    }

    return cell;
}

@end
