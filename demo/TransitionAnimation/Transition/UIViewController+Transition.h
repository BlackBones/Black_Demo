//
//  UIViewController+Transition.h
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/1.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BBPresentationController.h"



@interface UIViewController (Transition)


- (void)bone_presentViewController:(UIViewController *)toViewController actionType:(BBActionType)actionType completion:(void (^)(void))completion;




@end
