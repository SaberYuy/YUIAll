//
//  ExampleObjcRequest.m
//  YUIAll
//
//  Created by YUI on 2021/8/11.
//

#import "ExampleObjcRequest.h"

@implementation ExampleObjcRequest

//- (NSString *)requestUrl {
//
//    return @"https://api.giphy.com/v1/gifs/search?api_key=vs8HhQHqjp6LG2sou0gQAc7YnI1feyre&q=nice&limit=20";
//}

//- (id)requestArgument {
//
//    NSDictionary *dic = @{@"mobile": self.mobile,
//                          @"vcode": self.vcode};
//    return [dic copy];
//}

//- (YTKRequestMethod)requestMethod {
//
//    return YTKRequestMethodGET;
//}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.name = @"ExampleObjcRequest";
        
        self.rootURLStr = @"https://api.giphy.com";
//        self.prefixRequestURLStr = @"/lifems";
        self.requestURLStr = @"/v1/gifs/search?api_key=vs8HhQHqjp6LG2sou0gQAc7YnI1feyre&q=nice&limit=20";
    }
    
    return self;
}

//- (id)requestArgument {
//    
//    NSDictionary *dic = @{
//    };
//    
//    return [dic copy];
//}

- (YTKRequestMethod)requestMethod {
    
    return YTKRequestMethodGET;
}


@end
