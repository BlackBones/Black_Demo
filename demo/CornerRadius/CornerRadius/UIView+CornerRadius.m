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
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

@end
