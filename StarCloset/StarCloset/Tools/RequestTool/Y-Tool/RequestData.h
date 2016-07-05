//
//  RequestData.h
//  StarCloset
//
//  Created by student on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestData : NSObject

+(void)getCollocationNewestDataWithURL:(NSString *)URL withBlock:(void(^)(NSMutableArray * array))dataBlock;

@end
