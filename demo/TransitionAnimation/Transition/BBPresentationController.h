//
//  SheetPresentationController.h
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/6.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BBActionType){
    
    BBActionTypeSheet  = 0,
    BBActionTypeAlert
};

@interface BBPresentationController : UIPresentationController<UIViewControllerTransitioningDelegate>

@property (nonatomic,assign) BBActionType actionType;

@end
