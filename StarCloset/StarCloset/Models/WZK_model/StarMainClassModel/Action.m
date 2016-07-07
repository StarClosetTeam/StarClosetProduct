//
//  Action.m
//
//  Created by Mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Action.h"


NSString *const kActionActionType = @"actionType";
NSString *const kActionHeight = @"height";
NSString *const kActionSource = @"source";
NSString *const kActionId = @"id";
NSString *const kActionWidth = @"width";
NSString *const kActionSourceId = @"sourceId";
NSString *const kActionTrackValue = @"trackValue";
NSString *const kActionType = @"type";
NSString *const kActionCollectionCount = @"collectionCount";
NSString *const kActionMainImage = @"main_image";


@interface Action ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Action

@synthesize actionType = _actionType;
@synthesize height = _height;
@synthesize source = _source;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize width = _width;
@synthesize sourceId = _sourceId;
@synthesize trackValue = _trackValue;
@synthesize type = _type;
@synthesize collectionCount = _collectionCount;
@synthesize mainImage = _mainImage;


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
            self.actionType = [self objectOrNilForKey:kActionActionType fromDictionary:dict];
            self.height = [self objectOrNilForKey:kActionHeight fromDictionary:dict];
            self.source = [self objectOrNilForKey:kActionSource fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kActionId fromDictionary:dict];
            self.width = [self objectOrNilForKey:kActionWidth fromDictionary:dict];
            self.sourceId = [self objectOrNilForKey:kActionSourceId fromDictionary:dict];
            self.trackValue = [self objectOrNilForKey:kActionTrackValue fromDictionary:dict];
            self.type = [self objectOrNilForKey:kActionType fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kActionCollectionCount fromDictionary:dict];
            self.mainImage = [[self objectOrNilForKey:kActionMainImage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kActionActionType];
    [mutableDict setValue:self.height forKey:kActionHeight];
    [mutableDict setValue:self.source forKey:kActionSource];
    [mutableDict setValue:self.actionIdentifier forKey:kActionId];
    [mutableDict setValue:self.width forKey:kActionWidth];
    [mutableDict setValue:self.sourceId forKey:kActionSourceId];
    [mutableDict setValue:self.trackValue forKey:kActionTrackValue];
    [mutableDict setValue:self.type forKey:kActionType];
    [mutableDict setValue:self.collectionCount forKey:kActionCollectionCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mainImage] forKey:kActionMainImage];

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

    self.actionType = [aDecoder decodeObjectForKey:kActionActionType];
    self.height = [aDecoder decodeObjectForKey:kActionHeight];
    self.source = [aDecoder decodeObjectForKey:kActionSource];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kActionId];
    self.width = [aDecoder decodeObjectForKey:kActionWidth];
    self.sourceId = [aDecoder decodeObjectForKey:kActionSourceId];
    self.trackValue = [aDecoder decodeObjectForKey:kActionTrackValue];
    self.type = [aDecoder decodeObjectForKey:kActionType];
    self.collectionCount = [aDecoder decodeObjectForKey:kActionCollectionCount];
    self.mainImage = [aDecoder decodeDoubleForKey:kActionMainImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kActionActionType];
    [aCoder encodeObject:_height forKey:kActionHeight];
    [aCoder encodeObject:_source forKey:kActionSource];
    [aCoder encodeObject:_actionIdentifier forKey:kActionId];
    [aCoder encodeObject:_width forKey:kActionWidth];
    [aCoder encodeObject:_sourceId forKey:kActionSourceId];
    [aCoder encodeObject:_trackValue forKey:kActionTrackValue];
    [aCoder encodeObject:_type forKey:kActionType];
    [aCoder encodeObject:_collectionCount forKey:kActionCollectionCount];
    [aCoder encodeDouble:_mainImage forKey:kActionMainImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    Action *copy = [[Action alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.sourceId = [self.sourceId copyWithZone:zone];
        copy.trackValue = [self.trackValue copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.mainImage = self.mainImage;
    }
    
    return copy;
}


@end
