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

@interface StarMainViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UIViewTool * viewTool;
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
    
    [self createMainScrollView];
    
    [self setNavigationSearthTF];
    
    [self setTopScrollView];
    
    [self createTopTableView];
    
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
}
#pragma mark - 创建tabelView
- (void)createTopTableView
{
    UITableView*  topTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, 0, 0) style:UITableViewStyleGrouped];
    topTableView.delegate = self;
    topTableView.dataSource = self;
    topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    /**自定义Cell时注意更改注册类及xid*/
    [topTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:topTableView];
    topTableView.tag = UIScrollViewChooseTagTabelView;
    _tableView = topTableView;
}
#pragma mark - -----tableView协议方法-------
/**回调函数，设置tableView每区多少个cell*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /**注意数据源数量*/
    return 0;
}
/**回调函数，设置tableViewcell的内容*/
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**注意返回cell的类型*/
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}
/**回调函数，设置tableView有多少个区*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**回调函数，设置tableViewCell的行高*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 209;
}
/**回调函数，设置tableView区头的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
/**回调函数，设置tableView区尾的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

/*获取tableView的数据源*/
- (void)getTableViewData
{
    
}

//ScrollView滑动调用方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
