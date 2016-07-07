//
//  StarMainClassModel.m
//
//  Created by Mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "StarMainClassModel.h"
#import "Data.h"


NSString *const kStarMainClassModelMessage = @"message";
NSString *const kStarMainClassModelData = @"data";


@interface StarMainClassModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StarMainClassModel

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
            self.message = [self objectOrNilForKey:kStarMainClassModelMessage fromDictionary:dict];
            self.data = [Data modelObjectWithDictionary:[dict objectForKey:kStarMainClassModelData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kStarMainClassModelMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kStarMainClassModelData];

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

    self.message = [aDecoder decodeObjectForKey:kStarMainClassModelMessage];
    self.data = [aDecoder decodeObjectForKey:kStarMainClassModelData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kStarMainClassModelMessage];
    [aCoder encodeObject:_data forKey:kStarMainClassModelData];
}

- (id)copyWithZone:(NSZone *)zone
{
    StarMainClassModel *copy = [[StarMainClassModel alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
