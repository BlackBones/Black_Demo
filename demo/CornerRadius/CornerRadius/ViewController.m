//
//  ViewController.m
//  CornerRadius
//
//  Created by 刘波 on 16/4/25.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CornerRadius.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@property (weak, nonatomic) IBOutlet UILabel *testLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [_testView roundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight Radius:20.0f];
    
    [_testLabel roundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight Radius:20.0f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
