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

@property (strong, nonatomic) UIView * SpecialOfferView;
@property (strong, nonatomic) UIScrollView * mainScrollView;
@property (strong, nonatomic) UIScrollView * topScrollView;


@property (strong, nonatomic) UICollectionView * bottomCollectionView;
@property(strong, nonatomic) NSMutableArray * collectionDataArray;


@property (strong , nonatomic) UITableView * mainTableView;
@property (strong, nonatomic) NSMutableArray * mainTableDataArray;

@end

@implementation StarMainViewController
@synthesize viewTool;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*初始化总数据源为二维数组*/
    [self setMainTableDataArray];
    
    viewTool =  [UIViewTool shareTool];
    /*设置搜索栏*/
    [self setNavigationSearthTF];
    /*获取tableView第一个区上Scrollview的数据源*/
    [self getMainTableViewFirstSectionScrollData];
    /*获取特价优惠数据 第二区*/
    [self getSpecialOfferData];
    /*获取第三个区的数据*/
    [self getCountriesData];
    /*创建主体tableView*/
    [self createMainTabelView];
    
    
}
//初始化mainTableDataArray为二维数组 总共四个区  每区一个数据源
- (void)setMainTableDataArray
{
    self.mainTableDataArray = [NSMutableArray arrayWithObjects:[NSMutableArray array],[NSMutableArray array],[NSMutableArray array],[NSMutableArray array], nil];
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


#pragma mark - ScrollView滑动调用方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    NSInteger  number = [[NSString stringWithFormat:@"%f",(scrollView.contentOffset.y+460)/560] integerValue];
    
//    KSLog(@"%f>>>>%ld",scrollView.contentOffset.y,number);
    switch (number) {
        case 1:
        {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [databaseTool  selectDataFormCountriesTabelWithID:number+1 withModelBlcok:^(NSArray *array) {
                    if (array.count>0) {
                        [_mainTableDataArray[2] addObject:array];
                        [_mainTableView reloadData];
                    }
                }];
            });
        }
            break;
        case 2:
        {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [databaseTool  selectDataFormCountriesTabelWithID:number+1 withModelBlcok:^(NSArray *array) {
                    if (array.count>0) {
                        [_mainTableDataArray[2] addObject:array];
                        [_mainTableView reloadData];
                    }
                }];
            });
        }
            break;
        case 3:
        {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [databaseTool  selectDataFormCountriesTabelWithID:number+1 withModelBlcok:^(NSArray *array) {
                    if (array.count>0) {
                        [_mainTableDataArray[2] addObject:array];
                        [_mainTableView reloadData];
                    }
                }];
            });
        }
            break;
        case 4:
        {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [databaseTool  selectDataFormCountriesTabelWithID:number+1 withModelBlcok:^(NSArray *array) {
                    if (array.count>0) {
                        [_mainTableDataArray[2] addObject:array];
                        [_mainTableView reloadData];
                    }
                }];
            });
        }
            break;
        case 5:
        {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [databaseTool  selectDataFormCountriesTabelWithID:number+1 withModelBlcok:^(NSArray *array) {
                    if (array.count>0) {
                        [_mainTableDataArray[2] addObject:array];
                        [_mainTableView reloadData];
                    }
                }];
            });
        }
            
        case 6:
        {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [databaseTool selectDataFormCalssWithID:1 TabelWithModelBlcok:^(NSArray *array) {
                    if (array.count>0) {
                        _mainTableDataArray[3] = array;
//                        KSLog(@"发送查询数据的请求%ld---%ld",array.count,[_mainTableDataArray[3] count]);
                    }
                    [_mainTableView reloadData];
                }];
                
            });
        }
            break;
        default:
            break;
    }
}

#pragma mark - 获取特价优惠数据
- (void)getSpecialOfferData
{
    [databaseTool selectDataFormTabelSpecialOfferWithModelBlcok:^(NSArray *array) {
        if (array.count>0) {
            [_mainTableDataArray[1] addObject:array];
        }
    }];
    [self setViewWithArray:_mainTableDataArray[1][0]];
}
/*优惠UI*/
- (void)setViewWithArray:(NSArray*)array
{
    _SpecialOfferView = [UIView new];
    _SpecialOfferView.backgroundColor = [UIColor whiteColor];
    
    for (NSInteger i = 0; i<array.count; i++) {
        StarSpecialOfferModel * model = array[i];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img_index] forState:UIControlStateNormal];
        button.frame = CGRectMake(10+(kMainBoundsW/2-10)*i, 0, kMainBoundsW/2-15, 300);
        [button addTarget:self action:@selector(goToSpecialOfferVC:) forControlEvents:UIControlEventTouchUpInside];
        [_SpecialOfferView addSubview:button];
    }
}

