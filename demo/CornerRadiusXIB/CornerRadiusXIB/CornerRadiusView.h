//
//  CornerRadiusView.h
//  CornerRadiusXIB
//
//  Created by 刘波 on 2017/3/21.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

//让Xcode动态刷新图形化界面
IB_DESIGNABLE

@interface CornerRadiusView : UIView


//加上IBInspectable就可以可视化显示相关的属性

/**
 圆角弧度
 */
@property (nonatomic) IBInspectable CGFloat cornerRadius;


/**
 边框宽度
 */
@property (nonatomic) IBInspectable CGFloat borderWidth;


/**
 填充颜色
 */
@property (nonatomic) IBInspectable UIColor *borderColor;


@end
