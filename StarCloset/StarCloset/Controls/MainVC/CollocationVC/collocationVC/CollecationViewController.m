//
//  CollecationViewController.m
//  StarCloset
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "CollecationViewController.h"

#define buttonTag 1000
typedef enum : NSUInteger {
    UITitleButtonTagCollocation = 100,
    UITitleButtonTagSpecial,
    
} UITitleButtonTag;

@interface CollecationViewController ()<
UITableViewDataSource,
UITableViewDelegate>{

    UIView *topView;
    UIView *styleView;
    UIScrollView *bgScrollView;
    
    //用于记录tableView的总高度
    CGFloat     _colHeight[2];
}

@property (retain, nonatomic)UIView *identifyingView;
@property (retain, nonatomic)NSMutableArray *dataArr;

@end

@implementation CollecationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor grayColor];
    self.navigationController.navigationBarHidden=YES;
    
    
    [self initTopView];
    [self initbgScroller];
    [self getData];
   
}

#pragma mark - 懒加载数据源
- (NSMutableArray *)dataArray {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


#pragma mark - 获得数据
- (void)getData {
    [RequestData getCollocationNewestDataWithURL:CollocationNewestURL withBlock:^(NSMutableArray *array) {
        NSLog(@"array.count:%ld",array.count);

        self.dataArr=[array copy];
        [self reloadView];
        NSLog(@"dataArr.count:-%ld",self.dataArr.count);
    }];
 }

#pragma mark - 刷新视图
- (void)reloadView {
    
    if (self.dataArray.count == 0) {
        return;
    }
    //遍历数据源
    for (NSInteger i = 0; i < self.dataArray.count;i++) {
        //取出最低列数
        NSInteger index = _colHeight[0] <= _colHeight[1] ? 0 : 1;
        //取出当前数据
        RequestDataModel *model = self.dataArray[i];
        _colHeight[index] += model.height + 50;
    
    bgScrollView.contentSize = CGSizeMake(0, MAX(_colHeight[0], _colHeight[1]));
    
        UITableView *table = (UITableView *)[bgScrollView viewWithTag:5000];
        [table reloadData];
    }
}

-(void)initTopView{

   topView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 60)];
    topView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:topView];
    
   UIButton *collocationBtn=[self createButtonFrame:CGRectMake((kMainBoundsW-130)/2, 20, 50, 40) withTitle:@"搭配" withTag:UITitleButtonTagCollocation withView:topView];
    collocationBtn.selected=YES;
    [collocationBtn addTarget:self action:@selector(changeController:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *specialBtn=[self createButtonFrame:CGRectMake((kMainBoundsW-130)/2+70, 20, 50, 40) withTitle:@"专题" withTag:UITitleButtonTagSpecial withView:topView];
    [specialBtn addTarget:self action:@selector(changeController:) forControlEvents:UIControlEventTouchUpInside];
    
    self.identifyingView=[[UIView alloc]init];
    self.identifyingView.backgroundColor=[UIColor magentaColor];
    self.identifyingView.center=CGPointMake(collocationBtn.center.x, collocationBtn.center.y+18);
    self.identifyingView.bounds=CGRectMake(0, 0, 30, 5);
    [topView addSubview:self.identifyingView];
}

-(void)initbgScroller{
    
    bgScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 61, kMainBoundsW, kMainBoundsH)];
    [self.view addSubview:bgScrollView];
    
    styleView=[[UIView alloc]init];
    [bgScrollView addSubview:styleView];
    NSArray* titleNames = @[@"最新",@"热门",@"欧美",@"日韩",@"本土",@"型男",@"复古",@"甜美",@"街头",@"清新",@"轻熟",@"摩登",@"OL",@"混搭",@"闺蜜",@"休闲",@"逛街",@"约会",@"派对",@"出游",@"典礼",@"运动",@"高挑",@"娇小",@"优选",@"丰满"];
    NSMutableArray *styleButtons=@[].mutableCopy;
    for (NSInteger i = 0; i<titleNames.count; i++) {
     UIButton *button=[self createButtonFrame:CGRectMake(20+i*70, 10, 40, 30) withTitle:titleNames[i] withTag:buttonTag+i withView:styleView];
        [styleButtons addObject:button];
    }
    UIButton *firstBtn=styleButtons[0];
    firstBtn.selected=YES;
    UIButton *lastBtn=[styleButtons lastObject];

    bgScrollView.contentSize=CGSizeMake(lastBtn.center.x+50, kMainBoundsH);
    styleView.frame=CGRectMake(0, 0, lastBtn.center.x+50, 40);
    styleView.backgroundColor=[UIColor whiteColor];
 
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, kMainBoundsW,kMainBoundsH-40) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    //关掉table用户交互性
    //        table.userInteractionEnabled = NO;
    //scroll的滑动属性
    table.tag=5000;
    table.scrollEnabled = NO;
    [bgScrollView addSubview:table];
    //去掉莫名其妙的cell
    table.tableFooterView = [UIView new];
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

    
}


-(UIButton *)createButtonFrame:(CGRect)frame withTitle:(NSString *)title withTag:(NSInteger)tag withView:(UIView *)view{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    button.tag=tag;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor magentaColor] forState:UIControlStateSelected];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    [button addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return button;
}

#pragma mark-----button的点击事件

-(void)changeController:(UIButton *)sender{
    if (sender.tag==UITitleButtonTagCollocation||sender.tag==UITitleButtonTagSpecial) {
        UIButton *oldButton=[topView viewWithTag:UITitleButtonTagCollocation ];
        UIButton *newBtn=[topView viewWithTag:UITitleButtonTagSpecial];
        oldButton.selected=newBtn.selected=NO;
        sender.selected=YES;
        [UIView animateWithDuration:0.5 animations:^{
            
            self.identifyingView.center=CGPointMake(sender.center.x, sender.center.y+18);
        }];
    }
}


-(void)changeView:(UIButton *)sender{

}


    

#pragma mark-----tableView的代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RequestDataModel *model=self.dataArr[indexPath.row];
    
    if (model.height > 0) {
            return model.height + 5;
        }
    return 0.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    RequestDataModel *model=self.dataArr[indexPath.row];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, model.height)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.picurl]];
    [cell.contentView addSubview:imageView];
    
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
