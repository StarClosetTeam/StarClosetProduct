//
//  wzkItems.m
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "wzkItems.h"
#import "wzkComponent.h"


NSString *const kwzkItemsComponent = @"component";
NSString *const kwzkItemsTimestamp = @"timestamp";
NSString *const kwzkItemsWidth = @"width";
NSString *const kwzkItemsHeight = @"height";


@interface wzkItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation wzkItems

@synthesize component = _component;
@synthesize timestamp = _timestamp;
@synthesize width = _width;
@synthesize height = _height;


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
            self.component = [wzkComponent modelObjectWithDictionary:[dict objectForKey:kwzkItemsComponent]];
            self.timestamp = [self objectOrNilForKey:kwzkItemsTimestamp fromDictionary:dict];
            self.width = [self objectOrNilForKey:kwzkItemsWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kwzkItemsHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.component dictionaryRepresentation] forKey:kwzkItemsComponent];
    [mutableDict setValue:self.timestamp forKey:kwzkItemsTimestamp];
    [mutableDict setValue:self.width forKey:kwzkItemsWidth];
    [mutableDict setValue:self.height forKey:kwzkItemsHeight];

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

    self.component = [aDecoder decodeObjectForKey:kwzkItemsComponent];
    self.timestamp = [aDecoder decodeObjectForKey:kwzkItemsTimestamp];
    self.width = [aDecoder decodeObjectForKey:kwzkItemsWidth];
    self.height = [aDecoder decodeObjectForKey:kwzkItemsHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_component forKey:kwzkItemsComponent];
    [aCoder encodeObject:_timestamp forKey:kwzkItemsTimestamp];
    [aCoder encodeObject:_width forKey:kwzkItemsWidth];
    [aCoder encodeObject:_height forKey:kwzkItemsHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    wzkItems *copy = [[wzkItems alloc] init];
    
    if (copy) {

        copy.component = [self.component copyWithZone:zone];
        copy.timestamp = [self.timestamp copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
