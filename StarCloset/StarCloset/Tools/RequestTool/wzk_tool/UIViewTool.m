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
}

@property (copy, nonatomic) eventBlock  starViewBlcok;
@property (copy, nonatomic) eventBlock  buttonBlock;


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

- (void)createStarMainTopScrollWithViewBlock:(viewBlock)blockA withButtonBlcok:(eventBlock)event
{
    [RequestTool requestStarClosetDataWith:^(NSArray *array) {
        if (array.count>0) {
            scrollModelarray = array;
        UIScrollView * starMainTopScroll =  [self setScrollViewWithArray:array];
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


//创建ScrollView
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
//        KSLog(@"%@",model.picUrl);
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

//button点击事件
- (void)goToDetailsVC:(UIButton*)sender
{
    self.buttonBlock();
}

//添加pageControl
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

- (void)AutomaticCycle
{
    topScrollView.contentOffset = CGPointMake(topScrollView.contentOffset.x+kMainBoundsW, 0);
    
    if (topScrollView.contentOffset.x == kMainBoundsW*6) {
        topScrollView.contentOffset = CGPointMake(0, 0);
    }
    pageContrl.currentPage = topScrollView.contentOffset.x/kMainBoundsW;
    
}


@end
