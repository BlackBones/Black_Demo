//
//  BlackTabBar.h
//  BlackTabBar
//
//  Created by 刘波 on 16/7/5.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlackTabBar;

@protocol BlackTabBarDelegate <UITabBarDelegate>

- (void)blackTabBar:(BlackTabBar *)tabBar didSelectMiddleButton:(UIButton *)M_Button;

@end


@interface BlackTabBar : UITabBar

@property (nonatomic,weak) id<BlackTabBarDelegate> blackDelegate;

@end
