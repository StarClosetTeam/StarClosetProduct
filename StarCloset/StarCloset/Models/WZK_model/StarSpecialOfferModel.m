//
//  StarSpecialOfferModel.m
//  StarCloset
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "StarSpecialOfferModel.h"

@implementation StarSpecialOfferModel

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        /**字典key值与属性不符时，需要实现 setValue 方法*/
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
+ (instancetype)createModelWithDictionary:(NSDictionary*)dictionary
{
    /**MRC下需要添加autorelease*/
    return [[self alloc]initWithDictionary:dictionary];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (instancetype)initWithFMResultSet:(FMResultSet*)aSet
{
    if (self = [super init]) {
        self.activity_time = [aSet stringForColumn:@"activity_time"];
        self.activity_flag = [aSet stringForColumn:@"activity_flag"];
        self.img_index = [aSet stringForColumn:@"img_index"];
        self.end_time = [aSet stringForColumn:@"end_time"];
        self.start_time = [aSet stringForColumn:@"start_time"];
    }
    return self;
}

+ (instancetype)createModelWithFMResultSet:(FMResultSet*)aSet
{
    return [[self alloc]initWithFMResultSet:aSet];
}


@end
