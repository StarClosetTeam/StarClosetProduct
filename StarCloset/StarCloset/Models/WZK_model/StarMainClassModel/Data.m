//
//  Data.m
//
//  Created by Mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "Items.h"


NSString *const kDataItems = @"items";
NSString *const kDataFlag = @"flag";
NSString *const kDataAppApi = @"appApi";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

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
    NSObject *receivedItems = [dict objectForKey:kDataItems];
    NSMutableArray *parsedItems = [NSMutableArray array];
    if ([receivedItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItems addObject:[Items modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItems isKindOfClass:[NSDictionary class]]) {
       [parsedItems addObject:[Items modelObjectWithDictionary:(NSDictionary *)receivedItems]];
    }

    self.items = [NSArray arrayWithArray:parsedItems];
            self.flag = [self objectOrNilForKey:kDataFlag fromDictionary:dict];
            self.appApi = [self objectOrNilForKey:kDataAppApi fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kDataItems];
    [mutableDict setValue:self.flag forKey:kDataFlag];
    [mutableDict setValue:self.appApi forKey:kDataAppApi];

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

    self.items = [aDecoder decodeObjectForKey:kDataItems];
    self.flag = [aDecoder decodeObjectForKey:kDataFlag];
    self.appApi = [aDecoder decodeObjectForKey:kDataAppApi];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kDataItems];
    [aCoder encodeObject:_flag forKey:kDataFlag];
    [aCoder encodeObject:_appApi forKey:kDataAppApi];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.flag = [self.flag copyWithZone:zone];
        copy.appApi = [self.appApi copyWithZone:zone];
    }
    
    return copy;
}


@end
