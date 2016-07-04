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
    CGFloat itemHight[2];
}

@end

@implementation CollectionViewClassificationLayout

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
        index = itemHight[0]>itemHight[1]?0:1;
//        itemLayoutAttributes.frame = CGRectMake(itemHight[index], itemHight, , <#CGFloat height#>)
    }
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return cellAttributes;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, 0);
}

@end
