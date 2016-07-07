//
//  Component.m
//
//  Created by Mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Component.h"
#import "Action.h"


NSString *const kComponentId = @"id";
NSString *const kComponentTrackValue = @"trackValue";
NSString *const kComponentDescription = @"description";
NSString *const kComponentNationalFlag = @"nationalFlag";
NSString *const kComponentPublishDate = @"publish_date";
NSString *const kComponentPicUrl = @"picUrl";
NSString *const kComponentEventIcon = @"eventIcon";
NSString *const kComponentStateMessage = @"stateMessage";
NSString *const kComponentComponentType = @"componentType";
NSString *const kComponentAction = @"action";
NSString *const kComponentPrice = @"price";
NSString *const kComponentCollectionCount = @"collectionCount";
NSString *const kComponentOriginPrice = @"origin_price";
NSString *const kComponentSales = @"sales";
NSString *const kComponentCountry = @"country";


@interface Component ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Component

@synthesize componentIdentifier = _componentIdentifier;
@synthesize trackValue = _trackValue;
@synthesize componentDescription = _componentDescription;
@synthesize nationalFlag = _nationalFlag;
@synthesize publishDate = _publishDate;
@synthesize picUrl = _picUrl;
@synthesize eventIcon = _eventIcon;
@synthesize stateMessage = _stateMessage;
@synthesize componentType = _componentType;
@synthesize action = _action;
@synthesize price = _price;
@synthesize collectionCount = _collectionCount;
@synthesize originPrice = _originPrice;
@synthesize sales = _sales;
@synthesize country = _country;


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
            self.componentIdentifier = [self objectOrNilForKey:kComponentId fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kComponentTrackValue fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kComponentDescription fromDictionary:dict];
            self.nationalFlag = [self objectOrNilForKey:kComponentNationalFlag fromDictionary:dict];
            self.publishDate = [self objectOrNilForKey:kComponentPublishDate fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kComponentPicUrl fromDictionary:dict];
            self.eventIcon = [self objectOrNilForKey:kComponentEventIcon fromDictionary:dict];
            self.stateMessage = [self objectOrNilForKey:kComponentStateMessage fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kComponentComponentType fromDictionary:dict];
            self.action = [Action modelObjectWithDictionary:[dict objectForKey:kComponentAction]];
            self.price = [self objectOrNilForKey:kComponentPrice fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kComponentCollectionCount fromDictionary:dict];
            self.originPrice = [self objectOrNilForKey:kComponentOriginPrice fromDictionary:dict];
            self.sales = [self objectOrNilForKey:kComponentSales fromDictionary:dict];
            self.country = [self objectOrNilForKey:kComponentCountry fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.componentIdentifier forKey:kComponentId];
    [mutableDict setValue:self.trackValue forKey:kComponentTrackValue];
    [mutableDict setValue:self.componentDescription forKey:kComponentDescription];
    [mutableDict setValue:self.nationalFlag forKey:kComponentNationalFlag];
    [mutableDict setValue:self.publishDate forKey:kComponentPublishDate];
    [mutableDict setValue:self.picUrl forKey:kComponentPicUrl];
    [mutableDict setValue:self.eventIcon forKey:kComponentEventIcon];
    [mutableDict setValue:self.stateMessage forKey:kComponentStateMessage];
    [mutableDict setValue:self.componentType forKey:kComponentComponentType];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kComponentAction];
    [mutableDict setValue:self.price forKey:kComponentPrice];
    [mutableDict setValue:self.collectionCount forKey:kComponentCollectionCount];
    [mutableDict setValue:self.originPrice forKey:kComponentOriginPrice];
    [mutableDict setValue:self.sales forKey:kComponentSales];
    [mutableDict setValue:self.country forKey:kComponentCountry];

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

    self.componentIdentifier = [aDecoder decodeObjectForKey:kComponentId];
    self.trackValue = [aDecoder decodeObjectForKey:kComponentTrackValue];
    self.componentDescription = [aDecoder decodeObjectForKey:kComponentDescription];
    self.nationalFlag = [aDecoder decodeObjectForKey:kComponentNationalFlag];
    self.publishDate = [aDecoder decodeObjectForKey:kComponentPublishDate];
    self.picUrl = [aDecoder decodeObjectForKey:kComponentPicUrl];
    self.eventIcon = [aDecoder decodeObjectForKey:kComponentEventIcon];
    self.stateMessage = [aDecoder decodeObjectForKey:kComponentStateMessage];
    self.componentType = [aDecoder decodeObjectForKey:kComponentComponentType];
    self.action = [aDecoder decodeObjectForKey:kComponentAction];
    self.price = [aDecoder decodeObjectForKey:kComponentPrice];
    self.collectionCount = [aDecoder decodeObjectForKey:kComponentCollectionCount];
    self.originPrice = [aDecoder decodeObjectForKey:kComponentOriginPrice];
    self.sales = [aDecoder decodeObjectForKey:kComponentSales];
    self.country = [aDecoder decodeObjectForKey:kComponentCountry];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_componentIdentifier forKey:kComponentId];
    [aCoder encodeObject:_trackValue forKey:kComponentTrackValue];
    [aCoder encodeObject:_componentDescription forKey:kComponentDescription];
    [aCoder encodeObject:_nationalFlag forKey:kComponentNationalFlag];
    [aCoder encodeObject:_publishDate forKey:kComponentPublishDate];
    [aCoder encodeObject:_picUrl forKey:kComponentPicUrl];
    [aCoder encodeObject:_eventIcon forKey:kComponentEventIcon];
    [aCoder encodeObject:_stateMessage forKey:kComponentStateMessage];
    [aCoder encodeObject:_componentType forKey:kComponentComponentType];
    [aCoder encodeObject:_action forKey:kComponentAction];
    [aCoder encodeObject:_price forKey:kComponentPrice];
    [aCoder encodeObject:_collectionCount forKey:kComponentCollectionCount];
    [aCoder encodeObject:_originPrice forKey:kComponentOriginPrice];
    [aCoder encodeObject:_sales forKey:kComponentSales];
    [aCoder encodeObject:_country forKey:kComponentCountry];
}

- (id)copyWithZone:(NSZone *)zone
{
    Component *copy = [[Component alloc] init];
    
    if (copy) {

        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
        copy.nationalFlag = [self.nationalFlag copyWithZone:zone];
        copy.publishDate = [self.publishDate copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.eventIcon = [self.eventIcon copyWithZone:zone];
        copy.stateMessage = [self.stateMessage copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.originPrice = [self.originPrice copyWithZone:zone];
        copy.sales = [self.sales copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
    }
    
    return copy;
}


@end
