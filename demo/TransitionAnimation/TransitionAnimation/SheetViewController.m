//
//  SheetViewController.m
//  TransitionAnimation
//
//  Created by 刘波 on 2017/3/1.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import "SheetViewController.h"

@interface SheetViewController ()

@end

@implementation SheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)cancelBtn:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
