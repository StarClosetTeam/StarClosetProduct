//
//  WelcomeViewController.m
//  MaleClothingState
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 王照柯. All rights reserved.
//


#define VIEWCONTROLLER UINavigationController

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBackgroundImageView];
    
}
/**创建欢迎图片*/
- (void)createBackgroundImageView
{
    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:KMainFrame];
    
    bgImageView.image = [UIImage imageNamed:@"welcome.png"];
    
    [self.view addSubview:bgImageView];
//    延迟进入下一个界面
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
        [self pushNextViewController];
        
    });
}
/*进入主界面*/
- (void)pushNextViewController
{
    UITabBarController * tabBarVC = [[UITabBarController alloc]init];


    VIEWCONTROLLER * mainNavigation = [self createNavigationVCWith:[MainViewController new] andTitle:@"首页"];
    
    
    [tabBarVC setViewControllers:@[mainNavigation]];
    
    [self.navigationController pushViewController:tabBarVC animated:YES];
}
/**
 *  创建tabBar五个界面
 *
 *  @param viewController 五个导航控制器的根视图
 *  @param title          tabBar的标题
 */
- (UINavigationController*)createNavigationVCWith:(UIViewController*)viewController andTitle:(NSString*)title
{
    
    UINavigationController * navigation = [[UINavigationController alloc]initWithRootViewController:viewController];
//    设置tabBar标题
    navigation.tabBarItem.title = title;
//    设置tabBar图片
    navigation.tabBarItem.image = [UIImage imageNamed:@""];
    
    return navigation;

}

/*隐藏导航条*/
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
