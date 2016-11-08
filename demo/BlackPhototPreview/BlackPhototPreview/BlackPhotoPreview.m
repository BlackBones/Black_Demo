//
//  BlackPhotoPreview.m
//  BlackPhototPreview
//
//  Created by 刘波 on 16/11/7.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "BlackPhotoPreview.h"
#import "PhotoView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BlackPhotoPreview ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) BOOL hasShowed;

@end

@implementation BlackPhotoPreview

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        [self addSubview:self.scrollView];
    }
    
    return self;
}

- (UIScrollView *)scrollView{
    
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}


- (void)setImages:(NSArray *)images{
    
    _images = images;
    
    for (int i = 0; i < _images.count; i++) {
        PhotoView *view = [[PhotoView alloc] init];
        view.imageview.tag = i;
        
        //处理单击
        __weak __typeof(self)weakSelf = self;
        view.singleTapBlock = ^(UITapGestureRecognizer *recognizer){
            [weakSelf photoClick:recognizer];
        };
        
        [_scrollView addSubview:view];
    }
}


-(void)setImagesURLStrings:(NSArray *)imagesURLStrings{
    _imagesURLStrings = imagesURLStrings;
    
    for (int i = 0; i < _imagesURLStrings.count; i++) {
        PhotoView *view = [[PhotoView alloc] init];
        view.imageview.tag = i;
        
        //处理单击
        __weak __typeof(self)weakSelf = self;
        view.singleTapBlock = ^(UITapGestureRecognizer *recognizer){
            [weakSelf photoClick:recognizer];
        };
        
        [_scrollView addSubview:view];
    }
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    //    CGRect rect = [UIScreen mainScreen].bounds;
    rect.size.width += 5 * 2;
    _scrollView.bounds = rect;
    //    _scrollView.center = self.center;
    _scrollView.center = CGPointMake(self.bounds.size.width *0.5, self.bounds.size.height *0.5);
    
    CGFloat y = 0;
    __block CGFloat w = _scrollView.frame.size.width - 5 * 2;
    CGFloat h = _scrollView.frame.size.height;
    
    [_scrollView.subviews enumerateObjectsUsingBlock:^(PhotoView *obj, NSUInteger idx, BOOL *stop) {
        CGFloat x = 5 + idx * (5 * 2 + w);
        obj.frame = CGRectMake(x, y, w, h);
    }];
    
    _scrollView.contentSize = CGSizeMake(_scrollView.subviews.count * _scrollView.frame.size.width, _scrollView.frame.size.height);
    
    if (!self.hasShowed) {
        [self showCurrentImage];
    }
    
}

- (void)showCurrentImage{
    
//    UIView *sourceView = self.imageSuperView.subviews[0];
//    CGRect rect = [self.imageSuperView convertRect:sourceView.frame toView:self];
//    NSLog(@"imageSuperView = %@",self.imageSuperView.subviews);
//    NSLog(@"rect = %@",NSStringFromCGRect(rect));
    
    
    UIImageView *tempView = [[UIImageView alloc] init];
    tempView.frame = CGRectMake(20, 40, ScreenWidth-40 , 200);
    tempView.image = [UIImage imageNamed:@"preview.jpg"];
    [self addSubview:tempView];
    tempView.contentMode = UIViewContentModeScaleAspectFit;
    
    CGFloat placeImageSizeW = tempView.image.size.width;
    CGFloat placeImageSizeH = tempView.image.size.height;
    CGRect targetTemp;
    
    CGFloat placeHolderH = (placeImageSizeH * ScreenWidth)/placeImageSizeW;
    if (placeHolderH <= ScreenHeight) {
        targetTemp = CGRectMake(0, (ScreenHeight - placeHolderH) * 0.5 , ScreenWidth, placeHolderH);
    } else {//图片高度>屏幕高度
        targetTemp = CGRectMake(0, 0, ScreenWidth, placeHolderH);
    }
    
    //先隐藏scrollview
    _scrollView.hidden = YES;
//    _indexLabel.hidden = YES;
//    _saveButton.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        //将点击的临时imageview动画放大到和目标imageview一样大
        tempView.frame = targetTemp;
    } completion:^(BOOL finished) {
        //动画完成后，删除临时imageview，让目标imageview显示
        _hasShowed = YES;
        [tempView removeFromSuperview];
        _scrollView.hidden = NO;
//        _indexLabel.hidden = NO;
//        _saveButton.hidden = NO;
    }];
}


