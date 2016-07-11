//
//  wzkAction.m
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "wzkAction.h"


NSString *const kwzkActionActionType = @"actionType";
NSString *const kwzkActionHeight = @"height";
NSString *const kwzkActionId = @"id";
NSString *const kwzkActionWidth = @"width";
NSString *const kwzkActionNormalPicUrl = @"normalPicUrl";
NSString *const kwzkActionType = @"type";
NSString *const kwzkActionCollectionCount = @"collectionCount";
NSString *const kwzkActionCommentCount = @"commentCount";


@interface wzkAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation wzkAction

@synthesize actionType = _actionType;
@synthesize height = _height;
@synthesize actionIdentifier = _actionIdentifier;
@synthesize width = _width;
@synthesize normalPicUrl = _normalPicUrl;
@synthesize type = _type;
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
            self.actionType = [self objectOrNilForKey:kwzkActionActionType fromDictionary:dict];
            self.height = [self objectOrNilForKey:kwzkActionHeight fromDictionary:dict];
            self.actionIdentifier = [self objectOrNilForKey:kwzkActionId fromDictionary:dict];
            self.width = [self objectOrNilForKey:kwzkActionWidth fromDictionary:dict];
            self.normalPicUrl = [self objectOrNilForKey:kwzkActionNormalPicUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kwzkActionType fromDictionary:dict];
            self.collectionCount = [self objectOrNilForKey:kwzkActionCollectionCount fromDictionary:dict];
            self.commentCount = [self objectOrNilForKey:kwzkActionCommentCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.actionType forKey:kwzkActionActionType];
    [mutableDict setValue:self.height forKey:kwzkActionHeight];
    [mutableDict setValue:self.actionIdentifier forKey:kwzkActionId];
    [mutableDict setValue:self.width forKey:kwzkActionWidth];
    [mutableDict setValue:self.normalPicUrl forKey:kwzkActionNormalPicUrl];
    [mutableDict setValue:self.type forKey:kwzkActionType];
    [mutableDict setValue:self.collectionCount forKey:kwzkActionCollectionCount];
    [mutableDict setValue:self.commentCount forKey:kwzkActionCommentCount];

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

    self.actionType = [aDecoder decodeObjectForKey:kwzkActionActionType];
    self.height = [aDecoder decodeObjectForKey:kwzkActionHeight];
    self.actionIdentifier = [aDecoder decodeObjectForKey:kwzkActionId];
    self.width = [aDecoder decodeObjectForKey:kwzkActionWidth];
    self.normalPicUrl = [aDecoder decodeObjectForKey:kwzkActionNormalPicUrl];
    self.type = [aDecoder decodeObjectForKey:kwzkActionType];
    self.collectionCount = [aDecoder decodeObjectForKey:kwzkActionCollectionCount];
    self.commentCount = [aDecoder decodeObjectForKey:kwzkActionCommentCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionType forKey:kwzkActionActionType];
    [aCoder encodeObject:_height forKey:kwzkActionHeight];
    [aCoder encodeObject:_actionIdentifier forKey:kwzkActionId];
    [aCoder encodeObject:_width forKey:kwzkActionWidth];
    [aCoder encodeObject:_normalPicUrl forKey:kwzkActionNormalPicUrl];
    [aCoder encodeObject:_type forKey:kwzkActionType];
    [aCoder encodeObject:_collectionCount forKey:kwzkActionCollectionCount];
    [aCoder encodeObject:_commentCount forKey:kwzkActionCommentCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    wzkAction *copy = [[wzkAction alloc] init];
    
    if (copy) {

        copy.actionType = [self.actionType copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.actionIdentifier = [self.actionIdentifier copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.normalPicUrl = [self.normalPicUrl copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.collectionCount = [self.collectionCount copyWithZone:zone];
        copy.commentCount = [self.commentCount copyWithZone:zone];
    }
    
    return copy;
}


@end
