//
//  AlertAnimation.h
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/7.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPresenting;

@end
