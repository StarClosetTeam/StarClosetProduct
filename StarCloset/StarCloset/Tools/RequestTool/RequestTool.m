//
//  RequestTool.m
//  StarCloset
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "RequestTool.h"

static AFHTTPSessionManager * _manager;

@implementation RequestTool


+ (AFHTTPSessionManager*)shareRequestManeger
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/lpain",@"application/json", nil];
        return _manager;
    }
    return _manager;
}

/*请求Sroll数据*/
+ (void)requestStarClosetDataWith:(requestBlcok)blcok
{
    [self shareRequestManeger];
    
    [_manager GET:ScrollViewURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
