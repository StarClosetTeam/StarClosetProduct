//
//  Items.m
//
//  Created by Mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Items.h"
#import "Component.h"


NSString *const kItemsComponent = @"component";
NSString *const kItemsWidth = @"width";
NSString *const kItemsHeight = @"height";


@interface Items ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Items

@synthesize component = _component;
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
            self.component = [Component modelObjectWithDictionary:[dict objectForKey:kItemsComponent]];
            self.width = [self objectOrNilForKey:kItemsWidth fromDictionary:dict];
            self.height = [self objectOrNilForKey:kItemsHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.component dictionaryRepresentation] forKey:kItemsComponent];
    [mutableDict setValue:self.width forKey:kItemsWidth];
    [mutableDict setValue:self.height forKey:kItemsHeight];

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

    self.component = [aDecoder decodeObjectForKey:kItemsComponent];
    self.width = [aDecoder decodeObjectForKey:kItemsWidth];
    self.height = [aDecoder decodeObjectForKey:kItemsHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_component forKey:kItemsComponent];
    [aCoder encodeObject:_width forKey:kItemsWidth];
    [aCoder encodeObject:_height forKey:kItemsHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    Items *copy = [[Items alloc] init];
    
    if (copy) {

        copy.component = [self.component copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
