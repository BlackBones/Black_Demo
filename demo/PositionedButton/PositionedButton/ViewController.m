//
//  ViewController.m
//  PositionedButton
//
//  Created by 葛佳佳 on 2016/10/12.
//  Copyright © 2016年 Alan. All rights reserved.
//

#import "ViewController.h"
#import "PositionedButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet PositionedButton *defaultButton;

@property (weak, nonatomic) IBOutlet PositionedButton *titleLeftButton;

@property (weak, nonatomic) IBOutlet PositionedButton *titleRightButton;

@property (weak, nonatomic) IBOutlet PositionedButton *titleTopButton;

@property (weak, nonatomic) IBOutlet PositionedButton *titleBottomButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_defaultButton sizeToFit];
    
    _titleLeftButton.buttonPositioned = PositionedButtonTypeTitleLeft;
    [_titleLeftButton sizeToFit];
    
    _titleRightButton.buttonPositioned = PositionedButtonTypeTitleRight;
    [_titleRightButton sizeToFit];
    
    _titleTopButton.buttonPositioned = PositionedButtonTypeTitleTop;
    [_titleTopButton sizeToFit];
    
    _titleBottomButton.buttonPositioned = PositionedButtonTypeTitleBottom;
    [_titleBottomButton sizeToFit];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
