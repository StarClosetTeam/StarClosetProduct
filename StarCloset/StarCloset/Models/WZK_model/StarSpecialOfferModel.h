//
//  StarSpecialOfferModel.h
//  StarCloset
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarSpecialOfferModel : NSObject

@property (copy, nonatomic) NSString * activity_flag;
@property (copy, nonatomic) NSString * activity_time;
@property (copy, nonatomic) NSString * end_time;
@property (copy, nonatomic) NSString * img_index;
@property (copy, nonatomic) NSString * start_time;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

+ (instancetype)createModelWithDictionary:(NSDictionary*)dictionary;

- (instancetype)initWithFMResultSet:(FMResultSet*)aSet;

+ (instancetype)createModelWithFMResultSet:(FMResultSet*)aSet;
@end
