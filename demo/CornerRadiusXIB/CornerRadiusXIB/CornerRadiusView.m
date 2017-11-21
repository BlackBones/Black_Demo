//
//  CornerRadiusView.m
//  CornerRadiusXIB
//
//  Created by 刘波 on 2017/3/21.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import "CornerRadiusView.h"

@implementation CornerRadiusView


- (void)setBorderWidth:(CGFloat)borderWidth {
    
    if (borderWidth < 0) return;
    
    self.layer.borderWidth = borderWidth;
}


- (void)setBorderColor:(UIColor *)borderColor {
    
    self.layer.borderColor = borderColor.CGColor;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

@end
