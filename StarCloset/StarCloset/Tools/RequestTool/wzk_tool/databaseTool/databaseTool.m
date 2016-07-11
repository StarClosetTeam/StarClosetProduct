//
//  databaseTool.m
//  StarCloset
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "databaseTool.h"
#import <objc/runtime.h>

#define StarMainTopScrollTableName  @"StarMainTopScrollModel"


static FMDatabaseQueue * _queue;
@implementation databaseTool

//创建数据库
+ (void)createSQlite
{
    NSString * sqlitePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/StarCloset.sqlite"];
    KSLog(@"%@",sqlitePath);
    _queue = [FMDatabaseQueue databaseQueueWithPath:sqlitePath];
}
#pragma mark - 明星首页第一块
/**创建明星衣橱主页顶部Scroll的数据库表*/
+ (void)createSqliteTableWithStarMainTopScrollModel
{
    /*
     @property (copy, nonatomic) NSString * title;
     @property (copy, nonatomic) NSString * picUrl;
     @property (copy, nonatomic) NSString * origin_price;
     @property (copy, nonatomic) NSString * price;
     @property (assign, nonatomic) CGFloat  height;
     @property (assign, nonatomic) CGFloat  width;
     */
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"create table if not exists StarMainTopScrollModel (id integer primary key autoincrement, title text , picUrl text unique, origin_price text , price text , height  float , width float);"]];
    }];
}
/**根据数组来插入数据*/
+ (void)insertIntoSqliteTableWithStarMainTopScrollModelArray:(NSArray*)array
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        for (StarMainTopScrollModel * Model in array) {
            [db executeUpdate:[NSString stringWithFormat:@"insert into StarMainTopScrollModel (title,picUrl,origin_price,price,height,width) values ('%@','%@','%@','%@',%f,%f)",Model.title,Model.picUrl,Model.origin_price,Model.price,Model.height,Model.width]];
        }
    }];
}
/**根据数组查询数据*/
+ (void)selectDataFormTabelStarMainTopScrollModelWithModelBlcok:(requestBlock)block
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        FMResultSet * set =  [db executeQueryWithFormat:@"select * from StarMainTopScrollModel"];
        NSMutableArray * modelArray = [NSMutableArray array];
        while ([set next]) {
            StarMainTopScrollModel * model = [StarMainTopScrollModel createWithFMResultSet:set];
            [modelArray addObject:model];
        }
        if (block) {
            block(modelArray);
        }
    }];
}

#pragma mark - 明星首页第二块
+ (void)createTabelSpecialOffer
{
    /*
     @property (copy, nonatomic) NSString * activity_flag;
     @property (copy, nonatomic) NSString * activity_time;
     @property (copy, nonatomic) NSString * end_time;
     @property (copy, nonatomic) NSString * img_index;
     @property (copy, nonatomic) NSString * start_time;
     */
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"create table if not exists SpecialOffer (id integer primary key autoincrement, activity_flag text , img_index text unique, activity_time text , end_time text , start_time  text);"]];
    }];
}
/*插入数据*/
+ (void)insertDataToTabelSpecialOfferWithArray:(NSArray*)array
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        for ( StarSpecialOfferModel* Model in array) {
            [db executeUpdate:[NSString stringWithFormat:@"insert into SpecialOffer (activity_flag,img_index,activity_time,end_time,start_time) values ('%@','%@','%@','%@','%@')",Model.activity_flag,Model.img_index,Model.activity_time,Model.end_time,Model.start_time]];
        }
    }];
}

/**根据数组查询数据*/
+ (void)selectDataFormTabelSpecialOfferWithModelBlcok:(requestBlock)block
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        FMResultSet * set =  [db executeQueryWithFormat:@"select * from SpecialOffer"];
        NSMutableArray * modelArray = [NSMutableArray array];
        while ([set next]) {
            StarSpecialOfferModel * model = [StarSpecialOfferModel createModelWithFMResultSet:set];
            [modelArray addObject:model];
        }
        if (block) {
            block(modelArray);
        }
    }];
}

#pragma mark - 明星首页第三块--各国馆

