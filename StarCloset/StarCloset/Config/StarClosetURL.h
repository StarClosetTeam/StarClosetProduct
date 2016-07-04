//
//  StarClosetURL.h
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//
#import <Foundation/Foundation.h>

/*明星衣橱首页ScorllViewURL*/
#define ScrollViewURL  @"http://api-v2.mall.hichao.com/mall/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

/*特价优惠URL*/
#define  SpecialOfferURL  @"http://api-v2.mall.hichao.com/active/flash/list?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

/*明星tableViewURL*/
//韩国馆URL
#define  SouthKoreanPavilion(ID)   [NSString stringWithFormat:@"http://api-v2.mall.hichao.com/mall/region/new?region_id=%ld&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=",ID]

/**/
#define ClassificationURL(ID) [NSString stringWithFormat:@"http://api-v2.mall.hichao.com/sku/list?more_items=%ld&type=selection&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI",ID]

@interface StarClosetURL : NSObject

@end
