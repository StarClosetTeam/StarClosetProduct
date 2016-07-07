//
//  CollecationViewController.m
//  StarCloset
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#define ChannelURLDictionary @{@"最新":@"http://api-v2.mall.hichao.com/star/list?category=%E5%85%A8%E9%83%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"热门":@"http://api-v2.mall.hichao.com/star/list?category=%E7%83%AD%E9%97%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"欧美":@"http://api-v2.mall.hichao.com/star/list?category=%E6%AC%A7%E7%BE%8E&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"日韩":@"http://api-v2.mall.hichao.com/star/list?category=%E6%97%A5%E9%9F%A9&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"本土":@"http://api-v2.mall.hichao.com/star/list?category=%E6%9C%AC%E5%9C%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"型男":@"http://api-v2.mall.hichao.com/star/list?category=%E6%9C%AC%E5%9C%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"复古":@"http://api-v2.mall.hichao.com/star/list?category=%E5%A4%8D%E5%8F%A4&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"轻熟":@"http://api-v2.mall.hichao.com/star/list?category=%E8%BD%BB%E7%86%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"OL":@"http://api-v2.mall.hichao.com/star/list?category=OL&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"清新":@"http://api-v2.mall.hichao.com/star/list?category=%E6%B8%85%E6%96%B0&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"混搭":@"http://api-v2.mall.hichao.com/star/list?category=%E6%B7%B7%E6%90%AD&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"甜美":@"http://api-v2.mall.hichao.com/star/list?category=%E7%94%9C%E7%BE%8E&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"逛街":@"http://api-v2.mall.hichao.com/star/list?category=%E9%80%9B%E8%A1%97&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"街头":@"http://api-v2.mall.hichao.com/star/list?category=%E8%A1%97%E5%A4%B4&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"闺蜜":@"http://api-v2.mall.hichao.com/star/list?category=%E9%97%BA%E8%9C%9C&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"休闲":@"http://api-v2.mall.hichao.com/star/list?category=%E4%BC%91%E9%97%B2&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"摩登":@"http://api-v2.mall.hichao.com/star/list?category=%E6%91%A9%E7%99%BB&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"约会":@"http://api-v2.mall.hichao.com/star/list?category=%E7%BA%A6%E4%BC%9A&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"派对":@"http://api-v2.mall.hichao.com/star/list?category=%E6%B4%BE%E5%AF%B9&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"运动":@"http://api-v2.mall.hichao.com/star/list?category=%E8%BF%90%E5%8A%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"出游":@"http://api-v2.mall.hichao.com/star/list?category=%E5%87%BA%E6%B8%B8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"典礼":@"http://api-v2.mall.hichao.com/star/list?category=%E5%85%B8%E7%A4%BC&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"优选":@"http://api-v2.mall.hichao.com/star/list?category=%E4%BC%98%E9%80%89&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"丰满":@"http://api-v2.mall.hichao.com/star/list?category=%E4%B8%B0%E6%BB%A1&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"娇小":@"http://api-v2.mall.hichao.com/star/list?category=%E5%A8%87%E5%B0%8F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"高挑":@"http://api-v2.mall.hichao.com/star/list?category=%E9%AB%98%E6%8C%91&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token="}

#import "CollecationViewController.h"

typedef enum : NSUInteger {
    UICollectionViewTagChannel = 1000,
} UICollectionViewTag;

@interface CollecationViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    //    Btn下面的线
    UIView * redView;
    //    设置最底层的View
    UIView * mainView;
    //    我的频道名字数组
    NSMutableArray * ownChannelTitleArray;
    //    未添加频道名字数组
    NSMutableArray * notOwnChannelTitleArray;
    //    拥有频道的Btn数组
    NSMutableArray * ownChannelBtnArray;
    //    未拥有的频道的Btn数组
    NSMutableArray * notOwnChannelBtnArray;
    //    频道titleScrollview
    UIScrollView * channelTitleScroll;
    //    频道ChannelView
    UIView * ChannelView;
}
@end

@implementation CollecationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    关闭自动偏移
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    //    设置标题
    self.navigationItem.titleView = [self createNavigationTitleView];
    //    设置导航右侧按钮
    [self setRightBarButtonItem];
    //    设置最底层的View
    [self setMainView];
    //    获取我的频道名字
    [self getChannelTitleName];
    //    设置频道标题Scrollview
    [self setChannelTitleScroll];
}
#pragma mark - 创建标题Btn
- (UIView*)createNavigationTitleView
{
    UIView * titleView = [[UIView alloc]init];
    titleView.bounds = CGRectMake(0, 0, 200, 40);
    for (NSInteger i = 0; i<2 ; i++) {
        //        创建标题Btn
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*100, 0, 100, 38);
        [button addTarget:self action:@selector(transitionTitle:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitle:i==0?@"搭配":@"专题" forState:UIControlStateNormal];
        button.selected = i==0?YES:NO;
        [titleView addSubview:button];
    }
    //        创建滑动view
    redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.center = CGPointMake(50, 38);
    redView.bounds = CGRectMake(0, 0, 40, 3);
    [titleView addSubview:redView];
    
    return titleView;
}
//标题titleBtn点击事件
- (void)transitionTitle:(UIButton*)sender
{
    static UIButton * oldButton;
    oldButton.selected = NO;
    sender.selected = YES;
    oldButton = sender;
    [UIView animateWithDuration:0.3 animations:^{
        redView.center = CGPointMake(sender.center.x, redView.center.y);
    }];
}
#pragma mark - 创建标题Btn
- (void)setRightBarButtonItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bottom_like_button_on"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
}
//导航右Btn点击事件
- (void)rightBarButtonItemClick:(UIButton*)sender
{
    
}

