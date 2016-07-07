//
//  UIViewTool.m
//  StarCloset
//
//  Created by Mac on 16/7/3.
//  Copyright © 2016年 王照柯. All rights reserved.
//

#import "UIViewTool.h"

static UIViewTool * _tool;

@interface UIViewTool ()

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





@end
