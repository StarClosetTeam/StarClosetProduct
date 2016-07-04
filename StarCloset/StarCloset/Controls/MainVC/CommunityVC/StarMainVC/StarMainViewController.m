//
//  StarMainViewController.m
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//



#import "StarMainViewController.h"


typedef enum : NSUInteger {
    UIScrollViewChooseTagMain = 1000,
    UIScrollViewChooseTagTop,
    UIScrollViewChooseTagTabelView,
    UIScrollViewChooseTagCollectionView,
} UIScrollViewChooseTag;

@interface StarMainViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIViewTool * viewTool;

@property (strong, nonatomic) UIView * SpecialOfferView;
@property (strong, nonatomic) UIScrollView * mainScrollView;
@property (strong, nonatomic) UIScrollView * topScrollView;
@property (strong, nonatomic) UITableView * tableView;

@property(strong, nonatomic) NSMutableArray * tableDataArray;

@end

@implementation StarMainViewController
@synthesize viewTool;

- (void)viewDidLoad {
    [super viewDidLoad];
    viewTool =  [UIViewTool shareTool];
    //    主要的ScrollView
    [self createMainScrollView];
    //    设置导航搜索栏
    [self setNavigationSearthTF];
    //    设置顶部ScrollView
    [self setTopScrollView];
    //    设置特价优惠
    [self setSpecialOffer];
    //    设置主要tableView
    [self createTopTableView];
    //    获取tableView的数据
    
}
//    设置搜索栏
- (void)setNavigationSearthTF
{
    [viewTool createTextFieldWithBlcok:^(UIView *view) {
        if (view) {
            self.navigationItem.titleView = view;
        }
    } withTFEditingBlock:^{//开始搜索时调用方法
        [self.navigationController pushViewController:[StarSearchViewController new] animated:YES];
    }];
}
//设置顶部ScrollView
- (void)setTopScrollView
{
    [viewTool createStarMainTopScrollWithViewBlock:^(UIView *view) {
        _topScrollView = (UIScrollView*)view;
        [_mainScrollView addSubview:_topScrollView];
        [_mainScrollView sendSubviewToBack:_topScrollView];
        viewTool.pageContrl.center = CGPointMake(kMainBoundsW/2, 250);
        [_mainScrollView addSubview:viewTool.pageContrl];
    } withButtonBlcok:^{
        KSLog(@"正在点击");
    }];
}
#pragma mark - 创建主要的ScrollView
- (void)createMainScrollView
{
    _mainScrollView = [[UIScrollView alloc]init];
    _mainScrollView.frame = kMainBounds;
    _mainScrollView.contentSize = CGSizeMake(0, 1000);
    [self.view addSubview:_mainScrollView];
    _mainScrollView.tag = UIScrollViewChooseTagMain;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    _mainScrollView.delegate = self;
}
#pragma mark - 设置特价优惠
- (void)setSpecialOffer
{
    [viewTool createSpecialOfferButtonWithBlock:^(UIView *view) {
        _SpecialOfferView = view;
        [_mainScrollView addSubview:_SpecialOfferView];
        _SpecialOfferView.sd_layout.leftEqualToView(_mainScrollView).topSpaceToView(_mainScrollView,290).rightEqualToView(_mainScrollView).heightIs(300);
        
    } withButtonClickBlcok:^(UIView *view) {
        
        SpecialOfferViewController * SpecialOfferVC = [SpecialOfferViewController new];
        [self.navigationController pushViewController:SpecialOfferVC animated:NO ];
    }];
    
}
//创建tableViewView
- (void)createTopTableView
{
    [viewTool  createTopTableViewWithViewBlock:^(UIView *view) {
        static int i = 0;
        i++;
        _tableView = (UITableView*)view;
        [_mainScrollView addSubview:_tableView];
        _tableView.frame = CGRectMake(0, 590, kMainBoundsW, 560*i);
        //        KSLog(@"%@>>>>",NSStringFromCGRect(_tableView.frame));
        [_tableView reloadData];
    } withEventBlock:^(UIView *view) {
        
    }];
}

#pragma mark - 创建CollectionView
- (void)createCollectionView
{
    [viewTool createCollectionViewWithViewBlock:^(UIView *view) {
        
    } withEventBlock:^{
        
    }];
}

//ScrollView滑动调用方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _mainScrollView.contentSize = CGSizeMake(0, _topScrollView.frame.size.height+300+_tableView.contentSize.height);
    //    KSLog(@"主Scroll偏移量%f",scrollView.contentOffset.y);
    
    for (NSInteger i = 0; i<5; i++) {
        if (_mainScrollView.contentOffset.y >= 375+575.5*i) {
            [viewTool getTabelViewDataWithNumber:i+2];
        }
    }
    
    if (_mainScrollView.contentOffset.y >= 3163) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self createCollectionView];
        });
    }
    
}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
