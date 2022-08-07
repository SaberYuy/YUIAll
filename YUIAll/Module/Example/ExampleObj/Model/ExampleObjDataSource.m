//
//  ExampleObjDataSource.m
//  YUIAll
//
//  Created by YUI on 2022/3/14.
//

#import "ExampleObjDataSource.h"

#import "ExampleObjTableViewCell.h"
#import "SDWebImage.h"

@implementation ExampleObjDataSource

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return ceilf(self.modelManager.datas.count / 2);
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ExampleObjTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExampleObjTableViewCellID"];
    
    if (!cell) {
        
        cell = [[ExampleObjTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ExampleObjTableViewCellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //读取gif图片数据
    
    NSData *gifData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://photocdn.sohu.com/20151214/mp48444247_1450092561460_10.gif"]];
//         = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"http://photocdn.sohu.com/20151214/mp48444247_1450092561460_10.gif" ofType:@"gif"]];
        cell.aWV.userInteractionEnabled = NO;
        //载入gif数据
        [cell.aWV loadData:gifData MIMEType:@"image/gif" characterEncodingName:@"UTF-8" baseURL:[NSURL URLWithString:@"http://photocdn.sohu.com/20151214/mp48444247_1450092561460_10.gif"]];
        //视图加入此gif控件
//        [self.view addSubview:imageWebView];
//    }
//
//    [cell.aIV sd_setImageWithURL:[NSURL URLWithString:@"http://photocdn.sohu.com/20151214/mp48444247_1450092561460_10.gif"]];
    
//    // 方法二 sd_setImageWithURL下载
//    SDWebImageOptions opt = SDWebImageRetryFailed | SDWebImageAvoidAutoSetImage;
//    [cell.aIV sd_setImageWithURL:[NSURL URLWithString:self.modelManager.datas[indexPath.row].url]
//                 placeholderImage:nil
//                          options:opt
//                        completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//
//        if (image.images && image.images.count) {
//
//
//            [[SDImageCache sharedImageCache] storeImage:image forKey:imageURL.absoluteString completion:^{
//
//                NSData *data = [NSData dataWithContentsOfFile:imageURL.absoluteString];
//                UIImage *gifImage = [UIImage sd_imageWithGIFData:data];
//                cell.aIV.image = gifImage;
//            }];
//        }
//    }];
    
    return cell;
}

@end
