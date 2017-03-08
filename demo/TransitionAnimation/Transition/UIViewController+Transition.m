//
//  UIViewController+Transition.m
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/1.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import "UIViewController+Transition.h"


@implementation UIViewController (Transition)


- (void)bone_presentViewController:(UIViewController *)toViewController actionType:(BBActionType)actionType completion:(void (^)(void))completion{
    
    BBPresentationController *presentationController= [[BBPresentationController alloc] initWithPresentedViewController:toViewController presentingViewController:self];
    presentationController.actionType = actionType;
//    toViewController.providesPresentationContextTransitionStyle = YES;
//    toViewController.definesPresentationContext = YES;
    toViewController.modalPresentationStyle = UIModalPresentationCustom;
    toViewController.transitioningDelegate = presentationController;
    
    
    
    [self presentViewController:toViewController animated:YES completion:completion];
    
    
}





@end
