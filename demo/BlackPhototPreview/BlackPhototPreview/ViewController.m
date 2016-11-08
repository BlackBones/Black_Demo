//
//  ViewController.m
//  BlackPhototPreview
//
//  Created by 刘波 on 16/11/4.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "ViewController.h"
#import "BlackPhotoPreview.h"
#import "PhotoView.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, self.view.bounds.size.width-40 , 200)];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    
    _imageView.image = [UIImage imageNamed:@"preview.jpg"];
    
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)]];
    
}

- (void)tapGesture{
    
    UIImage *img_1 = [UIImage imageNamed:@"preview.jpg"];
    UIImage *img_2 = [UIImage imageNamed:@"preview.jpg"];
    UIImage *img_3 = [UIImage imageNamed:@"preview.jpg"];
    
    BlackPhotoPreview *photoPreview = [[BlackPhotoPreview alloc] init];
    
    photoPreview.imageSuperView = self.view;
    
    photoPreview.images = @[img_1,img_2,img_3];
    
    [photoPreview show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
