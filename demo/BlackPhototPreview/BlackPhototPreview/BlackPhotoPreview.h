//
//  BlackPhotoPreview.h
//  BlackPhototPreview
//
//  Created by 刘波 on 16/11/7.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlackPhotoPreview : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *imageSuperView;

@property (nonatomic, strong) NSArray *images;

@property (nonatomic, strong) NSArray *imagesURLStrings;



- (void)show;

@end
