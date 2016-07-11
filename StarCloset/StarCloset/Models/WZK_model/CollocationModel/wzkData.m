//
//  wzkData.m
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "wzkData.h"
#import "wzkItems.h"


NSString *const kwzkDataItems = @"items";
NSString *const kwzkDataFlag = @"flag";
NSString *const kwzkDataAppApi = @"appApi";


@interface wzkData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation wzkData

@synthesize items = _items;
@synthesize flag = _flag;
@synthesize appApi = _appApi;


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
    NSObject *receivedwzkItems = [dict objectForKey:kwzkDataItems];
    NSMutableArray *parsedwzkItems = [NSMutableArray array];
    if ([receivedwzkItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedwzkItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedwzkItems addObject:[wzkItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedwzkItems isKindOfClass:[NSDictionary class]]) {
       [parsedwzkItems addObject:[wzkItems modelObjectWithDictionary:(NSDictionary *)receivedwzkItems]];
    }

    self.items = [NSArray arrayWithArray:parsedwzkItems];
            self.flag = [self objectOrNilForKey:kwzkDataFlag fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kwzkDataAppApi fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kwzkDataItems];
    [mutableDict setValue:self.flag forKey:kwzkDataFlag];
    [mutableDict setValue:self.appApi forKey:kwzkDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kwzkDataItems];
    self.flag = [aDecoder decodeObjectForKey:kwzkDataFlag];
    self.appApi = [aDecoder decodeObjectForKey:kwzkDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kwzkDataItems];
    [aCoder encodeObject:_flag forKey:kwzkDataFlag];
    [aCoder encodeObject:_appApi forKey:kwzkDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    wzkData *copy = [[wzkData alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


@end
