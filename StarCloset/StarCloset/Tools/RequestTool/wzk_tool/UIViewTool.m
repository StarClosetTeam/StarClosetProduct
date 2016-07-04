//
//  UIViewTool.m
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "UIViewTool.h"

static UIViewTool * _tool;

@interface UIViewTool ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    UIScrollView * topScrollView;
    NSArray * scrollModelarray;
    NSMutableArray * numberArr ;
}

@property (copy, nonatomic) eventBlock  starViewBlcok;
@property (copy, nonatomic) eventBlock  buttonBlock;
@property (copy, nonatomic) viewBlock  specialOfferBlock;

@property (strong,nonatomic) UITableView * mainTabelView;
@property (strong, nonatomic) NSMutableArray * tableDataArray;
@property (copy, nonatomic) viewBlock  tableButtonBlcok;
@property (copy, nonatomic) viewBlock  tableBlock;

@property (strong, nonatomic) UICollectionView * mainCollectionView;
@property (strong, nonatomic) NSMutableArray * collectionDataArray;

@end

@implementation UIViewTool
@synthesize pageContrl;

+ (instancetype)shareTool
{
    _tool = [[self alloc] init];
    
    return _tool;
}

 + (instancetype)alloc
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tool = [super alloc];
    });
    return _tool;
}
#pragma mark - 创建首页搜索的textField
- (void)createTextFieldWithBlcok:(viewBlock)block withTFEditingBlock:(eventBlock)tfBock
{
            UITextField * searchTF = [self createNavMiddleTextField];
            if (block) {
                block(searchTF);
                self.starViewBlcok = tfBock;
            }

}

/*创建首页搜索的textField*/
- (UITextField*)createNavMiddleTextField
{
    UITextField * NavMiddleTextField = [[UITextField alloc]init];
    NavMiddleTextField.bounds = CGRectMake(0, 0, 200, 38);
    NavMiddleTextField.backgroundColor = [UIColor lightGrayColor];
    NavMiddleTextField.borderStyle = UITextBorderStyleRoundedRect;
    NavMiddleTextField.placeholder = @"🔍单品/品牌/红人";
    NavMiddleTextField.clearButtonMode  = UITextFieldViewModeAlways;
    [NavMiddleTextField addTarget:self action:@selector(search:) forControlEvents:UIControlEventEditingDidBegin];
    return NavMiddleTextField;
}
/*输入框搜索调用方法*/
- (void)search:(UITextField*)sender
{
    if (self.starViewBlcok) {
        self.starViewBlcok();
    }
}

#pragma mark - 创建ScrollView
- (void)createStarMainTopScrollWithViewBlock:(viewBlock)blockA withButtonBlcok:(eventBlock)event
{
    [RequestTool requestStarClosetDataWith:^(NSArray *array) {
        if (array.count>0) {
            scrollModelarray = array;
        UIScrollView * starMainTopScroll =  [self setScrollViewWithArray:scrollModelarray];
            if (blockA) {
                [_tool createPageControl];
                blockA(starMainTopScroll);
                topScrollView = starMainTopScroll;
                [self addAutomaticCycleTimer];
            }
            if (event) {
                self.buttonBlock = event;
            }
        }
    }];
    
}

//根据数据源创建ScrollView
- (UIScrollView*)setScrollViewWithArray:(NSArray*)array
{
    
    StarMainTopScrollModel * model;
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    for (NSInteger i = 0; i<=array.count; i++) {
        if (i<array.count) {
            model = array[i];
        }else
        {
            model = array[0];
        }
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
        button.frame = CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, kMainBoundsW*model.height/model.width);
        [button addTarget:self action:@selector(goToDetailsVC:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];
    }
    scrollView.frame = CGRectMake(0, 0, kMainBoundsW, kMainBoundsH);
    scrollView.contentSize = CGSizeMake(kMainBoundsW*array.count, 0);
    scrollView.pagingEnabled = YES;
    return scrollView;
}

//顶部ScrollView上的button点击事件
- (void)goToDetailsVC:(UIButton*)sender
{
    self.buttonBlock();
}

