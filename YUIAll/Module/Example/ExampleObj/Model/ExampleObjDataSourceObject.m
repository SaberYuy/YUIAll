//
//  ExampleObjDataSource.m
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import "ExampleObjDataSourceObject.h"

#import "ExampleObjTableViewCell.h"
#import "SDWebImage.h"

@implementation ExampleObjDataSourceObject

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _modelManager.datas.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ExampleObjTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExampleObjTableViewCellID"];
    
    if (!cell) {
        cell = [[ExampleObjTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ExampleObjTableViewCellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
