//
//  CollocationURL.h
//  StarCloset
//
//  Created by student on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollocationURL : NSObject

//最新的
#define CollocationNewestURL @"http://api-v2.mall.hichao.com/star/list?category=%E5%85%A8%E9%83%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//热门的
#define CollocationHotURL @"http://api-v2.mall.hichao.com/star/list?category=%E7%83%AD%E9%97%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//欧美的
#define CollocationEuramericanURL @"http://api-v2.mall.hichao.com/star/list?category=%E6%AC%A7%E7%BE%8E&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//日韩的
#define CollocationJapanKoreaURL @"http://api-v2.mall.hichao.com/star/list?category=%E6%97%A5%E9%9F%A9&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//本土的
#define CollocationMainlandURL @"http://api-v2.mall.hichao.com/star/list?category=%E6%9C%AC%E5%9C%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//型男的
#define CollocationMetrosexualURL @"http://api-v2.mall.hichao.com/star/list?category=%E5%9E%8B%E7%94%B7&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//复古的
#define CollocationVintageURL @"http://api-v2.mall.hichao.com/star/list?category=%E5%A4%8D%E5%8F%A4&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//甜美的
#define CollocationSweetURL @"http://api-v2.mall.hichao.com/star/list?category=%E7%94%9C%E7%BE%8E&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//街头的
#define CollocationStreetURL @"http://api-v2.mall.hichao.com/star/list?category=%E8%A1%97%E5%A4%B4&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//清新的
#define CollocationFreshURL @"http://api-v2.mall.hichao.com/star/list?category=%E6%B8%85%E6%96%B0&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token="

//轻熟
#define CollocationMyfionaURL @"http://api-v2.mall.hichao.com/star/list?category=%E8%BD%BB%E7%86%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//摩登
#define CollocationModernaURL @"：http://api-v2.mall.hichao.com/star/list?category=%E6%91%A9%E7%99%BB&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//OL
#define CollocationOLURL @"http://api-v2.mall.hichao.com/star/list?category=OL&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//混搭
#define CollocationMashupURL @"http://api-v2.mall.hichao.com/star/list?category=%E6%B7%B7%E6%90%AD&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//闺蜜
#define CollocationConfidanteURL @"http://api-v2.mall.hichao.com/star/list?category=%E9%97%BA%E8%9C%9C&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//休闲
#define CollocationLeisureURL @"http://api-v2.mall.hichao.com/star/list?category=%E4%BC%91%E9%97%B2&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//逛街
#define CollocationGuangJIeURL @"http://api-v2.mall.hichao.com/star/list?category=%E9%80%9B%E8%A1%97&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//约会
#define CollocationEngagementURL @"http://api-v2.mall.hichao.com/star/list?category=%E7%BA%A6%E4%BC%9A&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//派对
#define CollocationPartyURL @"http://api-v2.mall.hichao.com/star/list?category=%E6%B4%BE%E5%AF%B9&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//出游
#define CollocationOutingURL @"http://api-v2.mall.hichao.com/star/list?category=%E5%87%BA%E6%B8%B8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//典礼
#define CollocationCeremonyURL @"http://api-v2.mall.hichao.com/star/list?category=%E5%85%B8%E7%A4%BC&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//运动
#define CollocationMovementURL @"http://api-v2.mall.hichao.com/star/list?category=%E8%BF%90%E5%8A%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//高挑
#define CollocationTallURL @"http://api-v2.mall.hichao.com/star/list?category=%E9%AB%98%E6%8C%91&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//娇小
#define CollocationCutenessURL @"http://api-v2.mall.hichao.com/star/list?category=%E5%A8%87%E5%B0%8F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//优选
#define CollocationOptimizationURL @"http://api-v2.mall.hichao.com/star/list?category=%E4%BC%98%E9%80%89&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

//丰满
#define CollocationFullandroundURL @"http://api-v2.mall.hichao.com/star/list?category=%E4%B8%B0%E6%BB%A1&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CAB8D1AA-3E91-46CA-99EF-0ED5D03FD28F&gs=1536x2048&gos=9.3.2&access_token=o3LXBTYD7UVaAIg5WR_mabKbpe6PnpEEX5mpaZTt9sI"

@end
