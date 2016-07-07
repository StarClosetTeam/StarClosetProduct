//
//  StarMainClassificationModel.m
//  StarCloset
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "StarMainClassificationModel.h"

@implementation StarMainClassificationModel

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dictionary];
        self.needW = (kMainBoundsW-30)/2;
        self.needH = _needW*_height/_width;
    }
    return self;
}
+ (instancetype)createModelWithDictionary:(NSDictionary*)dictionary
{
    return [[self alloc]initWithDictionary:dictionary];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"component"]) {
        self.model = [componentModel createModelWithDictionary:value];
    }else
    {
        [super setValue:value forKey:key];
    }
}


/*
 @property (copy, nonatomic) NSString * country;
 @property (copy, nonatomic) NSString * Description;//字典key :description
 @property (copy, nonatomic) NSString * ID; //字典key :id
 @property (copy, nonatomic) NSString * origin_price;
 @property (copy, nonatomic) NSString * picUrl;
 @property (copy, nonatomic) NSString * price;
 @property (copy, nonatomic) NSString * publish_date;
 @property (copy, nonatomic) NSString * sales;
 @property (copy, nonatomic) NSString * nationalFlag;
 */
- (instancetype)initWithFMResult:(FMResultSet*)aSet
{
    if (self = [super init]) {
        self.needW = [aSet intForColumn:@"needW"];
        self.needH = [aSet intForColumn:@"needW"];
        self.model = [[componentModel alloc]init];
        self.model.country = [aSet stringForColumn:@"country"];
        self.model.Description = [aSet stringForColumn:@"Description"];
        self.model.ID = [aSet stringForColumn:@"modelID"];
        self.model.origin_price = [aSet stringForColumn:@"origin_price"];
        self.model.picUrl = [aSet stringForColumn:@"picUrl"];
        self.model.price = [aSet stringForColumn:@"price"];
        self.model.publish_date = [aSet stringForColumn:@"publish_date"];
        self.model.sales = [aSet stringForColumn:@"salest"];
        self.model.nationalFlag = [aSet stringForColumn:@"nationalFlag"];
    }
    return self;
}

+(instancetype)createModelWithFMResult:(FMResultSet*)aSet
{
    return [[self alloc]initWithFMResult:aSet];
}





@end


/**属性model*/
@implementation componentModel

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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }else if ([key isEqualToString:@"description"]){
        self.Description = value;
    }else
    {
        [super setValue:value forKey:key];
    }
}

@end