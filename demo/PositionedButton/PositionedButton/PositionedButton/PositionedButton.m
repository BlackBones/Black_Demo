//
//  PositionedButton.m
//  PositionedButton
//
//  Created by 葛佳佳 on 2016/10/13.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import "PositionedButton.h"

@implementation PositionedButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    PositionedButton *button = [super buttonWithType:buttonType];
    if (!button) {
        return nil;
    }
    
    [button initData];
    
    return  button;
}

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self initData];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    [self initData];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    
    [self initData];
    
    return self;
}

- (void)initData
{
    _imageTitleSpacing = 0;
}

- (void)setButtonPositioned:(PositionedButtonType)buttonPositioned
{
    _buttonPositioned = buttonPositioned;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setImageTitleSpacing:(CGFloat)imageTitleSpacing
{
    _imageTitleSpacing = imageTitleSpacing;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize titleSize = [self.titleLabel sizeThatFits:size];
    CGSize imageSize = [self.imageView sizeThatFits:size];
    
    switch (_buttonPositioned) {
        case PositionedButtonTypeTitleTop:
        case PositionedButtonTypeTitleBottom:
        {
            return CGSizeMake(MAX(titleSize.width, imageSize.width), titleSize.height + imageSize.height + _imageTitleSpacing);
        }
        case PositionedButtonTypeTitleLeft:
        case PositionedButtonTypeTitleRight:
        {
            return CGSizeMake(titleSize.width + imageSize.width + _imageTitleSpacing, MAX(titleSize.height, imageSize.height));
        }
    }
    
    return size;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageViewFrame = self.imageView.frame;
    
    switch (_buttonPositioned) {
        case PositionedButtonTypeTitleRight:
        {
            CGFloat sumWidth = CGRectGetWidth(titleFrame) + CGRectGetWidth(imageViewFrame) + _imageTitleSpacing;
            
            imageViewFrame.origin = CGPointMake((self.bounds.size.width - sumWidth) / 2, (self.bounds.size.height - imageViewFrame.size.height) / 2);
            self.imageView.frame = imageViewFrame;
            
            titleFrame.origin = CGPointMake(CGRectGetMaxX(imageViewFrame) + _imageTitleSpacing, (self.bounds.size.height - titleFrame.size.height) / 2);
            self.titleLabel.frame = titleFrame;
        }
            break;
        case PositionedButtonTypeTitleLeft:
        {
            CGFloat sumWidth = CGRectGetWidth(titleFrame) + CGRectGetWidth(imageViewFrame) + _imageTitleSpacing;
            
            titleFrame.origin = CGPointMake((self.bounds.size.width - sumWidth) / 2, (self.bounds.size.height - titleFrame.size.height) / 2);
            self.titleLabel.frame = titleFrame;
            
            imageViewFrame.origin = CGPointMake(CGRectGetMaxX(titleFrame) + _imageTitleSpacing, (self.bounds.size.height - imageViewFrame.size.height) / 2);
            self.imageView.frame = imageViewFrame;
        }
            break;
        case PositionedButtonTypeTitleTop:
        {
            CGFloat sumHeight = CGRectGetHeight(titleFrame) + CGRectGetHeight(imageViewFrame) + _imageTitleSpacing;
            
            titleFrame = CGRectMake(0, (self.bounds.size.height - sumHeight) / 2, self.bounds.size.width, titleFrame.size.height);
            self.titleLabel.frame = titleFrame;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            
            imageViewFrame.origin = CGPointMake((self.bounds.size.width - imageViewFrame.size.width) / 2, CGRectGetMaxY(titleFrame) + _imageTitleSpacing);
            self.imageView.frame = imageViewFrame;
        }
            break;
        case PositionedButtonTypeTitleBottom:
        {
            CGFloat sumHeight = CGRectGetHeight(titleFrame) + CGRectGetHeight(imageViewFrame) + _imageTitleSpacing;
            
            imageViewFrame.origin = CGPointMake((self.bounds.size.width - imageViewFrame.size.width) / 2, (self.bounds.size.height - sumHeight) / 2) ;
            self.imageView.frame = imageViewFrame;
            
            titleFrame = CGRectMake(0, CGRectGetMaxY(imageViewFrame) + _imageTitleSpacing, self.bounds.size.width, titleFrame.size.height);
            self.titleLabel.frame = titleFrame;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
        }
            break;
            
        default:
            break;
    }
}

@end
