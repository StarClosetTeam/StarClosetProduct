//
//  CollecationViewController.m
//  StarCloset
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#define ChannelURLDictionary @{@"最新":@"http://api-v2.mall.hichao.com/star/list?category=%E5%85%A8%E9%83%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"热门":@"http://api-v2.mall.hichao.com/star/list?category=%E7%83%AD%E9%97%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"欧美":@"http://api-v2.mall.hichao.com/star/list?category=%E6%AC%A7%E7%BE%8E&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"日韩":@"http://api-v2.mall.hichao.com/star/list?category=%E6%97%A5%E9%9F%A9&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"本土":@"http://api-v2.mall.hichao.com/star/list?category=%E6%9C%AC%E5%9C%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"型男":@"http://api-v2.mall.hichao.com/star/list?category=%E6%9C%AC%E5%9C%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"复古":@"http://api-v2.mall.hichao.com/star/list?category=%E5%A4%8D%E5%8F%A4&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"轻熟":@"http://api-v2.mall.hichao.com/star/list?category=%E8%BD%BB%E7%86%9F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"OL":@"http://api-v2.mall.hichao.com/star/list?category=OL&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"清新":@"http://api-v2.mall.hichao.com/star/list?category=%E6%B8%85%E6%96%B0&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"混搭":@"http://api-v2.mall.hichao.com/star/list?category=%E6%B7%B7%E6%90%AD&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"甜美":@"http://api-v2.mall.hichao.com/star/list?category=%E7%94%9C%E7%BE%8E&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"逛街":@"http://api-v2.mall.hichao.com/star/list?category=%E9%80%9B%E8%A1%97&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"街头":@"http://api-v2.mall.hichao.com/star/list?category=%E8%A1%97%E5%A4%B4&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"闺蜜":@"http://api-v2.mall.hichao.com/star/list?category=%E9%97%BA%E8%9C%9C&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"休闲":@"http://api-v2.mall.hichao.com/star/list?category=%E4%BC%91%E9%97%B2&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"摩登":@"http://api-v2.mall.hichao.com/star/list?category=%E6%91%A9%E7%99%BB&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"约会":@"http://api-v2.mall.hichao.com/star/list?category=%E7%BA%A6%E4%BC%9A&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"派对":@"http://api-v2.mall.hichao.com/star/list?category=%E6%B4%BE%E5%AF%B9&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"运动":@"http://api-v2.mall.hichao.com/star/list?category=%E8%BF%90%E5%8A%A8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"出游":@"http://api-v2.mall.hichao.com/star/list?category=%E5%87%BA%E6%B8%B8&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"典礼":@"http://api-v2.mall.hichao.com/star/list?category=%E5%85%B8%E7%A4%BC&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"优选":@"http://api-v2.mall.hichao.com/star/list?category=%E4%BC%98%E9%80%89&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"丰满":@"http://api-v2.mall.hichao.com/star/list?category=%E4%B8%B0%E6%BB%A1&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"娇小":@"http://api-v2.mall.hichao.com/star/list?category=%E5%A8%87%E5%B0%8F&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token=",@"高挑":@"http://api-v2.mall.hichao.com/star/list?category=%E9%AB%98%E6%8C%91&lts=&pin=&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=118DEA61-7553-40D3-9094-217D4A1B44C7&gs=640x960&gos=9.3.2&access_token="}

#define BtnSpacing 15
#define BtnWidth  ((kMainBoundsW-75)/4)
#define BtnHeight  40


#import "CollecationViewController.h"

typedef enum : NSUInteger {
    UICollectionViewTagChannel = 10000,
    UICollectionViewTagchannelContent ,
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
    NSMutableArray * channelDataArray;
    
    //    频道titleScrollview
    UIScrollView * channelTitleScroll;
    //    频道ChannelView
    UIView * ChannelView;
    //    我的分类的View高度
    CGFloat ownChannelViewHeight;
    // 是否编辑
    BOOL isOpenEdting;
    //    拥有的btn背景View
    UIView * ownView;
    //未拥有的Btn背景
    UIView * notOwnView;
    UILabel * myChannelTitleLabel;
}
@end

