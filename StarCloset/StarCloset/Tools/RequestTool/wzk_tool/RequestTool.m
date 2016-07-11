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
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/lpain",@"application/json",@"text/html", nil];
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
//特价优惠请求
+ (void)requestDataForSpecialOfferWithBlcok:(requestBlock)block
{
    [self shareRequestManeger];
    
    [_manager GET:SpecialOfferURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

            NSArray * componentArray = dictionary[@"response"][@"data"][@"items"];
            NSMutableArray * modelArray = [NSMutableArray array];
            for (NSDictionary * dic  in componentArray) {
                StarSpecialOfferModel * model = [StarSpecialOfferModel createModelWithDictionary:dic[@"component"]];
                
                [modelArray addObject:model];
            }
            if (block) {
                block(modelArray);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KSLog(@"%@",error);
    }];
}


//韩国馆请求数据
+ (void)requestDateForFindLibraryWithLibraryID:(NSInteger)libraryID WithBlock:(requestBlock)blcok
{
    [self shareRequestManeger];
    
    [_manager GET:SouthKoreanPavilion(libraryID) parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray * modelArray = [NSMutableArray array];
//            KSLog(@"%@",dictionary);
            /*馆名、品牌、图片、库存*/
            NSArray * array = @[@"region_name",@"region_brands",@"region_pictures",@"region_skus"];
            
            for (NSString * name in array) {
                NSArray * modelArr = [self processingDataWithDataArray:dictionary[@"data"][name]];
                [modelArray addObject:modelArr];
            }

            if (blcok) {
                blcok(modelArray);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KSLog(@"%@",error);
    }];
}
//处理数据
+ (NSArray*)processingDataWithDataArray:(NSArray*)dataArray
{
    NSMutableArray * modelArray = [NSMutableArray array];
    for (NSDictionary * dic in dataArray) {
        StarMainTopScrollModel * model = [StarMainTopScrollModel createModelWithDictionary:dic[@"component"]];
        [modelArray addObject:model];
    }
    return modelArray;
}

/*请求分类数据*/
+ (void)requestDataForClassificationWithID:(NSInteger)ID withRequestBlcok:(requestBlock)block
{
    [self shareRequestManeger];

    [_manager GET:ClassificationURL(ID)  parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray * ClassificationDataArray = dictionary[@"data"][@"items"];
            NSMutableArray * classifcationModelArray = [NSMutableArray array];
            for (NSDictionary * dic in ClassificationDataArray) {
                StarMainClassificationModel * model = [StarMainClassificationModel createModelWithDictionary:dic];
                [classifcationModelArray addObject:model];
//                KSLog(@"%@",dic);
            }
//            StarMainClassModel * model = [StarMainClassModel modelObjectWithDictionary:dictionary];
            
//            KSLog(@"%ld>>>>>232",model.data.items.count,model.data);
            if (block) {
                block(classifcationModelArray);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KSLog(@"%@",error);
    }];
    
}

#pragma mark - 搭配界面的请求

+ (void)requestdataForCollocationVCWithURL:(NSString*)URL withRequestBlock:(requestBlock)block
{
    [self shareRequestManeger];
    [_manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


@end