//ScrollView添加pageControl
- (void)createPageControl
{
    pageContrl = [[UIPageControl alloc]init];
    pageContrl.numberOfPages = scrollModelarray.count;
    pageContrl.bounds = CGRectMake(0, 0, kMainBoundsW, 0);
    pageContrl.currentPageIndicatorTintColor = [UIColor redColor];
    pageContrl.backgroundColor = [UIColor magentaColor];
}

//添加循环定时器
- (void)addAutomaticCycleTimer
{
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(AutomaticCycle) userInfo:nil repeats:YES];
}
//定时器方法
- (void)AutomaticCycle
{
    topScrollView.contentOffset = CGPointMake(topScrollView.contentOffset.x+kMainBoundsW, 0);
    
    if (topScrollView.contentOffset.x == kMainBoundsW*scrollModelarray.count) {
        topScrollView.contentOffset = CGPointMake(0, 0);
    }
    pageContrl.currentPage = topScrollView.contentOffset.x/kMainBoundsW;
    
}

#pragma mark - 根据请求创建特价优惠View
- (void)createSpecialOfferButtonWithBlock:(viewBlock)Blcok withButtonClickBlcok:(viewBlock)eventBlock
{
    [RequestTool requestDataForSpecialOfferWithBlcok:^(NSArray *array) {
        if (array.count>0) {
            UIView * view = [UIView new];
            view.backgroundColor = [UIColor whiteColor];
            
            for (NSInteger i = 0; i<array.count; i++) {
                StarSpecialOfferModel * model = array[i];
                UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//                KSLog(@"%@",model.img_index);
                [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img_index] forState:UIControlStateNormal];
                button.frame = CGRectMake(10+(kMainBoundsW/2-10)*i, 0, kMainBoundsW/2-15, 300);
                [button addTarget:self action:@selector(goToSpecialOfferVC:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:button];
            }
            if (Blcok) {
                Blcok(view);
                self.specialOfferBlock = eventBlock;
            }
        }
    }];
}
//特价优惠Button点击事件
- (void)goToSpecialOfferVC:(UIButton*)sender
{
    if (self.specialOfferBlock) {
        self.specialOfferBlock(sender);
    }
}

#pragma mark - 创建tabelView
- (void)createTopTableViewWithViewBlock:(viewBlock)block withEventBlock:(viewBlock)buttonBlock
{
    UITableView*  topTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 414, 300) style:UITableViewStylePlain];
    topTableView.delegate = self;
    topTableView.dataSource = self;
    topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [topTableView registerClass:[StarMainTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.mainTabelView = topTableView;
    
    self.tableBlock = block;
//    初始化数组
    self.tableDataArray = [NSMutableArray array];
    [self getTabelViewDataWithNumber:1];
    self.tableButtonBlcok = buttonBlock;
    
    numberArr = [NSMutableArray array];
}
#pragma mark - -----tableView协议方法-------
/*回调函数，设置tableView每区多少个cell*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
/*回调函数，设置tableViewcell的内容*/
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StarMainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.modelArray = self.tableDataArray[indexPath.section];
    return cell;
}
/*回调函数，设置tableView有多少个区*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableDataArray.count;
}
/*回调函数，设置tableViewCell的行高*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 557.5;
}

/*获取tableView数据源*/
- (void)getTabelViewDataWithNumber:(NSInteger)number
{
   
    if ([numberArr containsObject:@(number)]) {
        return;
    }
     [numberArr addObject:@(number)];

    [RequestTool requestDateForFindLibraryWithLibraryID:number WithBlock:^(NSArray *array) {
        [_tableDataArray addObject:array];

        if (_tableBlock) {
            _tableBlock(_mainTabelView);
        }
    }];
}

//创建CollectionView
- (void)createCollectionViewWithViewBlock:(viewBlock)blockA withEventBlock:(eventBlock)blockB
{
    [RequestTool requestDataForClassificationWithID:1 withRequestBlcok:^(NSArray *array) {
        if (array.count>0) {
            
            _collectionDataArray = [NSMutableArray arrayWithArray:array];
            [self createCollectionView];
            
        }
    }];
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

    /*注册重用cell*/
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    /*注册重用区头区尾View*/
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}

#pragma mark - ----------------collectionView协议方法-----------------

/*设置collectionView行数-默认为20*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionDataArray.count;
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


@end
