//
//  UIView+CornerRadius.m
//  CALayer
//
//  Created by 刘波 on 16/4/25.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)


- (void)roundingCorners:(UIRectCorner)corners Radius:(CGFloat)radius{
    
    /**
     *  使用遮罩的方式，当需要圆角的控件很多时候，请慎用，比较影响性能，较少的时候可以时候。
     * 方便，可以随意任意角
     */
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