//特价优惠Button点击事件
- (void)goToSpecialOfferVC:(UIButton*)sender
{
    
}

/**获取顶部scrollview的数据源*/
- (void)getMainTableViewFirstSectionScrollData
{
    [databaseTool selectDataFormTabelStarMainTopScrollModelWithModelBlcok:^(NSArray *array) {
        
        [[_mainTableDataArray firstObject] addObject:array];
        [_mainTableView reloadData];
        
    }];
    [self setScrollViewWithArray:self.mainTableDataArray[0][0]];
}

//创建主体框架MainTAbleVIew
- (void)createMainTabelView
{
    _mainTableView = [[UITableView alloc]initWithFrame:kMainBounds style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_mainTableView registerClass:[StarMainTableViewCell class] forCellReuseIdentifier:@"fourScroll"];
    
    [self.view addSubview:_mainTableView];
}

#pragma mark - -----tableView协议方法-------
/*回调函数，设置tableView每区多少个cell*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    KSLog(@"回调函数，%ld多少个cell%ld",section,[self.mainTableDataArray[section] count]);
    if (section == 3) {
        return  [self.mainTableDataArray[section] count]/2;
    }
    return [self.mainTableDataArray[section] count];
}
/*回调函数，设置tableViewcell的内容*/
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            [self removeSubViewsFromView:cell.contentView];
            [cell.contentView addSubview:_topScrollView];
            _topScrollView.sd_layout.topEqualToView(cell.contentView).leftEqualToView(cell.contentView).rightEqualToView(cell.contentView).bottomEqualToView(cell.contentView);
            return cell;
        }
            break;
            
        case 1:
        {
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            [self removeSubViewsFromView:cell.contentView];
            [cell.contentView addSubview:_SpecialOfferView];
            _SpecialOfferView.sd_layout.topEqualToView(cell.contentView).leftEqualToView(cell.contentView).rightEqualToView(cell.contentView).bottomEqualToView(cell.contentView);
            return cell;
        }
            break;
            
        case 2:
        {
            //                        StarMainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"fourScroll" forIndexPath:indexPath];
            StarMainTableViewCell * cell = [[StarMainTableViewCell alloc]init];
            //                        [self removeSubViewsFromView:cell.contentView];
//            KSLog(@"*+*+*++*+***");
            //            for (UIView * view in cell.contentView.subviews) {
            //                [view removeFromSuperview];
            //            }
            cell.modelArray = self.mainTableDataArray[indexPath.section][indexPath.row];
            return cell;
        }
            break;
        case 3:
        {
            UITableViewCell * cell = [[UITableViewCell alloc]init];
            UIView * leftView =  [self setViewWithModel:_mainTableDataArray[3][indexPath.row] withLocation:NO];
            UIView * rightView =  [self setViewWithModel:_mainTableDataArray[3][indexPath.row+1] withLocation:YES];
            [cell.contentView addSubview:leftView];
            [cell.contentView addSubview:rightView];
            return cell;
        }
            break;
            
        default:
            return nil;
            break;
    }
    
}


