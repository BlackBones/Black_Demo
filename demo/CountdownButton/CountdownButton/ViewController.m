//
//  ViewController.m
//  CountdownButton
//
//  Created by 刘波 on 16/5/26.
//  Copyright © 2016年 Liu Bo. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+CountDown.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*** Button需要设置为UIButtonTypeCustom***/
    [self.testBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
}

- (IBAction)testBtn:(UIButton *)sender {
    
    [sender startWithTime:10 title:@"重新获取验证码" countDownTitle:@"s" mainColor:[UIColor lightGrayColor] countColor:[UIColor redColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
