//
//  UIView+CornerRadius.h
//  CALayer
//
//  Created by 刘波 on 16/4/25.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)


/**
 使用遮罩的方式，当需要圆角的控件很多时候，请慎用，比较影响性能，较少的时候可以时候。
 方便，可以随意任意角
 */
- (void)roundingCorners:(UIRectCorner)corners Radius:(CGFloat)radius;

@end