@implementation CollecationViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //    关闭自动偏移
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    //    设置标题
    self.navigationItem.titleView = [self createNavigationTitleView];
    //    设置导航右侧按钮
    [self setRightBarButtonItem];
    //    设置最底层的View
    [self setMainView];
    //    设置频道标题Scrollview
    [self setChannelTitleScroll];
    
    //    创建当前标题内容的collectionview
    [self createChannelContentCollectionView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    获取我的频道名字
    [self getChannelTitleName];
    
    //    默认请求第一个标题的数据
    [RequestTool requestdataForCollocationVCWithURL:ChannelURLDictionary[ownChannelTitleArray[0]] withRequestBlock:^(NSArray *array) {
        //        创建数据库
        
    }];
    
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
        button.tag = i;
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
    
    [UIView animateWithDuration:0.5 animations:^{
        mainView.center = CGPointMake(kMainBoundsW-kMainBoundsW*sender.tag, mainView.center.y);
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
    mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kMainBoundsW*2, kMainBoundsH-64-49)];
    mainView.backgroundColor = SDColor(241, 241, 241, 1);
    [self.view addSubview:mainView];
    
}

#pragma mark - 设置频道BtnScrollview
- (void)setChannelTitleScroll
{
    channelTitleScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW-40, 40)];
    channelTitleScroll.backgroundColor = SDColor(241, 241, 241, 1);
    [mainView addSubview:channelTitleScroll];
    
    [self removeSubViewsForView:channelTitleScroll];
    
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
    openChannelBtn.frame = CGRectMake(kMainBoundsW-40, 0, 40, 40);
    [openChannelBtn setBackgroundImage:[UIImage imageNamed:@"bottom_like_button"] forState:UIControlStateNormal];
    [openChannelBtn setBackgroundImage:[UIImage imageNamed:@"bottom_like_button_on"] forState:UIControlStateSelected];
    [openChannelBtn addTarget:self action:@selector(openChannelView:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:openChannelBtn];
    
    channelTitleScroll.showsHorizontalScrollIndicator = NO;
    channelTitleScroll.clipsToBounds = YES;
    channelTitleScroll.contentSize = CGSizeMake(60*ownChannelTitleArray.count, 0);
    channelTitleScroll.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 标题Btn点击事件
- (void)openNowChannelPage:(UIButton*)sender
{
    static UIButton * oldButton ;
    oldButton.selected = NO;
    sender.selected = YES;
    oldButton = sender;
    //    根据当前标题请求数据
    [RequestTool requestdataForCollocationVCWithURL:ChannelURLDictionary[sender.currentTitle] withRequestBlock:^(NSArray *array) {
        
    }];
}

//展开标题View点击事件
- (void)openChannelView:(UIButton*)sender
{
    sender.selected = !sender.selected;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setChannelView];
    });
    [mainView bringSubviewToFront:sender];
    if (sender.selected) {
        ChannelView.hidden = NO;
        channelTitleScroll.hidden = YES;
    }else
    {
        ChannelView.hidden = YES;
        channelTitleScroll.hidden = NO;
        [self setChannelTitleScroll];
        [self saveTitle];
    }
}


#pragma mark - 设置频道createChannelView- 创建
- (void)setChannelView
{
    // 主要频道页面的底层View
    ChannelView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, mainView.frame.size.height-64-49)];
    [mainView addSubview:ChannelView];
    
    //    频道定制标题
    myChannelTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 60)];
    myChannelTitleLabel.text = @"频道定制";
    myChannelTitleLabel.textAlignment = 1;
    myChannelTitleLabel.font = [UIFont systemFontOfSize:25];
    myChannelTitleLabel.backgroundColor = [UIColor whiteColor];
    [ChannelView addSubview:myChannelTitleLabel];
    myChannelTitleLabel.sd_layout.topEqualToView(ChannelView).leftEqualToView(ChannelView).rightEqualToView(ChannelView).heightIs(60);
    
    [self createCollectionView];
    
}

//是否编辑
- (void)isOpenEdting:(UIButton*)sender
{
    sender.selected =! sender.selected;
    isOpenEdting = sender.selected;
}

/**把标题存入本地*/
- (void)saveTitle
{
    [[NSUserDefaults standardUserDefaults] setValue:ownChannelTitleArray forKey:@"ownTitle"];
    [[NSUserDefaults standardUserDefaults] setValue:notOwnChannelTitleArray forKey:@"notOwnTitle"];
}

