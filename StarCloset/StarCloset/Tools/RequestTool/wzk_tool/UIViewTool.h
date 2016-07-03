//
//  UIViewTool.h
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^eventBlock)(void);

@interface UIViewTool : UIView

@property (strong, nonatomic) UIPageControl * pageContrl;

+ (instancetype)shareTool;
//创建导航上的搜索栏TF
- (void)createTextFieldWithBlcok:(viewBlock)block withTFEditingBlock:(eventBlock)tfBock;

//创建最上层介绍ScrollView
- (void)createStarMainTopScrollWithViewBlock:(viewBlock)blockA withButtonBlcok:(eventBlock)event;



@end
