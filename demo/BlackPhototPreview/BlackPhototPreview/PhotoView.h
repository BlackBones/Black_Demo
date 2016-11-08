//
//  PhotoView.h
//  BlackPhototPreview
//
//  Created by 刘波 on 16/11/7.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^singleTapBlock)();

@interface PhotoView : UIView

@property (nonatomic,strong) UIScrollView *scrollview;

@property (nonatomic,strong) UIImageView *imageview;

@property (nonatomic, copy) void (^singleTapBlock)(UITapGestureRecognizer *recognizer);


@end
