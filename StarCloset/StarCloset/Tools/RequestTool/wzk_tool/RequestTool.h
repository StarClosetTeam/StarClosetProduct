//
//  RequestTool.h
//  StarCloset
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestTool : NSObject

/**请求明星衣橱首页scrollview数据*/
+ (void)requestStarClosetDataWith:(requestBlock)blcok;

+ (void)requestDateForSouthKoreanPavilionWithBlock:(requestBlock)blcok;

@end
