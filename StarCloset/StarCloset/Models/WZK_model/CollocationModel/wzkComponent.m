//
//  wzkComponent.m
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "wzkComponent.h"
#import "wzkAction.h"


NSString *const kwzkComponentAction = @"action";
NSString *const kwzkComponentHasVideo = @"hasVideo";
NSString *const kwzkComponentComponentType = @"componentType";
NSString *const kwzkComponentId = @"id";
NSString *const kwzkComponentItemsCount = @"itemsCount";
NSString *const kwzkComponentPicUrl = @"picUrl";
NSString *const kwzkComponentDescription = @"description";
NSString *const kwzkComponentCollectionCount = @"collectionCount";
NSString *const kwzkComponentCommentCount = @"commentCount";


@interface wzkComponent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation wzkComponent

@synthesize action = _action;
@synthesize hasVideo = _hasVideo;
@synthesize componentType = _componentType;
@synthesize componentIdentifier = _componentIdentifier;
@synthesize itemsCount = _itemsCount;
@synthesize picUrl = _picUrl;
@synthesize componentDescription = _componentDescription;
@synthesize collectionCount = _collectionCount;
@synthesize commentCount = _commentCount;


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
            self.action = [wzkAction modelObjectWithDictionary:[dict objectForKey:kwzkComponentAction]];
            self.hasVideo = [self objectOrNilForKey:kwzkComponentHasVideo fromDictionary:dict];
            self.componentType = [self objectOrNilForKey:kwzkComponentComponentType fromDictionary:dict];
            self.componentIdentifier = [self objectOrNilForKey:kwzkComponentId fromDictionary:dict];
            self.itemsCount = [self objectOrNilForKey:kwzkComponentItemsCount fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kwzkComponentPicUrl fromDictionary:dict];
            self.componentDescription = [self objectOrNilForKey:kwzkComponentDescription fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kwzkComponentCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kwzkComponentCommentCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kwzkComponentAction];
    [mutableDict setValue:self.hasVideo forKey:kwzkComponentHasVideo];
    [mutableDict setValue:self.componentType forKey:kwzkComponentComponentType];
    [mutableDict setValue:self.componentIdentifier forKey:kwzkComponentId];
    [mutableDict setValue:self.itemsCount forKey:kwzkComponentItemsCount];
    [mutableDict setValue:self.picUrl forKey:kwzkComponentPicUrl];
    [mutableDict setValue:self.componentDescription forKey:kwzkComponentDescription];
    [mutableDict setValue:self.collectionCount forKey:kwzkComponentCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kwzkComponentCommentCount];

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

    self.action = [aDecoder decodeObjectForKey:kwzkComponentAction];
    self.hasVideo = [aDecoder decodeObjectForKey:kwzkComponentHasVideo];
    self.componentType = [aDecoder decodeObjectForKey:kwzkComponentComponentType];
    self.componentIdentifier = [aDecoder decodeObjectForKey:kwzkComponentId];
    self.itemsCount = [aDecoder decodeObjectForKey:kwzkComponentItemsCount];
    self.picUrl = [aDecoder decodeObjectForKey:kwzkComponentPicUrl];
    self.componentDescription = [aDecoder decodeObjectForKey:kwzkComponentDescription];
    self.collectionCount = [aDecoder decodeObjectForKey:kwzkComponentCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kwzkComponentCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_action forKey:kwzkComponentAction];
    [aCoder encodeObject:_hasVideo forKey:kwzkComponentHasVideo];
    [aCoder encodeObject:_componentType forKey:kwzkComponentComponentType];
    [aCoder encodeObject:_componentIdentifier forKey:kwzkComponentId];
    [aCoder encodeObject:_itemsCount forKey:kwzkComponentItemsCount];
    [aCoder encodeObject:_picUrl forKey:kwzkComponentPicUrl];
    [aCoder encodeObject:_componentDescription forKey:kwzkComponentDescription];
    [aCoder encodeObject:_collectionCount forKey:kwzkComponentCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kwzkComponentCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    wzkComponent *copy = [[wzkComponent alloc] init];
    
    if (copy) {

        copy.action = [self.action copyWithZone:zone];
        copy.hasVideo = [self.hasVideo copyWithZone:zone];
        copy.componentType = [self.componentType copyWithZone:zone];
        copy.componentIdentifier = [self.componentIdentifier copyWithZone:zone];
        copy.itemsCount = [self.itemsCount copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.componentDescription = [self.componentDescription copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
    }
    
    return copy;
}


@end
