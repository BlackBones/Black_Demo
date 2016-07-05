//
//  MainTabBarController.m
//  BlackTabBar
//
//  Created by 刘波 on 16/7/5.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "MainTabBarController.h"
#import "BlackTabBar.h"

// RGB颜色
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface MainTabBarController ()<BlackTabBarDelegate>

@end

@implementation MainTabBarController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    BlackTabBar *blackTabBar = [[BlackTabBar alloc] init];
    
    blackTabBar.blackDelegate = self;
    
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:blackTabBar forKey:@"tabBar"];
    
    // 添加子控制器
    [self addChildVc:[[UIViewController alloc] init] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    [self addChildVc:[[UIViewController alloc] init] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    [self addChildVc:[[UIViewController alloc] init] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    [self addChildVc:[[UIViewController alloc] init] title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
}

- (void)blackTabBar:(BlackTabBar *)tabBar didSelectMiddleButton:(UIButton *)M_Button{
    
    NSLog(@"didSelectMiddleButton");
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBColor(123, 123, 123)} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    // 为子控制器包装导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
    
}



@end