//给自定义控件赋值
- (UIView*)setViewWithModel:(StarMainClassificationModel*)model withLocation:(BOOL)isRight
{
    UIView * bgView = [[UIView alloc]init];
    bgView.frame = CGRectMake(kMainBoundsW/2*isRight, 0, kMainBoundsW/2, 380);
    //    商品图片
    UIImageView * godImageView = [[UIImageView alloc]init];
    godImageView.frame = CGRectMake(0, 0, model.needW, 300);
    NSString * imageURL = [[model.model.picUrl componentsSeparatedByString:@"?"] firstObject];
    [godImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    [bgView addSubview:godImageView];
    //    国旗图标
    UIImageView * countryImageView = [[UIImageView alloc]init];
    
    [countryImageView sd_setImageWithURL:[NSURL URLWithString:model.model.nationalFlag]];
    [bgView addSubview:countryImageView];
    countryImageView.sd_layout.topSpaceToView(godImageView,5).leftSpaceToView(bgView,10).widthIs(15).heightIs(15);
    //    国家名字
    UILabel * countryNameLabel = [[UILabel alloc]init];
    countryNameLabel.text = model.model.country;
    [bgView addSubview:countryNameLabel];
    countryNameLabel.sd_layout.topEqualToView(countryImageView).leftSpaceToView(countryImageView,0).rightSpaceToView(bgView,10).bottomEqualToView(countryImageView);
    
    //    商品标题
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.text = model.model.Description;
    [bgView addSubview:titleLabel];
    titleLabel.sd_layout.topSpaceToView(countryImageView,6).leftEqualToView(countryImageView).rightSpaceToView(bgView,10).heightIs(20);
    
    //    商品价格
    UILabel * priceLabel = [[UILabel alloc]init];
    priceLabel.text = [NSString stringWithFormat:@"￥%@",model.model.price];
    priceLabel.textColor = [UIColor redColor];
    priceLabel.font = [UIFont systemFontOfSize:20];
    [bgView addSubview:priceLabel];
    priceLabel.sd_layout.topSpaceToView(titleLabel,0).leftEqualToView(titleLabel).rightEqualToView(titleLabel).heightIs(30);
    
    return bgView;
}


/*回调函数，设置tableView有多少个区*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.mainTableDataArray.count;
}
/*回调函数，设置tableViewCell的行高*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return _topScrollView.height;
            break;
            
        case 1:
            return 300;
            break;
            
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                    return  585.12;  // [self jisuanCellHeightWithRow:0];
                    break;
                case 1:
                    return 557.52;  // [self jisuanCellHeightWithRow:1];
                    break;
                case 2:
                    return  585.12; // [self jisuanCellHeightWithRow:2];
                    break;
                case 3:
                    return  585.12; // [self jisuanCellHeightWithRow:3];
                    break;
                case 4:
                    return  535.44; // [self jisuanCellHeightWithRow:4];
                    break;
                case 5:
                    return  563.04; // [self jisuanCellHeightWithRow:5];
                    break;
                    
                default: return 0.0;
                    break;
            }
        }
            break;
            
        case 3:
            return 380;
            break;
            
        default: return 600;
            break;
    }
    
}
/*回调函数，设置tableView区头的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 80;
    }
    return 0.01;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        UIView * btnsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 80)];
        NSArray * btnNameS = @[@"今日新上",@"上装",@"群装",@"裤装"];
        for (NSInteger i =0 ; i<4; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*(kMainBoundsW/4), 30, kMainBoundsW/4, 40);
            [btnsView addSubview:button];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [button setTitle:btnNameS[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(goToNewClass:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i+1;
        }
        return btnsView;
    }
    return nil;
}


/*回调函数，设置tableView区尾的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
//计算各个馆Cell的高度
- (CGFloat)jisuanCellHeightWithRow:(NSInteger)RowID
{
    NSArray * array = self.mainTableDataArray[2][RowID];
    CGFloat ScrollHeight;
    for (NSInteger i = 0; i<array.count; i++) {
        NSArray * arr = array[i];
        CGFloat cellHeight;
        StarMainTopScrollModel * model = arr[0];
        if (model.width>kMainBoundsW) {
            cellHeight = model.height*kMainBoundsW/model.width;
        }else
        {
            cellHeight = model.height/(750/kMainBoundsW);
        }
        ScrollHeight += cellHeight;
    }
//    KSLog(@"cell高度%f------%ld",ScrollHeight,RowID);
    return ScrollHeight;
}

/**移除子视图方法*/
- (void)removeSubViewsFromView:(UIView*)aView
{
    for (UIView * view in aView.subviews) {
        [view removeFromSuperview];
    }
}

- (void)goToNewClass:(UIButton*)sender
{
    static UIButton * button ;
    button.selected = NO;
    sender.selected = YES;
    button = sender;
    
    [RequestTool requestDataForClassificationWithID:sender.tag withRequestBlcok:^(NSArray *array) {
        [databaseTool createClassTabelWithID:sender.tag];
        [databaseTool insertDataToTabelClassID:sender.tag With:array];
        [self getDataForTableClassID:sender.tag];
    }];
    
    
}
/*从数据库获取数据*/
- (void)getDataForTableClassID:(NSInteger)ID
{
    [databaseTool selectDataFormCalssWithID:ID TabelWithModelBlcok:^(NSArray *array) {
        [_mainTableDataArray[3] removeAllObjects];
        [_mainTableDataArray[3] addObject:array];
    }];
}

//根据数据源创建ScrollView
- (void)setScrollViewWithArray:(NSArray*)array
{
    StarMainTopScrollModel * model;
    _topScrollView = [[UIScrollView alloc]init];
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
        [_topScrollView addSubview:button];
    }
    _topScrollView.bounds = CGRectMake(0, 0, kMainBoundsW, kMainBoundsW*model.height/model.width);
    _topScrollView.contentSize = CGSizeMake(kMainBoundsW*array.count, 0);
    _topScrollView.pagingEnabled = YES;
}

//顶部ScrollView上的button点击事件
- (void)goToDetailsVC:(UIButton*)sender
{
//    KSLog(@"顶部ScrollView");
}

/*获取第三区数据*/
- (void)getCountriesData
{
    //    for (NSInteger i = 1; i<=6; i++) {
    [databaseTool selectDataFormCountriesTabelWithID:1 withModelBlcok:^(NSArray *array) {
        if (array.count>0) {
            [_mainTableDataArray[2] addObject:array];
        }
    }];
    //    }
    [_mainTableView reloadData];
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
