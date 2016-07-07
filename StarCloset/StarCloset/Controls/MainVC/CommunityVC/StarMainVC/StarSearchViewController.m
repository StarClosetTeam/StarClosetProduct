//
//  StarSearchViewController.m
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "StarSearchViewController.h"

@interface StarSearchViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray * dataArray ;
}

@end

@implementation StarSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [databaseTool  selectDataFormCalssWithID:1 TabelWithModelBlcok:^(NSArray *array) {
        dataArray = array;
    }];
    [self createCollectionView];
    
    
}

/*创建CollectionView*/
- (void)createCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    /*设置默认collectionView的背景颜色---白色*/
    collectionView.backgroundColor = [UIColor whiteColor];
    /*设置collectionView的代理*/
    collectionView.delegate = self;
    collectionView.dataSource = self;
    /*添加collectionView到父视图*/
    [self.view addSubview:collectionView];
    /*注册重用cell*/
    [collectionView registerClass:[StarMainCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

}

#pragma mark - ----------------collectionView协议方法-----------------
/*设置collectionView区数-默认为1*/
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
/*设置collectionView行数-默认为20*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArray.count;
}
/*设置collectionView行内容*/
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StarMainCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView * view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    [cell setViewWithModel:dataArray[indexPath.row]];
    return cell;
}

/*设置Cell距离边界尺寸*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(190 , 380);
}



@end
