//
//  StarMainClassModel.h
//
//  Created by Mac  on 16/7/5
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data;

@interface StarMainClassModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) Data *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
