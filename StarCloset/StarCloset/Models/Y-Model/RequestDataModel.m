//
//  RequestDataModel.m
//  StarCloset
//
//  Created by student on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "RequestDataModel.h"

@implementation RequestDataModel

-(instancetype)initModelWithDictionary:(NSDictionary *)dic{
    if ([super init]) {
        self.width=[dic[@"width"] integerValue];
        self.height=[dic[@"height"] integerValue];
        self.picurl=dic[@"component"][@"picUrl"];
        self.detail=dic[@"component"][@"description"];
        self.collectionCount=[dic[@"component"][@"collectionCount"] integerValue];
        self.itemsCount=[dic[@"component"][@"itemsCount"]integerValue];
    }
    return self;
}

+(instancetype)modelWithDictionary:(NSDictionary *)dic{
    return [[self alloc]initModelWithDictionary:dic];
}
@end
