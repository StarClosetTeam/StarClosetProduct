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

@end



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