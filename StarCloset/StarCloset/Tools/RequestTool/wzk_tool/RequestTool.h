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
/**请求特价优惠数据*/
+ (void)requestDataForSpecialOfferWithBlcok:(requestBlock)block;
/**请求韩国馆数据*/
+ (void)requestDateForFindLibraryWithLibraryID:(NSInteger)libraryID WithBlock:(requestBlock)blcok;
/**请求分类数据*/
+ (void)requestDataForClassificationWithID:(NSInteger)ID withRequestBlcok:(requestBlock)block;

@end
