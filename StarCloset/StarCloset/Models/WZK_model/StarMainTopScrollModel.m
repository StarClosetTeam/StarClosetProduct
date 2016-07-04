//
//  StarMainTopScrollModel.m
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "StarMainTopScrollModel.h"

@implementation StarMainTopScrollModel

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {

        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (instancetype)createModelWithDictionary:(NSDictionary*)dictionary
{

    return [[self alloc]initWithDictionary:dictionary];
}

//重写找不到对应属性方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