//获取我的频道和未拥有的频道的名字
- (void)getChannelTitleName
{
    //    从本地查找是否有存储的 标题分类
    NSArray * ownArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"ownTitle"];
    NSArray * noTOwnArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"notOwnTitle"];
    
    ownChannelTitleArray = [NSMutableArray arrayWithArray:ownArray];
    notOwnChannelTitleArray = [NSMutableArray arrayWithArray:noTOwnArray];
    //    判断是否写入本地
    if (ownChannelTitleArray.count > 0) {
        channelDataArray = [NSMutableArray arrayWithObjects:ownChannelTitleArray,notOwnChannelTitleArray, nil];
        return;
    }else
    {
        ownChannelTitleArray = [NSMutableArray arrayWithObjects:@"最新", nil];
        notOwnChannelTitleArray = [NSMutableArray arrayWithObjects:@"热门",@"欧美",@"日韩",@"本土",@"型男",@"复古",@"甜美",@"街头",@"清新",@"轻熟",@"摩登",@"OL",@"混搭",@"闺蜜",@"休闲",@"逛街",@"约会",@"派对",@"出游",@"典礼",@"运动",@"高挑",@"娇小",@"优选",@"丰满", nil];
        channelDataArray = [NSMutableArray arrayWithObjects:ownChannelTitleArray,notOwnChannelTitleArray, nil];
    }
    
}

#pragma mark - 创建频道定制CollectionView
- (void)createCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60,kMainBoundsW, ChannelView.frame.size.height+60) collectionViewLayout:flowLayout];
    /*设置默认collectionView的背景颜色---白色*/
    collectionView.backgroundColor = [UIColor whiteColor];
    /*设置collectionView的代理*/
    collectionView.tag = UICollectionViewTagChannel;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    /*添加collectionView到父视图*/
    [ChannelView addSubview:collectionView];
    /*注册重用cell*/
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    /*注册重用区头区尾View*/
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
}


#pragma mark - 创建每个界面的

#pragma mark - 创建标题内容collectionView
- (void)createChannelContentCollectionView
{
    
    ChannelCollectionViewLayout * layout = [[ChannelCollectionViewLayout alloc]init];
    
    UICollectionView * channelContentCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 40, kMainBoundsH, mainView.frame.size.height-40) collectionViewLayout:layout];
    [mainView addSubview:channelContentCollectionView];
    channelContentCollectionView.tag = UICollectionViewTagchannelContent;
    channelContentCollectionView.dataSource = self;
    channelContentCollectionView.delegate = self;
    
    [channelContentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}


#pragma mark - ----------------collectionView协议方法-----------------

#pragma mark - 设置collectionView区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    switch (collectionView.tag) {
        case UICollectionViewTagChannel:
            return channelDataArray.count;
            break;
            
        case UICollectionViewTagchannelContent:
        {
            KSLog(@"%s",__FUNCTION__);
            return 1;
        }
            break;
            
        default:
            return 0;
            break;
    }
    
}

#pragma mark - 设置collectionView行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (collectionView.tag) {
        case UICollectionViewTagChannel:
            return [channelDataArray[section] count];
            break;
            
        case UICollectionViewTagchannelContent:
        {
            return 100;
            KSLog(@"%s",__FUNCTION__);
        }
            break;
            
        default:
            return 0;
            break;
    }
    
}

#pragma mark - 设置collectionView行内容
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (collectionView.tag) {
        case UICollectionViewTagChannel:
        {
            UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            [self setCollectionViewTagChannelCellWithCell:cell withIndextPath:indexPath];
            return cell;
        }
            break;
            
        case UICollectionViewTagchannelContent:
        {
            UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            cell.backgroundColor = ARCCOLOR;
            KSLog(@"%s",__FUNCTION__);
            return cell;
        }
            break;
            
        default:
        {
            return nil;
        }
            break;
    }
    
}

#pragma mark - 设置collectionView的区头内容
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        switch (collectionView.tag) {
            case UICollectionViewTagChannel:  //      编辑标题的collectionView
            {
                UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
                [self setCollectionViewTagChannelHeaderViewWith:headerView with:indexPath];
                return headerView;
            }
                break;
                
            case UICollectionViewTagchannelContent:  //      展示内容的collectionView
            {
                KSLog(@"%s",__FUNCTION__);
                return nil;
            }
                break;
                
            default:
                return nil;
                break;
        }
        
    }else
    {
        return nil;
    }
}

