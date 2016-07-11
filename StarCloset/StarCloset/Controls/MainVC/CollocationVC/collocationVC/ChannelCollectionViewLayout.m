//
//  ChannelCollectionViewLayout.m
//  StarCloset
//
//  Created by Mac on 16/7/8.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "ChannelCollectionViewLayout.h"

@interface ChannelCollectionViewLayout ()
{
    NSMutableArray * LayoutAttributes;
}

@end

@implementation ChannelCollectionViewLayout



//系统会先调用自定义layout的方法
- (void)prepareLayout
{
    KSLog(@"%s",__FUNCTION__);
    LayoutAttributes = [NSMutableArray array];
    [self setLayoutAttributes];
}

- (void)setLayoutAttributes
{
    
   NSInteger sectionsNum = [self.collectionView numberOfSections];
    for (NSInteger i =0; i<sectionsNum; i++) {
        NSInteger rowsNum = [self.collectionView numberOfItemsInSection:i];
        KSLog(@"%ld",rowsNum);
        for (NSInteger k = 0; k<rowsNum; k++) {
//            UICollectionViewLayoutAttributes * itemAtrributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:k inSection:i]];
//            itemAtrributes.frame = CGRectMake(kMainBoundsW/2*(k%2), kMainBoundsH/4*(k/2), kMainBoundsW/2, kMainBoundsH/4);
//            KSLog(@"%@",NSStringFromCGRect(itemAtrributes.frame));
            
          UICollectionViewLayoutAttributes * itemAtrributes =  [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:k inSection:i]];
            
            [LayoutAttributes addObject:itemAtrributes];
        }
    }
}


//返回所有items的Attributes属性的数组的方法
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    KSLog(@"%s",__FUNCTION__);
    
//    [self  index]
    return LayoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * itemAtrributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    itemAtrributes.frame = CGRectMake(kMainBoundsW/2*(indexPath.row%2), kMainBoundsH/4*(indexPath.row/2), kMainBoundsW/2, kMainBoundsH/4);
    KSLog(@"%@--%s",NSStringFromCGRect(itemAtrributes.frame),__FUNCTION__);
    return itemAtrributes;
}
//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//
//{

//    NSMutableArray *layoutAttributes = [NSMutableArray array];
//    
//    // Cells
//    
//    // We call a custom helper method -indexPathsOfItemsInRect: here
//    
//    // which computes the index paths of the cells that should be included
//    
//    // in rect.
//    
//    NSArray *visibleIndexPaths = [self indexPathsOfItemsInRect:rect];
//    
//    for (NSIndexPath *indexPath in visibleIndexPaths) {
//        
//        UICollectionViewLayoutAttributes *attributes =
//        
//        [self layoutAttributesForItemAtIndexPath:indexPath];
//        
//        [layoutAttributes addObject:attributes];
//        
//    }
//    
//    // Supplementary views
//    
//    NSArray *dayHeaderViewIndexPaths = [self indexPathsOfDayHeaderViewsInRect:rect];
//    
//    for (NSIndexPath *indexPath in dayHeaderViewIndexPaths) {
//        
//        UICollectionViewLayoutAttributes *attributes =
//        
//        [self layoutAttributesForSupplementaryViewOfKind:@"DayHeaderView"
//         
//                                             atIndexPath:indexPath];
//        
//        [layoutAttributes addObject:attributes];
//        
//    }
//    
//    NSArray *hourHeaderViewIndexPaths = [self indexPathsOfHourHeaderViewsInRect:rect];
//    
//    for (NSIndexPath *indexPath in hourHeaderViewIndexPaths) {
//        
//        UICollectionViewLayoutAttributes *attributes = 
//        
//        [self layoutAttributesForSupplementaryViewOfKind:@"HourHeaderView" 
//         
//                                             atIndexPath:indexPath]; 
//        
//        [layoutAttributes addObject:attributes]; 
    
//    } 
    
//    return LayoutAttributes;
//    
//}



- (CGSize)collectionViewContentSize
{
    KSLog(@"%s",__FUNCTION__);
    return CGSizeMake(0, 1000);
}

#pragma mark - item移动删除动画实现
/*这里包含了所有的布局(位置)变化信息：添加的，删除的，更新的，一般在这里收集布局变化信息。*/
/**优先调用*/
//- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems
//{
//    
//}

//由于新添加的 cell 会造成其他 cells 的相对位置发生变化，这两个方法会被重复调用。
//- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
//{
//    
//}



/**最后调用*/
//- (void)finalizeCollectionViewUpdates
//{
//    
//}

@end
