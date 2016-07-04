//
//  StarMainClassificationModel.h
//  StarCloset
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>
@class componentModel;

@interface StarMainClassificationModel : NSObject

@property (assign, nonatomic) CGFloat  height;
@property (assign, nonatomic) CGFloat  width;
@property (strong, nonatomic) componentModel * model;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

+ (instancetype)createModelWithDictionary:(NSDictionary*)dictionary;


@end



@interface componentModel : NSObject

@property (copy, nonatomic) NSString * country;
@property (copy, nonatomic) NSString * Description;//字典key :description
@property (copy, nonatomic) NSString * ID; //字典key :id
@property (copy, nonatomic) NSString * origin_price;
@property (copy, nonatomic) NSString * picUrl;
@property (copy, nonatomic) NSString * price;
@property (copy, nonatomic) NSString * publish_date;
@property (copy, nonatomic) NSString * sales;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

+ (instancetype)createModelWithDictionary:(NSDictionary*)dictionary;


@end
