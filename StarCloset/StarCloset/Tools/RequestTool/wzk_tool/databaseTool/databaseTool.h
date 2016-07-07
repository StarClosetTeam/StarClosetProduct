//
//  databaseTool.h
//  StarCloset
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface databaseTool : NSObject

/**创建数据库*/
+ (void)createSQlite;

/**创建明星衣橱主页顶部Scroll的数据库表*/
+ (void)createSqliteTableWithStarMainTopScrollModel;
/**根据数组来插入数据*/
+ (void)insertIntoSqliteTableWithStarMainTopScrollModelArray:(NSArray*)array;
/**根据数组查询数据*/
+ (void)selectDataFormTabelStarMainTopScrollModelWithModelBlcok:(requestBlock)block;


/*特价优惠*/
+ (void)createTabelSpecialOffer;
+ (void)insertDataToTabelSpecialOfferWithArray:(NSArray*)array;
+ (void)selectDataFormTabelSpecialOfferWithModelBlcok:(requestBlock)block;


/*各国馆数据*/
+ (void)createCountriesTable;
/**根据数组来插入数据*/
+ (void)insertIntoCountriesTableWithID:(NSInteger)ID StarMainTopScrollModelArray:(NSArray*)array;
/**查询数据,参数国家URLID*/
+ (void)selectDataFormCountriesTabelWithID:(NSInteger)ID withModelBlcok:(requestBlock)block;

/*分类数据*/
/**创建分类数据表格*/
+ (void)createClassTabelWithID:(NSInteger)ID;
/**写入分类数据*/
+ (void)insertDataToTabelClassID:(NSInteger)ID With:(NSArray*)array;
/**查询分类数据*/
+ (void)selectDataFormCalssWithID:(NSInteger)ID TabelWithModelBlcok:(requestBlock)block;

@end
