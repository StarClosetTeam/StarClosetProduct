//
//  wzkCollocationModel.m
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "wzkCollocationModel.h"
#import "wzkData.h"


NSString *const kwzkCollocationModelMessage = @"message";
NSString *const kwzkCollocationModelData = @"data";


@interface wzkCollocationModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation wzkCollocationModel

@synthesize message = _message;
@synthesize data = _data;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.message = [self objectOrNilForKey:kwzkCollocationModelMessage fromDictionary:dict];
            self.data = [wzkData modelObjectWithDictionary:[dict objectForKey:kwzkCollocationModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kwzkCollocationModelMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kwzkCollocationModelData];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.message = [aDecoder decodeObjectForKey:kwzkCollocationModelMessage];
    self.data = [aDecoder decodeObjectForKey:kwzkCollocationModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kwzkCollocationModelMessage];
    [aCoder encodeObject:_data forKey:kwzkCollocationModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    wzkCollocationModel *copy = [[wzkCollocationModel alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
