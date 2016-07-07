//
//  CollectionViewClassificationLayout.m
//  StarCloset
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "CollectionViewClassificationLayout.h"

@interface CollectionViewClassificationLayout ()

{
    NSMutableArray * cellAttributes;
    NSInteger itemNum;
    double itemSizeHight[2];
}

@end

@implementation CollectionViewClassificationLayout

- (instancetype)init
{
    if (self = [super init]) {
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
    [self createUICollectionViewLayoutAttributes];
}

- (void)createUICollectionViewLayoutAttributes
{
    NSInteger index ;
    cellAttributes = [NSMutableArray array];
    itemNum =  [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i<itemNum; i++) {
        UICollectionViewLayoutAttributes * itemLayoutAttributes = [[UICollectionViewLayoutAttributes alloc]init];
        index = itemSizeHight[0]>itemSizeHight[1]?0:1;
        StarMainClassificationModel * model = _array[i];
        
//        item的宽度 距离边界间隔10，中间间隔10
        double itemWidth = model.needW;
        double itemHeight = model.needH;
        itemLayoutAttributes.frame = CGRectMake(10+(itemSizeHight[index]*itemWidth+10), itemSizeHight[index]+60, itemWidth , itemHeight);
        itemSizeHight[index] += itemHeight+60;
    }
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return cellAttributes;
}


- (CGSize)collectionViewContentSize
{
    double sizeY = MAX(itemSizeHight[0], itemSizeHight[1]);
    return CGSizeMake(0, sizeY);
}

@end
