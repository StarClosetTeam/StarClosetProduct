//
//  StarMainTableViewCell.m
//  StarCloset
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//


#import "StarMainTableViewCell.h"

@interface StarMainTableViewCell ()

{
    CGFloat ScrollHeight;
}

@end

@implementation StarMainTableViewCell



/**cell注册机制时，调用此方法*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)setModelArray:(NSArray *)modelArray;
{
    if (_modelArray != modelArray) {
        _modelArray = modelArray;
        [self setCell];
         }
}

- (void)setCell
{
    for (NSArray * array in self.modelArray) {
        [self createScrollViewWith:array];
    }
}

- (void)createScrollViewWith:(NSArray*)array
{
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    CGFloat cellHeight = 0.0 ;
    CGFloat ScrollViwSizeX = 0.0;
    for (NSInteger i = 0; i<array.count; i++) {
        StarMainTopScrollModel * model = array[i];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [scrollView addSubview:button];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
        if (model.width>kMainBoundsW) {
            button.frame = CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, model.height*kMainBoundsW/model.width);
            cellHeight = button.frame.size.height;
            ScrollViwSizeX += kMainBoundsW;
        }else
        {
            button.frame = CGRectMake(model.width/(750/kMainBoundsW)*i, 0, model.width/(750/kMainBoundsW), model.height/(750/kMainBoundsW));
            cellHeight = button.frame.size.height;
            ScrollViwSizeX += cellHeight;
        }
    }
    scrollView.frame = CGRectMake(0, ScrollHeight, kMainBoundsW, cellHeight);
    scrollView.contentSize = CGSizeMake(ScrollViwSizeX, 0);
    [self.contentView addSubview:scrollView];
    ScrollHeight += cellHeight;
    KSLog(@"%f",ScrollHeight);
}

@end
