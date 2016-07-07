//
//  Items.h
//
//  Created by Mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Component;

@interface Items : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Component *component;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