#pragma mark - 设置collectionView的区头尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    switch (collectionView.tag) {
        case UICollectionViewTagChannel:
            return CGSizeMake(kMainBoundsW, 40);
            break;
            
        case UICollectionViewTagchannelContent:
        {
            KSLog(@"%s",__FUNCTION__);
            return  CGSizeMake(kMainBoundsW, 60);
        }
            break;
            
        default:
            return CGSizeZero;
            break;
    }
}

#pragma mark - 设置collectionView的Cell距离边界尺寸
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    switch (collectionView.tag) {
        case UICollectionViewTagChannel:
            return UIEdgeInsetsMake(15, 15, 15, 15);
            break;
            
        case UICollectionViewTagchannelContent:
        {
            KSLog(@"%s",__FUNCTION__);
            return UIEdgeInsetsMake(10, 10, 10, 10);
        }
            break;
            
        default:
            return UIEdgeInsetsZero;
            break;
    }
}

#pragma mark - 设置collectionView的Cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (collectionView.tag) {
        case UICollectionViewTagChannel:
            return CGSizeMake((kMainBoundsW-75)/4, 40);
            break;
            
        case UICollectionViewTagchannelContent:
        {
            KSLog(@"%s",__FUNCTION__);
            return CGSizeMake((kMainBoundsW-30)/2, 100);
        }
            break;
            
        default:
            return CGSizeZero;
            break;
    }
    
}


#pragma mark - 是否移动Item
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - 移动制定位置的Item到目的区域
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    
}


#pragma mark - 设置collectionView的Cell点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (collectionView.tag) {
        case UICollectionViewTagChannel:
            [self setCellDidSelectorFromCollectionView:collectionView With:indexPath];
            break;
            
        default:
            break;
    }
}



#pragma mark - ---------频道标题的collectionView的对应封装方法-----------
/**设置频道定制collectionView的cell*/
- (void)setCollectionViewTagChannelCellWithCell:(UICollectionViewCell*)cell withIndextPath:(NSIndexPath*)indexPath
{
    [self removeSubViewsForView:cell.contentView];
    UILabel * titleLabel  = [[UILabel alloc]init];
    titleLabel.text = channelDataArray[indexPath.section][indexPath.row];
    titleLabel.textAlignment = 1;
    titleLabel.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.layer.borderColor = SDColor(241, 241, 241, 1).CGColor;
    titleLabel.layer.borderWidth = 1;
    titleLabel.layer.cornerRadius = 3;
    titleLabel.layer.masksToBounds = YES;
    [cell.contentView addSubview:titleLabel];
}

/**设置频道定制CollectionView的区头*/
- (void)setCollectionViewTagChannelHeaderViewWith:(UICollectionReusableView*)headerView with:(NSIndexPath*)indexPath
{
    //移除子视图
    [self removeSubViewsForView:headerView];
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.text = indexPath.section ==0?@"   我的分类":@"   点击添加分类";
    titleLabel.frame = CGRectMake(0, 0, headerView.frame.size.width-80, headerView.frame.size.height);
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = SDColor(241, 241, 241, 1);
    [headerView addSubview:titleLabel];
    
    if (indexPath.section==0) {
        UIButton * edtingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        edtingBtn.backgroundColor = SDColor(241, 241, 241, 1);
        [edtingBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [edtingBtn setTitle:@"完成" forState:UIControlStateSelected];
        [edtingBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [edtingBtn addTarget:self action:@selector(isOpenEdting:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:edtingBtn];
        edtingBtn.sd_layout.topEqualToView(headerView).rightEqualToView(headerView).bottomEqualToView(headerView).widthIs(80);
    }
    
}

/**设置频道定制CollectionViewCell点击事件*/
- (void)setCellDidSelectorFromCollectionView:(UICollectionView*)collectionView With:(NSIndexPath*)indexPath
{
    if (indexPath.section ==0 &&indexPath.row ==0) {
        return;
    }
    if (isOpenEdting) {
        NSString * channelName =  channelDataArray[indexPath.section][indexPath.row];
        NSInteger mubiaoScetion = indexPath.section==0?1:0;
        [channelDataArray[indexPath.section] removeObject:channelName];
        [channelDataArray[mubiaoScetion] addObject:channelName];
        [collectionView reloadData];
    }
}





#pragma mark - -------移除对应视图的子视图------
/**移除子视图*/
- (void)removeSubViewsForView:(UIView*)aView
{
    for (UIView * view in aView.subviews) {
        [view removeFromSuperview];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
