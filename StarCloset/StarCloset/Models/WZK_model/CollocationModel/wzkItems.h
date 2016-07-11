//
//  wzkItems.h
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class wzkComponent;

@interface wzkItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) wzkComponent *component;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
