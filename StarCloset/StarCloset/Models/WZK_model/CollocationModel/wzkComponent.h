//
//  wzkComponent.h
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class wzkAction;

@interface wzkComponent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) wzkAction *action;
@property (nonatomic, strong) NSString *hasVideo;
@property (nonatomic, strong) NSString *componentType;
@property (nonatomic, strong) NSString *componentIdentifier;
@property (nonatomic, strong) NSString *itemsCount;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *componentDescription;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *commentCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
