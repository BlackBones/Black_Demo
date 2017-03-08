//
//  TestAnimatedTransition.m
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/6.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import "SheetAnimation.h"

@implementation SheetAnimation

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
    
    CGFloat toViewHeight = CGRectGetHeight(toViewFinalFrame);
    
    toViewInitialFrame.origin = CGPointMake(CGRectGetMinX(containerView.bounds), CGRectGetMaxY(containerView.bounds));
    toViewInitialFrame.size = toViewFinalFrame.size;
    toView.frame = toViewInitialFrame;
    
    NSTimeInterval duration = [self transitionDuration:context];
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        toView.frame = toViewFinalFrame;
        
    } completion:^(BOOL finished) {
        
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
    
    
     fromViewFinalFrame = CGRectOffset(fromView.frame, 0, CGRectGetHeight(fromView.frame));
    
    
    NSTimeInterval duration = [self transitionDuration:context];
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        fromView.frame = fromViewFinalFrame;
        
    } completion:^(BOOL finished) {
        
        BOOL wasCancelled = [context transitionWasCancelled];
        [context completeTransition:!wasCancelled];
    }];
    
}


@end