- (void)show{
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _contentView.center = window.center;
    _contentView.bounds = window.bounds;
    
    self.center = CGPointMake(_contentView.bounds.size.width * 0.5, _contentView.bounds.size.height * 0.5);
    self.bounds = CGRectMake(0, 0, _contentView.bounds.size.width, _contentView.bounds.size.height);
    
    [_contentView addSubview:self];
    
    window.windowLevel = UIWindowLevelStatusBar+10.0f;//隐藏状态栏
    
    [window addSubview:_contentView];
}


#pragma UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

#pragma mark 单击
- (void)photoClick:(UITapGestureRecognizer *)recognizer
{
    PhotoView *currentView = _scrollView.subviews[0];
    [currentView.scrollview setZoomScale:1.0 animated:YES];//还原
//    _indexLabel.hidden = YES;
//    _saveButton.hidden = YES;
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    if (UIDeviceOrientationIsLandscape(orientation)) {
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            [[UIApplication sharedApplication] setStatusBarOrientation:(UIInterfaceOrientation)UIDeviceOrientationPortrait];
            self.transform = CGAffineTransformIdentity;
            self.bounds = CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height);
            [self setNeedsLayout];
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            [self hidePhotoBrowser:recognizer];
        }];
    } else {
        [self hidePhotoBrowser:recognizer];
    }
}

- (void)hidePhotoBrowser:(UITapGestureRecognizer *)recognizer
{
//    PhotoView *view = (PhotoView *)recognizer.view;
//    UIImageView *currentImageView = view.imageview;
//    NSUInteger currentIndex = currentImageView.tag;
//    UIView *sourceView = self.imageSuperView.subviews[currentIndex];
//    CGRect targetTemp = [self.imageSuperView convertRect:sourceView.frame toView:self];
    
    //    NSLog(@"%@",NSStringFromCGRect(targetTemp));
    
    UIImageView *tempImageView = [[UIImageView alloc] init];
    tempImageView.image = [UIImage imageNamed:@"preview.jpg"];;
    CGFloat tempImageSizeH = tempImageView.image.size.height;
    CGFloat tempImageSizeW = tempImageView.image.size.width;
    CGFloat tempImageViewH = (tempImageSizeH * ScreenWidth)/tempImageSizeW;
    
    if (tempImageViewH < ScreenHeight) {//图片高度<屏幕高度
        tempImageView.frame = CGRectMake(0, (ScreenHeight - tempImageViewH)*0.5, ScreenWidth, tempImageViewH);
    } else {
        tempImageView.frame = CGRectMake(0, 0, ScreenWidth, tempImageViewH);
    }
    [self addSubview:tempImageView];
    
    CGRect targetTemp = CGRectMake(20, 40, ScreenWidth-40 , 200);
//    _saveButton.hidden = YES;
//    _indexLabel.hidden = YES;
    _scrollView.hidden = YES;
    self.backgroundColor = [UIColor clearColor];
    _contentView.backgroundColor = [UIColor clearColor];
    self.window.windowLevel = UIWindowLevelNormal;//显示状态栏
    [UIView animateWithDuration:0.3 animations:^{
        tempImageView.frame = targetTemp;
    } completion:^(BOOL finished) {
        [_contentView removeFromSuperview];
        [tempImageView removeFromSuperview];
    }];
}


@end