/**创建明星衣橱主页顶部Scroll的数据库表*/
+ (void)createCountriesTable
{
    /*
     @property (copy, nonatomic) NSString * title;
     @property (copy, nonatomic) NSString * picUrl;
     @property (copy, nonatomic) NSString * origin_price;
     @property (copy, nonatomic) NSString * price;
     @property (assign, nonatomic) CGFloat  height;
     @property (assign, nonatomic) CGFloat  width;
     */
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"create table if not exists Countries (id integer primary key autoincrement, country text , _index text ,title text , picUrl text unique, origin_price text , price text , height  float , width float);"]];
    }];
}
/**根据数组来插入数据*/
+ (void)insertIntoCountriesTableWithID:(NSInteger)ID StarMainTopScrollModelArray:(NSArray*)array
{
    NSArray * _indexArray = @[@"region_name",@"region_brands",@"region_pictures",@"region_skus"];
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        for (NSInteger i = 0 ; i<array.count; i++) {
            NSArray * modelArr = array[i];
            for (NSInteger k =0 ; k<modelArr.count; k++) {
                StarMainTopScrollModel * Model = modelArr[k];
                [db executeUpdate:[NSString stringWithFormat:@"insert into Countries (country,_index,title,picUrl,origin_price,price,height,width) values (%ld,'%@','%@','%@','%@','%@',%f,%f)",ID,_indexArray[i],Model.title,Model.picUrl,Model.origin_price,Model.price,Model.height,Model.width]];
            }
        }
        
    }];
}
/**查询数据*/
+ (void)selectDataFormCountriesTabelWithID:(NSInteger)ID withModelBlcok:(requestBlock)block
{
    NSArray * _indexArray = @[@"region_name",@"region_brands",@"region_pictures",@"region_skus"];
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSMutableArray * array = [NSMutableArray array];
        
        for (NSInteger i = 0; i<_indexArray.count; i++) {
            FMResultSet * set =  [db executeQuery:[NSString stringWithFormat:@"select * from Countries where country = %ld and _index = '%@' ",ID,_indexArray[i]]];
            NSMutableArray * modelArray = [NSMutableArray array];
            while ([set next]) {
                StarMainTopScrollModel * model = [StarMainTopScrollModel createWithFMResultSet:set];
                [modelArray addObject:model];
                //                KSLog(@"%@++++++",model.picUrl);
            }
            [array addObject:modelArray];
        }
        
        if (block) {
            block(array);
        }
    }];
    
}

#pragma mark  - 创建第四块区域的表格
+ (void)createClassTabelWithID:(NSInteger)ID
{
    /*
     StarMainClassificationModel
     @property (assign, nonatomic) CGFloat  height;
     @property (assign, nonatomic) CGFloat  width;
     
     @property (assign, nonatomic) CGFloat  needH;
     @property (assign, nonatomic) CGFloat  needW;
     
     @property (strong, nonatomic) componentModel * model;
     
     @property (copy, nonatomic) NSString * country;
     @property (copy, nonatomic) NSString * Description;//字典key :description
     @property (copy, nonatomic) NSString * ID; //字典key :id
     @property (copy, nonatomic) NSString * origin_price;
     @property (copy, nonatomic) NSString * picUrl;
     @property (copy, nonatomic) NSString * price;
     @property (copy, nonatomic) NSString * publish_date;
     @property (copy, nonatomic) NSString * sales;
     @property (copy, nonatomic) NSString * nationalFlag;
     */
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"create table if not exists Class%ld (id integer primary key autoincrement, needH integer , needW integer ,country text , Description text , modelID text , origin_price text , picUrl  text unique, price text,publish_date text,salest text,nationalFlag text);",ID]];
    }];
}
//向数据库插入数据
+ (void)insertDataToTabelClassID:(NSInteger)ID With:(NSArray*)array
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        for ( StarMainClassificationModel* Model in array) {
            [db executeUpdate:[NSString stringWithFormat:@"insert into Class%ld (needH,needW,country,Description,modelID,origin_price,picUrl,price,publish_date,salest,nationalFlag) values (%f,%f,'%@','%@','%@','%@','%@','%@','%@','%@','%@')",ID,Model.needH,Model.needW,Model.model.country,Model.model.Description,Model.model.ID,Model.model.origin_price,Model.model.picUrl,Model.model.price,Model.model.publish_date,Model.model.sales,Model.model.nationalFlag]];
        }
    }];
}
/*查询数据*/
+ (void)selectDataFormCalssWithID:(NSInteger)ID TabelWithModelBlcok:(requestBlock)block
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        FMResultSet * set =  [db executeQuery:[NSString stringWithFormat:@"select * from Class%ld ",ID]];
        NSMutableArray * modelArray = [NSMutableArray array];
        while ([set next]) {
            StarMainClassificationModel * model = [StarMainClassificationModel createModelWithFMResult:set];
            [modelArray addObject:model];
        }
        if (block) {
            block(modelArray);
        }
    }];
}


#pragma mark - 搭配界面数据库
+ (void)createTabelForCollocationVCWithTitle:(NSString*)title
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"create table if not exists '%@' (id integer primary key autoincrement, needH integer , needW integer ,country text , Description text , modelID text , origin_price text , picUrl  text unique, price text,publish_date text,salest text,nationalFlag text);",title]];
    }];
}


@end