#pragma mark - 设置最底层的mainView
- (void)setMainView
{
    //    mainView = [[UIView alloc]initWithFrame:kMainBounds];
    //    mainView.backgroundColor = [UIColor lightGrayColor];
    //    [self.view addSubview:mainView];
    //    self.view.clipsToBounds = YES;
}

#pragma mark - 设置频道BtnScrollview
- (void)setChannelTitleScroll
{
    channelTitleScroll = [[UIScrollView alloc]init];
    [self.view addSubview:channelTitleScroll];
    channelTitleScroll.frame = CGRectMake(0, 64, kMainBoundsW-40, 40);
    
    for (NSInteger i = 0; i<ownChannelTitleArray.count; i++) {
        UIButton * channelTitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        channelTitleBtn.frame = CGRectMake(60*i, 0, 60, 40);
        [channelTitleBtn setTitle:ownChannelTitleArray[i] forState:UIControlStateNormal];
        [channelTitleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [channelTitleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        channelTitleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [channelTitleBtn addTarget:self action:@selector(openNowChannelPage:) forControlEvents:UIControlEventTouchUpInside];
        [channelTitleScroll addSubview:channelTitleBtn];
    }
    //    创建展开标题View的Btn
    UIButton * openChannelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    openChannelBtn.frame = CGRectMake(kMainBoundsW-40, 64, 40, 40);
    [openChannelBtn setBackgroundImage:[UIImage imageNamed:@"bottom_like_button"] forState:UIControlStateNormal];
    [openChannelBtn setBackgroundImage:[UIImage imageNamed:@"bottom_like_button_on"] forState:UIControlStateSelected];
    [openChannelBtn addTarget:self action:@selector(openChannelView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openChannelBtn];
    
    channelTitleScroll.showsVerticalScrollIndicator = NO;
    channelTitleScroll.showsHorizontalScrollIndicator = NO;
    channelTitleScroll.contentSize = CGSizeMake(0, 0);
    channelTitleScroll.backgroundColor = [UIColor orangeColor];
}

//标题Btn点击事件
- (void)openNowChannelPage:(UIButton*)sender
{
    static UIButton * oldButton ;
    oldButton.selected = NO;
    sender.selected = YES;
    oldButton = sender;
    
}

//展开标题View点击事件
- (void)openChannelView:(UIButton*)sender
{
    sender.selected = !sender.selected;
}


#pragma mark - 设置频道createChannelView
- (void)setChannelCollectionView
{
    [self getChannelTitleName];
    [self createChannelView];
}
//获取我的频道和未拥有的频道的名字
- (void)getChannelTitleName
{
    ownChannelTitleArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"own"];
    notOwnChannelTitleArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"notOwn"];
    if (ownChannelTitleArray.count > 0) {
        return;
    }else
    {
        ownChannelTitleArray = @[@"最新"].mutableCopy;
        notOwnChannelTitleArray = @[@"最新",@"热门",@"欧美",@"日韩",@"本土",@"型男",@"复古",@"甜美",@"街头",@"清新",@"轻熟",@"摩登",@"OL",@"混搭",@"闺蜜",@"休闲",@"逛街",@"约会",@"派对",@"出游",@"典礼",@"运动",@"高挑",@"娇小",@"优选",@"丰满"].mutableCopy;
    }
    
    KSLog(@"%ld--%ld",ownChannelTitleArray.count,notOwnChannelTitleArray.count);
}
//创建频道View
- (void)createChannelView
{
    ChannelView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kMainBoundsW, 60)];
    
}







#pragma mark - 创建CollectionView
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
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    /*注册重用区头区尾View*/
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}

#pragma mark - ----------------collectionView协议方法-----------------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
/*设置collectionView行数-默认为20*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
/*设置collectionView行内容*/
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor =ARCCOLOR;
    return cell;
}
/*设置collectionView区头内容*/
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__FUNCTION__);
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        return headerView;
    }else
    {
        UICollectionReusableView * footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
        return footerView;
    }
}
/*设置collectionView区头大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(414, 300);
}
/*设置Cell距离边界尺寸*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
