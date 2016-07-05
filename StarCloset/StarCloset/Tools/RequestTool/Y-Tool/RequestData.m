//
//  RequestData.m
//  StarCloset
//
//  Created by student on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "RequestData.h"

@implementation RequestData

+(void)getCollocationNewestDataWithURL:(NSString *)URL withBlock:(void(^)(NSMutableArray * array))dataBlock{
    
    NSMutableArray *dataArr=@[].mutableCopy;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/lpain",@"application/json", nil];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic:%@",dic);
        NSArray *arr=dic[@"data"][@"items"];
        for (NSDictionary *itemsDic in arr) {
        
            RequestDataModel *model=[RequestDataModel modelWithDictionary:itemsDic];
            [dataArr addObject:model];
        }
        if (dataBlock) {
            dataBlock(dataArr);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (dataBlock) {
            dataBlock(nil);
        }
        NSLog(@"---%@",error);
    }];
}

@end
