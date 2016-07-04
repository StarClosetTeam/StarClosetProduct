//
//  StarMainTopScrollModel.h
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarMainTopScrollModel : NSObject

@property (copy, nonatomic) NSString * title;
@property (copy, nonatomic) NSString * picUrl;
@property (copy, nonatomic) NSString * origin_price;
@property (copy, nonatomic) NSString * price;
@property (assign, nonatomic) CGFloat  height;
@property (assign, nonatomic) CGFloat  width;


- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

+ (instancetype)createModelWithDictionary:(NSDictionary*)dictionary;

@end
