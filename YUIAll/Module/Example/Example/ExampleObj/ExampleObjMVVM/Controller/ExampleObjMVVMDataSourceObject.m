//
//  ExampleObjMVVMDataSourceObject.m
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import "ExampleObjMVVMDataSourceObject.h"

#import "ExampleObjTableViewCell.h"
#import "SDWebImage.h"

@implementation ExampleObjMVVMDataSourceObject

static NSString * const kExampleObjTableViewCellID = @"ExampleObjTableViewCell";

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _modelManager.datas.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ExampleObjTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExampleObjTableViewCellID];
    
    if (!cell) {
        cell = [[ExampleObjTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kExampleObjTableViewCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
