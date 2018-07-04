//
//  PositionedButton.h
//  PositionedButton
//
//  Created by 葛佳佳 on 2016/10/13.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PositionedButtonType) {
    PositionedButtonTypeTitleRight,
    PositionedButtonTypeTitleLeft,
    PositionedButtonTypeTitleTop,
    PositionedButtonTypeTitleBottom,
    
};

@interface PositionedButton : UIButton

///titleLabel和imageView摆放位置
@property (nonatomic, assign) PositionedButtonType buttonPositioned;

///titleLabel和imageView的间距
@property (nonatomic, assign) CGFloat imageTitleSpacing;

@end
