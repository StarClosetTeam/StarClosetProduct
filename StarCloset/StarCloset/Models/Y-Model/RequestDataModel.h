//
//  RequestDataModel.h
//  StarCloset
//
//  Created by student on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestDataModel : NSObject

@property (assign, nonatomic)NSInteger height;
@property (assign, nonatomic)NSInteger width;
@property (copy, nonatomic)NSString *picurl;
@property (assign, nonatomic)NSInteger collectionCount;
@property (assign, nonatomic)NSInteger itemsCount;
@property (copy, nonatomic)NSString *detail;

-(instancetype)initModelWithDictionary:(NSDictionary *)dic;

+(instancetype)modelWithDictionary:(NSDictionary *)dic;

@end
