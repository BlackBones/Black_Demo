//
//  SheetPresentationController.m
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/6.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import "BBPresentationController.h"
#import "SheetAnimation.h"
#import "AlertAnimation.h"

@interface BBPresentationController ()

@property (nonatomic,strong) UIView *dimmingView;

@property (nonatomic, assign) BOOL isPresenting;

@end

@implementation BBPresentationController


- (void)presentationTransitionWillBegin{
    
    UIView *dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    dimmingView.backgroundColor = [UIColor blackColor];
    [self.containerView addSubview:dimmingView];
    self.dimmingView = dimmingView;
    
    if (self.actionType == BBActionTypeSheet) {
        [dimmingView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimmingViewTapped:)]];
    }
    
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
    
    self.dimmingView.alpha = 0.f;
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 0.5f;
    } completion:NULL];
    
}

- (void)dimmingViewTapped:(UITapGestureRecognizer*)sender
{
    NSLog(@"dimmingViewTapped");
    [self.presentedViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)presentationTransitionDidEnd:(BOOL)completed{
    
    if (!completed) {
        [self.dimmingView removeFromSuperview];
    }
}

- (void)dismissalTransitionWillBegin{
    
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
    
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 0.f;
    } completion:NULL];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed{
    
    if (!completed) {
        [self.dimmingView removeFromSuperview];
    }
}


- (CGRect)frameOfPresentedViewInContainerView{
    
    CGRect containerViewBounds = self.containerView.bounds;
    CGSize presentedViewContentSize = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:containerViewBounds.size];
    
    CGRect presentViewFrame = self.presentedView.frame;//问题？？？？
    
    CGRect presentedViewControllerFrame = containerViewBounds;

    if (self.actionType == BBActionTypeAlert) {
        
        presentedViewControllerFrame = UIEdgeInsetsInsetRect(presentedViewControllerFrame, UIEdgeInsetsMake(presentedViewControllerFrame.size.height * 1/3, 40.0, presentedViewControllerFrame.size.height * 1/3, 40.0));
    }else{
        
        presentedViewControllerFrame = CGRectMake(0, 300, presentedViewControllerFrame.size.width, presentedViewControllerFrame.size.height - 300);
    }
    
    return presentedViewControllerFrame;
}

#pragma UIViewControllerTransitioningDelegate

- (UIPresentationController*)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    NSAssert(self.presentedViewController == presented, @"You didn't initialize %@ with the correct presentedViewController.  Expected %@, got %@.",
             self, presented, self.presentedViewController);
    
    return self;
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    if (self.actionType == BBActionTypeAlert) {
        AlertAnimation *alert = [[AlertAnimation alloc] init];
        alert.isPresenting = YES;
        return alert;
    }else{
        
        SheetAnimation *transition = [[SheetAnimation alloc] init];
        transition.isPresenting = YES;
        return transition;
    }
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    if (self.actionType == BBActionTypeAlert) {
        AlertAnimation *alert = [[AlertAnimation alloc] init];
        return alert;
    }else{
        SheetAnimation *transition = [[SheetAnimation alloc] init];
        return transition;
    }
}








@end














