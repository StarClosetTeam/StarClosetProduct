//
//  Header.h
//  StarCloset
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#ifndef Header_h
#define Header_h

//宏定义屏幕的尺寸
#define KMainFrame  [UIScreen mainScreen].bounds
#define KMainWidth  [UIScreen mainScreen].bounds.size.width
#define KMainHeight [UIScreen mainScreen].bounds.size.height
//宏定义随机颜色
#define ARCCOLOR [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

#endif /* Header_h */
//导入的第三方头文件
#import "AFNetworking.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

//自定义类的头文件
#import "WelcomeViewController.h"



//工具类的头文件
#import "RequestTool.h"