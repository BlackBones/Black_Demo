//
//  ViewController.m
//  TransitionAnimation
//
//  Created by 刘波 on 2017/2/17.
//  Copyright © 2017年 Liu Bo. All rights reserved.
//

#import "ViewController.h"
#import "SheetViewController.h"
#import "UIViewController+Transition.h"
#import "AlertViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic,strong) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
}

- (IBAction)alertButton:(id)sender {
    
    AlertViewController *alertVC = [[AlertViewController alloc] init];
    
    [self bone_presentViewController:alertVC actionType:BBActionTypeAlert completion:nil];
}

- (IBAction)sheetButton:(id)sender {
    
    SheetViewController *sheetVC = [[SheetViewController alloc] init];
    
    [self bone_presentViewController:sheetVC actionType:BBActionTypeSheet completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
