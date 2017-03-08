//
//  AlertAnimation.m
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/7.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import "AlertAnimation.h"

@implementation AlertAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    if (_isPresenting) {
        [self presentAnimateTransition:transitionContext];
    }else {
        [self dismissAnimateTransition:transitionContext];
    }
}

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)context{
    
    UIViewController *toViewController = [context viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = [context viewForKey:UITransitionContextToViewKey];
    
    UIView *containerView = [context containerView];
    
    [containerView addSubview:toView];
    
    CGRect toViewInitialFrame = [context initialFrameForViewController:toViewController];
    CGRect toViewFinalFrame = [context finalFrameForViewController:toViewController];
    
    toView.frame = toViewFinalFrame;
    
    NSTimeInterval duration = [self transitionDuration:context];
    toView.alpha = 0.0;
    toView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        toView.alpha = 1.0;
        toView.transform = CGAffineTransformMakeScale(1.05, 1.05);
        
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.15 animations:^{
                toView.transform = CGAffineTransformIdentity;
            } completion:nil];
        }
        
        BOOL wasCancelled = [context transitionWasCancelled];
        [context completeTransition:!wasCancelled];
    }];
    
    
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)context{
    UIViewController *fromVC = [context viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [context containerView];
    
    UIView *fromView = [context viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [context viewForKey:UITransitionContextToViewKey];
    
    [containerView addSubview:toView];
    //    [containerView addSubview:toVC.view];会黑屏 iOS 7 的写法
    
    CGRect fromViewInitialFrame = [context initialFrameForViewController:fromVC];
    
    CGRect fromViewFinalFrame = [context finalFrameForViewController:fromVC];
    
    
    NSTimeInterval duration = [self transitionDuration:context];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        fromView.alpha = 0.0;
        fromView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        
    } completion:^(BOOL finished) {
        
        BOOL wasCancelled = [context transitionWasCancelled];
        [context completeTransition:!wasCancelled];
    }];
    
}



@end
