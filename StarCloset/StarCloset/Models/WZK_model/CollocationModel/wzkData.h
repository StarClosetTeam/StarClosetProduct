//
//  wzkData.h
//
//  Created by Mac  on 16/7/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface wzkData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSString *appApi;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
