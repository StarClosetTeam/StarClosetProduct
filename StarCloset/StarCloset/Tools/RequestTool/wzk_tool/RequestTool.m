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

//创建AFHTTPSessionManager的单例对象
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
+ (void)requestStarClosetDataWith:(requestBlock)block
{
    [self shareRequestManeger];
    
    [_manager GET:ScrollViewURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray * dataArray = dictionary[@"data"][@"items"];
        NSMutableArray * modelArray = [NSMutableArray array];
        
//        KSLog(@"%@",dataArray);
        for (NSDictionary * dic  in dataArray) {
            StarMainTopScrollModel * model = [StarMainTopScrollModel createModelWithDictionary:dic[@"component"]];
            [modelArray addObject:model];
        }
        if (block) {
            block(modelArray);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KSLog(@"%@",error);
    }];
}

+ (void)requestDateForSouthKoreanPavilionWithBlock:(requestBlock)blcok
{
    [self shareRequestManeger];
    
    [_manager GET:SouthKoreanPavilion parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            KSLog(@"%@",dictionary);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
