//
//  wzkAction.h
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface wzkAction : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *actionType;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *actionIdentifier;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *normalPicUrl;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *collectionCount;
@property (nonatomic, strong) NSString *commentCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
